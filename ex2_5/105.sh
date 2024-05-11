#!/bin/bash
for n in 1 2 3 4 5 6 7 8 9 10
do
mkdir ./complete_jobs
mkdir ./complete_outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./complete_jobs/job$n.txt
includeFile = run.txt 
d:So/Demo/BeamEnergy = 105 MeV
i:So/Demo/NumberOfHistoriesInRun = 100000
i:Ts/Seed = $n
s:Sc/DoseScorer/OutputFile = "./complete_outputs/job$n"
EOF

/Applications/topas/bin/topas ./complete_jobs/job$n.txt
done