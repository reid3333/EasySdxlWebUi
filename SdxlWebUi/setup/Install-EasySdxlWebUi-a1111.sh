#!/bin/bash

export BRANCH="feature/ubuntu"
export BRANCH_HYPHEN="${BRANCH//\//-}"
export LANG=ja_JP.UTF-8

# カレントディレクトリをスクリプトが存在するディレクトリに変更
cd "$(dirname $(realpath "$0") )"

# 必要なディレクトリやファイルが存在するか確認
if [[ ! -f "/usr/bin/curl" ]]; then
  echo "[ERROR] curl が見つかりません。"
  exit 1
fi

if [[ ! -f "/usr/bin/pwsh" ]]; then
  echo "[ERROR] pwsh が見つかりません。"
  exit 1
fi


if [[ "$PWD" =~ \  ]]; then
  echo "[ERROR] 現在のフォルダパスにスペースが含まれています。 $PWD"
  echo "スペースを含まないフォルダパスにスクリプトを移動して、再実行してください。"
  exit 1
fi

if [[ -d "SdxlWebUi/venv-a1111" ]]; then
  read -p "更新に時間がかかりますが、安全のために SdxlWebUi/venv-a1111 を削除しますか？ [y/n] " yes_or_no
  if [[ "$yes_or_no" == "y" ]]; then
    rm -rf "SdxlWebUi/venv-a1111"
  fi
else:
	echo https://www.python.org
	echo https://github.com/pypa/get-pip
	echo https://github.com/git-for-windows
	echo https://github.com/aria2/aria2
	echo https://github.com/AUTOMATIC1111/stable-diffusion-webui
	echo ""
	echo https://huggingface.co/cagliostrolab/animagine-xl-3.1
	echo https://civitai.com/models/257749
	echo https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/
	echo https://civitai.com/models/119032
	echo https://huggingface.co/gsdf/CounterfeitXL
	echo https://huggingface.co/furusu/SD-LoRA
	echo https://huggingface.co/latent-consistency/lcm-lora-sdxl
	echo https://huggingface.co/latent-consistency/lcm-lora-sdv1-5
	echo https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2
	echo https://huggingface.co/2vXpSwA7/iroiro-lora
	echo https://huggingface.co/lllyasviel/sd_control_collection
	echo ""
	echo https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
	echo https://github.com/Bing-su/adetailer
	echo https://github.com/pkuliyi2015/multidiffusion-upscaler-for-automatic1111
	echo https://github.com/adieyal/sd-dynamic-prompts
	echo https://github.com/blue-pen5805/sdweb-easy-prompt-selector
	echo https://github.com/hako-mikan/sd-webui-cd-tuner
	echo https://github.com/Mikubill/sd-webui-controlnet
	echo https://github.com/zanllp/sd-webui-infinite-image-browsing
	echo https://github.com/hako-mikan/sd-webui-lora-block-weight
	echo https://github.com/hako-mikan/sd-webui-negpip
	echo https://github.com/hako-mikan/sd-webui-supermerger
	echo https://github.com/hako-mikan/sd-webui-traintrain
	echo https://github.com/nihedon/sd-webui-weight-helper
	echo https://github.com/blue-pen5805/Stable-Diffusion-Webui-Civitai-Helper
	echo https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
	echo https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
	echo ""
	echo https://huggingface.co/spaces/Linaqruf/animagine-xl
	echo https://br-d.fanbox.cc/posts/5680274
	echo https://br-d.fanbox.cc/posts/5736236
	echo https://br-d.fanbox.cc/posts/5754786
	echo https://br-d.fanbox.cc/posts/5822703
	echo https://rentry.org/NAIwildcards
	echo https://rentry.co/NAIDv3artisttagtestoverview
	echo https://civitai.com/models/236447/based68
	echo https://rentry.org/ponyxl_loras_n_stuff
	echo https://huggingface.co/Zuntan/dist
	echo "以上の配布元から関連ファイルをダウンロードして使用します（URL を Ctrl + クリックで開けます）。"
  read -p "よろしいですか? [y/n] " yes_or_no
  if [[ "$yes_or_no" != "y" ]]; then
    exit 1
  fi
fi

if [[ -d "SdxlWebUi/setup/lib/EasySdxlWebUi-${BRANCH_HYPHEN}" ]]; then
	rm -rf "SdxlWebUi/setup/lib/EasySdxlWebUi-${BRANCH_HYPHEN}"
fi

mkdir -p "SdxlWebUi/setup/lib"

curl -Lo "SdxlWebUi/setup/lib/EasySdxlWebUi.zip" "https://github.com/reid3333/EasySdxlWebUi/archive/refs/heads/${BRANCH}.zip"
if [ $? -ne 0 ]; then
	exit $?
fi

pwsh -Command Expand-Archive -Path "SdxlWebUi/setup/lib/EasySdxlWebUi.zip" -DestinationPath "SdxlWebUi/setup/lib" -Force
if [ $? -ne 0 ]; then
	exit $?
fi

rm -f "SdxlWebUi/setup/lib/EasySdxlWebUi.zip"
if [ $? -ne 0 ]; then
	exit $?
fi

cp -fr "SdxlWebUi/setup/lib/EasySdxlWebUi-${BRANCH_HYPHEN}/." .
if [ $? -ne 0 ]; then
	exit $?
fi

./SdxlWebUi/setup/Setup-SdxlWebUi-a1111.sh
if [ $? -ne 0 ]; then
	exit $?
fi

if [ -f SdxlWebUi/setup/Install-EasySdxlWebUi-a1111.sh ]; then
  ./SdxlWebUi/setup/Setup-SdxlWebUi-Resource.sh
  if [ $? -ne 0 ]; then
    exit $?
  fi
fi

./SdxlWebUi-a1111.sh

if [ -f SdxlWebUi/setup/SdxlWebUi.sh ]; then
  rm -f SdxlWebUi/setup/SdxlWebUi.sh
fi
if [ -f SdxlWebUi/setup/SdxlWebUi-Update.sh ]; then
  rm -f SdxlWebUi/setup/SdxlWebUi-Update.sh
fi
if [ -f SdxlWebUi/setup/SdxlWebUi-ResetConfig.sh ]; then
  rm -f SdxlWebUi/setup/SdxlWebUi-ResetConfig.sh
fi
if [ -f SdxlWebUi/setup/SdxlWebUi-UpdateConfig.sh ]; then
  rm -f SdxlWebUi/setup/SdxlWebUi-UpdateConfig.sh
fi
if [ -f SdxlWebUi/setup/Install-EasySdxlWebUi-a1111.sh ]; then
  rm -f SdxlWebUi/setup/Install-EasySdxlWebUi-a1111.sh
fi

