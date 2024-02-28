#!/bin/bash
export DESIGN_NAME=wishbone_debug_master
export DESIGN_PAR=microwatt
export ROOT_DIR=/home/abc586/currentResearch/llm_ppa_predictor
export DUMP_DIR=${ROOT_DIR}/dump/${DESIGN_PAR}/${DESIGN_NAME}_speed
export VERILOG_FILE=/home/abc586/currentResearch/llm_ppa_predictor/openROAD_low_level_modules_yosys_v1/sky130hd/microwatt/wishbone_debug_master.v
export ABC_AREA=0

#export DESIGN_NICKNAME=gcd
#export DESIGN_NAME=gcd
#export VERILOG_FILE=/home/abc586/currentResearch/llm_ppa_predictor/designs/gcd.v
#export DUMP_DIR=${ROOT_DIR}/dump/${DESIGN_NAME}
#export ABC_AREA=1


export SCRIPTS_DIR=${ROOT_DIR}/scripts
export SYNTH_SCRIPT=${SCRIPTS_DIR}/yosys_simple_synth.tcl

export SC_LIB=/home/abc586/tools/orfs/OpenROAD-flow-scripts/flow/platforms/nangate45/lib/NangateOpenCellLibrary_typical.lib
#export ADDER_MAP_FILE=/home/abc586/tools/orfs/OpenROAD-flow-scripts/flow/platforms/nangate45/cells_adders.v
export ABC_DRIVER_CELL=BUF_X1
export ABC_LOAD_IN_FF=3.898
#export ABC_CLOCK_PERIOD_IN_PS=460

nohup yosys -c ${SYNTH_SCRIPT} > ${DUMP_DIR}/yosys_synth.log 2>&1 & 
