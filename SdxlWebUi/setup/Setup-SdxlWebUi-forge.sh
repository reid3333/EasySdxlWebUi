#!/bin/bash
set -e

# Change to the script's directory and move up one level
SCRIPT_DIR=$(dirname $(readlink -f "$0"))
cd "$SCRIPT_DIR/.."

# Call the GitCloneOrPull script
"$SCRIPT_DIR/GitCloneOrPull.sh" https://github.com/lllyasviel/stable-diffusion-webui-forge main
if [ $? -ne 0 ]; then
  exit $?
fi

# Checkout specific branch and commit
git -C stable-diffusion-webui-forge fetch origin pull/608/head:Dora
if [ $? -ne 0 ]; then
  exit $?
fi

git -C stable-diffusion-webui-forge checkout -b main_29be1da_Dora 29be1da
if [ $? -ne 0 ]; then
  git -C stable-diffusion-webui-forge checkout -f main_29be1da_Dora
fi
if [ $? -ne 0 ]; then
  exit $?
fi

# Merge the Dora branch
echo "git -C stable-diffusion-webui-forge merge --no-edit Dora"
git -C stable-diffusion-webui-forge merge --no-edit Dora
if [ $? -ne 0 ]; then
  exit $?
fi

# Activate the virtual environment
source "$SCRIPT_DIR/ActivateVirtualEnvironment.sh" venv-forge
if [ $? -ne 0 ]; then
  exit $?
fi

# Upgrade pip
echo "python -m pip install -qq --upgrade pip"
python -m pip install -qq --upgrade pip
if [ $? -ne 0 ]; then
  exit $?
fi

# Return to the previous directory
cd "$SCRIPT_DIR/.."

# Call the common setup script
"$SCRIPT_DIR/Setup-SdxlWebUi-Common.sh" stable-diffusion-webui-forge forge
if [ $? -ne 0 ]; then
  exit $?
fi

# Change to the extensions directory
cd stable-diffusion-webui-forge/extensions

# Call the GitCloneOrPull script for each repository
"$SCRIPT_DIR/GitCloneOrPull.sh" https://github.com/hinablue/adetailer
if [ $? -ne 0 ]; then
  exit $?
fi

"$SCRIPT_DIR/GitCloneOrPull.sh" https://github.com/layerdiffusion/sd-forge-layerdiffuse
if [ $? -ne 0 ]; then
  exit $?
fi

if [ -d sd-forge-layerdiffusion ]; then
  rm -rf sd-forge-layerdiffusion
fi

"$SCRIPT_DIR/GitCloneOrPull.sh" https://github.com/Haoming02/sd-forge-couple
if [ $? -ne 0 ]; then
  exit $?
fi

# Uncomment the following lines if needed
# "$SCRIPT_DIR/GitCloneOrPull.sh" https://github.com/continue-revolution/sd-forge-animatediff
# if [ $? -ne 0 ]; then
#   exit $?
# fi

# Return to the original directory
cd "$SCRIPT_DIR/../.."
