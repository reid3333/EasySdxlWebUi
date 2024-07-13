o "Starting..."

# Set the necessary variables
SDXL_WEB_UI=$(dirname "$(readlink -f "$0")")/../../SdxlWebUi
DST_DIR=$(dirname "$(readlink -f "$0")")/../../save
BASE_NAME=Animagine31Character
ZIP_FILE_NAME="$BASE_NAME.zip"

# Check if the file already exists
if [ -e "$DST_DIR/$BASE_NAME/0000-789-1girl, souryuu asuka langley, neon genesis evangelion.webp" ]; then
  exit 0
fi

# Create the destination directory if it doesn't exist
[ ! -d "$DST_DIR" ] && mkdir -p "$DST_DIR"
pushd "$DST_DIR" || exit

# Remove existing directory and zip file if they exist
[ -d "$BASE_NAME" ] && rm -rf "$BASE_NAME"
[ -e "$ZIP_FILE_NAME" ] && rm -f "$ZIP_FILE_NAME"

# Download the zip file
"$SDXL_WEB_UI/setup/Download.sh" . "$ZIP_FILE_NAME" "https://yyy.wpx.jp/EasySdxlWebUi/$ZIP_FILE_NAME"
if [ $? -ne 0 ]; then popd; exit $?; fi

# Expand the zip file
pwsh -c "Expand-Archive -Path '$ZIP_FILE_NAME' -DestinationPath . -Force"
if [ $? -ne 0 ]; then popd; exit $?; fi

# Delete the zip file
rm -f "$ZIP_FILE_NAME"
if [ $? -ne 0 ]; then popd; exit $?; fi

popd # Return to the previous directory

echo "Finished."
