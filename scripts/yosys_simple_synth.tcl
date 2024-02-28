yosys -import

# Setup verilog include directories
set vIdirsArgs ""
if {[info exist ::env(VERILOG_INCLUDE_DIRS)]} {
  foreach dir $::env(VERILOG_INCLUDE_DIRS) {
    lappend vIdirsArgs "-I$dir"
  }
  set vIdirsArgs [join $vIdirsArgs]
}


# Read verilog files
#foreach file $::env(VERILOG_FILES) {
#  read_verilog -defer -sv {*}$vIdirsArgs $file
#}


read_verilog -defer -sv $::env(VERILOG_FILE)

# Read standard cells and macros as blackbox inputs
# These libs have their dont_use properties set accordingly
#read_liberty -lib {*}$::env(DONT_USE_LIBS)
read_liberty -lib $::env(SC_LIB)

# Generic synthesis
synth -top $::env(DESIGN_NAME) -flatten

# Optimize the design
opt -purge

# Technology mapping of adders
if {[info exist ::env(ADDER_MAP_FILE)] && [file isfile $::env(ADDER_MAP_FILE)]} {
  # extract the full adders
  extract_fa
  # map full adders
  techmap -map $::env(ADDER_MAP_FILE)
  techmap
  # Quick optimization
  opt -fast -purge
}

# Technology mapping of latches
if {[info exist ::env(LATCH_MAP_FILE)]} {
  techmap -map $::env(LATCH_MAP_FILE)
}

# Technology mapping of flip-flops
# dfflibmap only supports one liberty file
if {[info exist ::env(DFF_LIB_FILE)]} {
  dfflibmap -liberty $::env(DFF_LIB_FILE)
} else {
  dfflibmap -liberty $::env(SC_LIB)
}

opt

set constr [open $::env(DUMP_DIR)/abc.constr w]
puts $constr "set_driving_cell $::env(ABC_DRIVER_CELL)"
puts $constr "set_load $::env(ABC_LOAD_IN_FF)"
close $constr

if {$::env(ABC_AREA)} {
  puts "Using ABC area script."
  set abc_script $::env(SCRIPTS_DIR)/abc_area.script
} else {
  puts "Using ABC speed script."
  set abc_script $::env(SCRIPTS_DIR)/abc_speed.script
}



# Technology mapping for cells
# ABC supports multiple liberty files, but the hook from Yosys to ABC doesn't
if {[info exist ::env(ABC_CLOCK_PERIOD_IN_PS)]} {
  puts "\[FLOW\] Set ABC_CLOCK_PERIOD_IN_PS to: $::env(ABC_CLOCK_PERIOD_IN_PS)"
  abc -D [expr $::env(ABC_CLOCK_PERIOD_IN_PS)] \
      -script $abc_script \
      -liberty $::env(SC_LIB) \
      -constr $::env(DUMP_DIR)/abc.constr
} else {
  puts "\[WARN\]\[FLOW\] No clock period constraints detected in design"
  abc -script $abc_script \
      -liberty $::env(SC_LIB) \
      -constr $::env(DUMP_DIR)/abc.constr
}

# Replace undef values with defined constants
setundef -zero

# Splitting nets resolves unwanted compound assign statements in netlist (assign {..} = {..})
splitnets

# Remove unused cells and wires
opt_clean -purge

# Technology mapping of constant hi- and/or lo-drivers
#hilomap -singleton \
#        -hicell {*}$::env(TIEHI_CELL_AND_PORT) \
#        -locell {*}$::env(TIELO_CELL_AND_PORT)

# Insert buffer cells for pass through wires
# insbuf -buf {*}$::env(MIN_BUF_CELL_AND_PORTS)

# Reports
tee -o $::env(DUMP_DIR)/synth_check.txt check

# Create argument list for stat
#set stat_libs ""
#foreach lib $::env(DONT_USE_LIBS) {
#  append stat_libs "-liberty $lib "
#}
#tee -o $::env(REPORTS_DIR)/synth_stat.txt stat {*}$stat_libs

tee -o $::env(DUMP_DIR)/synth_stat.txt stat -liberty $::env(SC_LIB)

# Write synthesized design
write_verilog -noattr -noexpr -nohex -nodec $::env(DUMP_DIR)/1_1_yosys.v
