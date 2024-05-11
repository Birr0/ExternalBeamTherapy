#!/bin/bash
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
n=100000
while [ $n -lt 500000 ]
do
cat <<EOF > ./no_protons/jobs/job$n.txt
includeFile = ./no_protons.txt 
i:Ts/Seed = 0
s:Sc/DoseScorer/OutputFile = "./no_protons/outputs/job$n"
i:So/Demo/NumberOfHistoriesInRun = $n
d:So/Demo/BeamEnergy = 125 MeV
EOF
/Applications/topas/bin/topas ./no_protons/jobs/job$n.txt
((n+=100000))
done