import os,sys
import os.path as osp
import csv,subprocess
import time


rootFolder = sys.argv[1] #Path /home/abc586/llm_ppa_predictor
synthesis_path = os.path.join(rootFolder, 'synthesis_designs')

with open(os.path.join(synthesis_path,'synthesis_status.csv'), 'w', newline='') as csvfile:
    fieldnames = ['filepath', 'status']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
    writer.writeheader()
    count = 0

    for root, dirs, files in os.walk(synthesis_path):
        for file in files:
            if file.endswith('.sh'):
                filepath = os.path.join(root, file)

                # use subprocess to run the command and capture the output
                result = subprocess.run(['sh', filepath], stdout=subprocess.PIPE, stderr=subprocess.PIPE)

                if result.returncode == 0:
                    status = 'Successful'
                else:
                    #status = f"Failed. Error: {result.stderr.decode('utf-8')}"
                    status= 'Failed'
                # write the data to the CSV file
                writer.writerow({'filepath': '/'.join(filepath.split('/')[3:]), 'status': status})
                if count % 10 == 0:
                    count = 0
                    time.sleep(3)
                count+=1

print("Synthesis status of all Verilog files has been written to 'synthesis_status.csv'.")
