#!/bin/bash
for i in 1 2 3 4 5
do
mkdir ./jobs
#mkdir ./outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > .no_photons/jobs/job$i.txt
includeFile = run.txt 
i:Ts/Seed = $i 
s:Sc/DoseScorer/OutputFile = "./outputs/job$i"
i:So/Demo/NumberOfHistoriesInRun = 1000000
EOF

/Applications/topas/bin/topas ./jobs/job$i.txt
done