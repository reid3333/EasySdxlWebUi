#!/bin/bash

echo "Starting..."

# Change to the Forge directory
pushd "$(dirname "$(readlink -f "$0")")/Forge" || exit

# Call the Zero123.sh script
./Zero123.sh

# Return to the previous directory
popd # Equivalent to 'popd' in batch

echo "Finished."
