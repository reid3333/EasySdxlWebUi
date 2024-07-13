#!/bin/bash

echo "Starting..."

# Change to the Tagger directory
pushd "$(dirname "$(readlink -f "$0")")/Tagger" || exit

# Call the Z3D-E621-Convnext.sh script
./Z3D-E621-Convnext.sh

# Return to the previous directory
popd # Equivalent to 'popd' in batch

echo "Finished."
