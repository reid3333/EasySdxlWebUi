#!/bin/bash

echo "Starting..."

# Change to the Image directory
pushd "$(dirname "$(readlink -f "$0")")/Image" || exit

# Call the Animagine31Character.sh script
./Animagine31Character.sh

# Return to the previous directory
popd # Equivalent to 'popd' in batch

echo "Finished."
