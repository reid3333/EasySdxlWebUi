#!/bin/bash

echo "Starting..."

# Change to the Lora directory
pushd "$(dirname "$(readlink -f "$0")")/Lora" || exit

# Call the respective shell scripts
./2vXpSwA7-iroiro-lora.sh
./Fixhands.sh
./Hyper-SD.sh
./MayonakaManic-LoRA.sh
./nashikone-iroiroLoRA.sh
./SDXL-Lightning.sh
./PonyNote.sh

# Return to the previous directory
popd # Equivalent to 'popd' in batch

echo "Finished."
