import glob,os,sys
import os.path as osp
import shutil

rootFolder = sys.argv[1] #Path /home/abc586/llm_ppa_predictor
#destDirectory = sys.argv[2]


def getAllLowLevelSrcsOfDesigns(srcDir):
    highLevelDesignFolderDict = {} # List high level design and their low level module name and path
    for techNodeFName in os.listdir(srcDir):
        if techNodeFName == 'verilog_status.csv':
            continue
        print("Entering technode --> "+str(techNodeFName))
        techNodeFPath = osp.join(srcDir,techNodeFName)
        for desFName in os.listdir(techNodeFPath):
            if desFName == '.DS_Store':
                continue
            print("Entering design --> "+str(desFName))
            if desFName in highLevelDesignFolderDict.keys():
                print("Skipping..")
                continue
            else:
                print("Parsing low level for --> "+desFName)
                lowLevelModNameAndFPath = {}
                designPath = osp.join(srcDir,techNodeFName,desFName)
                lowLevelVerilogFiles = glob.glob(osp.join(designPath,"*.v"))
                print(lowLevelVerilogFiles)
                for f in lowLevelVerilogFiles:
                    moduleName = osp.splitext(osp.basename(f))[0]
                    lowLevelModNameAndFPath[moduleName] = f
                highLevelDesignFolderDict[desFName] = lowLevelModNameAndFPath
    return highLevelDesignFolderDict

def createSynthesisScriptForLowLevelDesigns(designDict,rootFolder):
    templateSynthesisRecipe = osp.join(rootFolder,"scripts","synth_template.txt")
    endl = "\n"
    for d in designDict.keys():
        synthesisScriptForDesignsFolder = osp.join(rootFolder,"synthesis_designs",d)
        dumpForDesignsFolder = osp.join(rootFolder,"dump",d)
        
        if osp.exists(synthesisScriptForDesignsFolder):
            shutil.rmtree(synthesisScriptForDesignsFolder)
        os.mkdir(synthesisScriptForDesignsFolder)
        
        for llm in designDict[d].keys():
            vFileLocation = designDict[d][llm]
            synthScriptForArea = osp.join(synthesisScriptForDesignsFolder,"synth_"+llm+"_area.sh")
            synthScriptForSpeed = osp.join(synthesisScriptForDesignsFolder,"synth_"+llm+"_speed.sh")
            with open(synthScriptForArea,'w') as awf:
                with open(synthScriptForSpeed,'w') as swf:
                    awf.write("#!/bin/bash"+endl)
                    awf.write("export DESIGN_PAR="+d+endl)
                    awf.write("export DESIGN_NAME="+llm+endl)
                    awf.write("export ROOT_DIR="+rootFolder+endl)
                    awf.write("export DUMP_DIR=${ROOT_DIR}/dump/${DESIGN_PAR}/${DESIGN_NAME}_area"+endl)
                    awf.write("export VERILOG_FILE="+vFileLocation+endl)
                    awf.write("export ABC_AREA=1"+endl)
                    
                    swf.write("#!/bin/bash"+endl)
                    swf.write("export DESIGN_NAME="+llm+endl)
                    swf.write("export DESIGN_PAR="+d+endl)
                    swf.write("export ROOT_DIR="+rootFolder+endl)
                    swf.write("export DUMP_DIR=${ROOT_DIR}/dump/${DESIGN_PAR}/${DESIGN_NAME}_speed"+endl)
                    swf.write("export VERILOG_FILE="+vFileLocation+endl)
                    swf.write("export ABC_AREA=0"+endl)
                    
                    with open(templateSynthesisRecipe,'r') as rf:
                        fileLines = rf.readlines()
                        for fLine in fileLines:
                            awf.write(fLine)
                            swf.write(fLine)
            if not osp.exists(dumpForDesignsFolder):
                os.mkdir(dumpForDesignsFolder)    
            os.mkdir(osp.join(dumpForDesignsFolder,llm+"_area"))
            os.mkdir(osp.join(dumpForDesignsFolder,llm+"_speed"))
            os.system("chmod +x "+synthScriptForArea)
            os.system("chmod +x "+synthScriptForSpeed)
                        
srcDirectory = osp.join(rootFolder,"openROAD_low_level_modules_yosys_v1")
designLowLevelModuleDict = getAllLowLevelSrcsOfDesigns(srcDirectory)
print("Low level module parsing complete..")
createSynthesisScriptForLowLevelDesigns(designLowLevelModuleDict,rootFolder)
print("Synthesis recipe generation for low level module complete..")
