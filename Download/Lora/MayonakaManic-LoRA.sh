#!/bin/bash

echo "Starting..."

# Open the URL in the default web browser
# xdg-open https://huggingface.co/MayonakaManic/LoRA

# Set the SDXL_WEB_UI variable
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
pushd "$SDXL_WEB_UI/Lora" || exit

# Download the files using wget or curl (assuming Download.sh is a placeholder for these commands)
"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessChibiAndDollsXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessChibiAndDolls/LECO_LessChibiAndDollsXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessGoreAndAnatomyXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessGoreAndAnatomy/LECO_LessGoreAndAnatomyXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessHarshEmotionsXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessHarshEmotions/LECO_LessHarshEmotionsXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessMonsterGirlsXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMonsterGirls/LECO_LessMonsterGirlsXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessSimpleBackgroundXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessSimpleBackground/LECO_LessSimpleBackgroundXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessTraditionsAndCulturesXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessTraditionsAndCultures/LECO_LessTraditionsAndCulturesXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessMuscularityXL.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMuscularityXL.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic LECO_LessMuscularityXL_forPony.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LECO/LECO_LessMuscularityXL_forPony.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic MN_+Skinny-CurvySliderXL_forAnimagine.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LoRA/SkinnyCurvySliderXL/MN_+Skinny-CurvySliderXL_forAnimagine.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

"$SDXL_WEB_UI/setup/Download.sh" MayonakaManic MN_+Skinny-CurvySliderXL_forEbaraPony.safetensors \
https://huggingface.co/MayonakaManic/LoRA/resolve/main/LoRA/SkinnyCurvySliderXL/MN_+Skinny-CurvySliderXL_forEbaraPony.safetensors
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Equivalent to 'popd' in batch

echo "Finished."
