#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
E=101
mkdir ./jobs
mkdir ./outputs

while [ $E -lt  106 ]
do
cat <<EOF > ./jobs/job$E.txt
includeFile = ./run.txt 
i:Ts/Seed = 0
d:So/Demo/BeamEnergy = $E MeV
i:So/Demo/NumberOfHistoriesInRun = 10000
s:Sc/DoseScorer/OutputFile = "./outputs/job$E"

EOF
/Applications/topas/bin/topas ./jobs/job$E.txt
((E+=1))
done