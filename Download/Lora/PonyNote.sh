o "Starting..."

# Set the necessary variables
NOTE_URL="https://rentry.org/ponyxl_loras_n_stuff"
PS1_URL="https://files.catbox.moe/2kiajb.ps1"
PONY_DIR="../../SdxlWebUi/Lora/pony_note"

# Check if the directory exists and create it if necessary
if [ -d "$(dirname "$(readlink -f "$0")")/../../SdxlWebUi/Lora/" ]; then
    [ ! -d "$PONY_DIR" ] && mkdir -p "$PONY_DIR"
else
    PONY_DIR="."
fi

CURL_CMD="/usr/bin/curl"
PS_CMD="pwsh"

# Check if curl exists
if [ ! -x "$CURL_CMD" ]; then
    echo "[ERROR] $CURL_CMD が見つかりません。"
    exit 1
fi

echo "PonyXL Notes の LoRA 一覧からダウンロードしたい LoRA を選びます。"
echo "数値による個別指定か「a」の全指定で LoRA を選び、「c」でダウンロードを開始します。"
echo
echo "LoRA のトリガーワードは基本不要です。"
echo "一部のトリガーワードが必要な LoRA は PonyXL Notes に注釈があります。"
echo
echo "何かキーを押すと PonyXL Notes を開き、ダウンロード対象の選択画面に進みます。"
echo
read -n 1 -s

echo "https://rentry.org/ponyxl_loras_n_stuff"
# xdg-open "$NOTE_URL"

echo "$CURL_CMD -k -Lo $(dirname "$0")/PonyNote.ps1 $PS1_URL"
$CURL_CMD -k -Lo "$(dirname "$0")/PonyNote.ps1" "$PS1_URL"
if [ $? -ne 0 ]; then exit $?; fi

echo "$PS_CMD -File $(dirname "$0")/PonyNote.ps1 $PONY_DIR"
$PS_CMD -File "$(dirname "$0")/PonyNote.ps1" "$PONY_DIR"
if [ $? -ne 0 ]; then exit $?; fi

echo "Finished."
