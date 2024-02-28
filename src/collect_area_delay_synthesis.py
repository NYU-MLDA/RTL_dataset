import os.path as osp
import csv,re,sys,os

rootFolder = sys.argv[1] #Path /home/abc586/llm_ppa_predictor
dumpFolder = osp.join(rootFolder,"dump")


def extractArea(areaFile):
    with open(areaFile,'r') as rf:
        areaLine = rf.readlines()[-2]
        area = re.findall('[0-9.]+',areaLine)[-1]
    return area
    
def extractDelay(delayFile):
    delay = 0.0
    with open(delayFile,'r') as rf:
        delayLines = rf.readlines()
        for line in delayLines:
            if line.__contains__("5K_hvratio_1_1"):
                delay = re.findall('[0-9.]+',line)[-2]
                break
    return delay

def checkErrorInSynLog(synLogFile):
    with open(synLogFile,'r') as rf:
        logLine = rf.readlines()[-1]
        if logLine.__contains__("ERROR:"):
            return True
    return False
                
            
            
with open(osp.join(dumpFolder,'synthesis_data_nangate45nm.csv'), 'w', newline='') as csvfile:
    fileHeader = ['design','module','recipe_type','area','delay']
    
    writer = csv.DictWriter(csvfile, fieldnames=fileHeader)
    writer.writeheader()
    moduleCount = 0
    
    for design in os.listdir(dumpFolder):
        if design == "synthesis_data_nangate45nm.csv":
            continue
        for module in os.listdir(osp.join(rootFolder,"dump",design)):
            
            if module.endswith("_area"):
                recipe_type = "area"
                moduleName = module.split('_area')[0]
            else:
                recipe_type = "delay"
                moduleName = module.split('_speed')[0]
            
            log_file = osp.join(rootFolder,"dump",design,module,"yosys_synth.log")
            
            isError = checkErrorInSynLog(log_file)
            if isError:
                area = "error"
                delay = "error"
            else:
                area_file = osp.join(rootFolder,"dump",design,module,"synth_stat.txt")  # Area delay information
                area = extractArea(area_file)
                delay = extractDelay(log_file)
            
            writer.writerow({'design': design, 'module': moduleName,'recipe_type':recipe_type,'area':area,'delay':delay})
            moduleCount+=1

print("Synthesis data of all Verilog files has been written to 'synthesis_data_nangate45nm.csv'.")
            

            
