#!/bin/bash

echo "Starting..."

# Change to the Model directory
pushd "$(dirname "$(readlink -f "$0")")/Model" || exit

# Call the respective shell scripts
./7th_LayerXL.sh
./animagine-xl-3.1.sh
./ebara_pony.sh
./loliDiffusion.sh
./rumblexl.sh
./SwampMachine.sh
./Zipang.sh

# Return to the previous directory
popd # Equivalent to 'popd' in batch

echo "Finished."
