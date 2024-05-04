#!/bin/bash

export LANG=ja_JP.UTF-8

SD_DIR=$1
SD_NAME=$2

SCRIPT_DIR="$(dirname $(readlink -f $0))"

pushd $SCRIPT_DIR/..

pip -qq install "tensorflow==2.15.1"
if [ $? -ne 0 ]; then
    read -p "Install failed. Press any key to continue..." key
    popd
    exit $?
fi

pip -qq install albumentations==1.4.3 pydantic==1.10.15
if [ $? -ne 0 ]; then
    read -p "Install failed. Press any key to continue..." key
    popd
    exit $?
fi

pip -qq install tensorflow_io
if [ $? -ne 0 ]; then
    read -p "Install failed. Press any key to continue..." key
    popd
    exit $?
fi

cp -f setup/Install-EasySdxlWebUi-a1111.sh ../SdxlWebUi-Update-a1111.sh
cp -f setup/Install-EasySdxlWebUi-forge.sh ../SdxlWebUi-Update-forge.sh

[ ! -f config.json ] && cp -f ${SCRIPT_DIR}/res/config.json .
[ ! -f ui-config.json ] && cp -f ${SCRIPT_DIR}/res/ui-config.json .
[ ! -f styles.csv ] && cp -f ${SCRIPT_DIR}/res/styles.csv .

# Update JSON configurations
update_json() {
    local src_json=$1
    local dst_json=$2
    if [ ! -f $dst_json ]; then
        cp -f $src_json $dst_json
    else
        python ${SCRIPT_DIR}/update_json.py $src_json $dst_json
        if [ $? -ne 0 ]; then
            read -p "Press any key to continue..." key
            exit $?
        fi
    fi
}

update_json setup/res/config-$SD_NAME.json $SD_DIR/config.json
update_json setup/res/ui-config-$SD_NAME.json $SD_DIR/ui-config.json

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/Stable-diffusion" "Model"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/VAE" "Vae"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/embeddings" "Embedding"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/Lora" "Lora"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Download.sh Lora Fixhands_anime_bdsqlsz_V1.safetensors https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2/resolve/main/Fixhands_anime_bdsqlsz_V1.safetensors
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Download.sh Lora/Hyper-SD Hyper-SDXL-8steps-lora.safetensors https://huggingface.co/ByteDance/Hyper-SD/resolve/main/Hyper-SDXL-8steps-lora.safetensors
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/ESRGAN" "Upscaler"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/ControlNet" "ControlNet"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Download.sh ControlNet  htte-anystyle_v3-step00004000.safetensors https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/test_controlnet/cnlllite-anystyle_v3-step00004000.safetensors
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

mkdir -p TaggerDeepDanboooru
bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/deepdanbooru" "TaggerDeepDanboooru"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

mkdir -p TaggerOnnx
bash ${SCRIPT_DIR}/Link.sh "$SD_DIR/models/TaggerOnnx" "TaggerOnnx"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

popd
pushd ${SCRIPT_DIR}/../${SD_DIR}/extensions

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/adieyal/sd-dynamic-prompts
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/p1atdev/sd-danbooru-tags-upsampler
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/blue-pen5805/sdweb-easy-generate-forever
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/blue-pen5805/sdweb-easy-prompt-selector
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-cd-tuner
if [ $? -ne 0 ]; then
    popd
    exit $?
fi


bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/zanllp/sd-webui-infinite-image-browsing
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-lora-block-weight
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-negpip
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-regional-prompter
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-supermerger
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/hako-mikan/sd-webui-traintrain
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/nihedon/sd-webui-weight-helper
if [ $? -ne 0 ]; then
    popd
    exit $?
fi


bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/butaixianran/Stable-Diffusion-Webui-Civitai-Helper
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/GitCloneOrPull.sh https://github.com/Katsuyuki-Karasawa/stable-diffusion-webui-localization-ja_JP
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Unpatch.sh "${SCRIPT_DIR}/res/wd14-tagger_wd14v3.patch"
bash ${SCRIPT_DIR}/GitCloneOrPull.sh "https://github.com/picobyte/stable-diffusion-webui-wd14-tagger"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Patch.sh "${SCRIPT_DIR}/res/wd14-tagger_wd14v3.patch"

cp -f "${SCRIPT_DIR}/res/lora_block_weight/lbwpresets.txt" "sd-webui-lora-block-weight/scripts/"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "sdweb-easy-prompt-selector/tags" "${SCRIPT_DIR}/../EasyPromptSelector"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Link.sh "sd-dynamic-prompts/wildcards" "${SCRIPT_DIR}/../Wildcard"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

bash ${SCRIPT_DIR}/Setup-Wildcard.sh
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

exit 0

