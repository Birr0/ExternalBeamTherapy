#!/bin/bash
for n in 1 2 3 4 5
do
mkdir ./jobs
mkdir ./outputs
export TOPAS_G4_DATA_DIR="/Applications/G4Data"
export QT_QPA_PLATFORM_PLUGIN_PATH="/Applications/topas/Frameworks"
cat <<EOF > ./jobs/fixed_job$n.txt
includeFile = neutron_production.txt 
i:Ts/Seed = $n
s:Sc/DoseScorer/OutputFile = "./outputs/fixed_DoseScore_$n"
s:Sc/PhantomDoseScorer/OutputFile = "./outputs/phantom_DoseScore_$n"

#s:Sc/SurfaceScorer/OutputFile = "./outputs/fixed_SurfaceScore_$n"
EOF

/Applications/topas/bin/topas ./jobs/fixed_job$n.txt
done