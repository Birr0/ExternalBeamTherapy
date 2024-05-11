#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
n=1000000
while [ $n -lt  12000000 ]
do
cat <<EOF > ./no_photons/jobs/job$n.txt
includeFile = ./run.txt 
i:Ts/Seed = 0
s:Sc/DoseScorer/OutputFile = "./no_photons/outputs/job$n"
i:So/Demo/NumberOfHistoriesInRun = $n
EOF
/Applications/topas/bin/topas ./no_photons/jobs/job$n.txt
((n+=2000000))
done