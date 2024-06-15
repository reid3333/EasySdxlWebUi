#!/bin/bash

SCRIPT_DIR="$(dirname $(readlink -f $0))"
pushd "${SCRIPT_DIR}/.."

download() {
    local dir=$1
    local file=$2
    local url=$3
    bash ${SCRIPT_DIR}/Download.sh "$dir" "$file" "$url"
    if [ $? -ne 0 ]; then
        popd
        exit $?
    fi
}

download "Model/Anmg" "animagine-xl-3.0.safetensors" "https://huggingface.co/cagliostrolab/animagine-xl-3.0/resolve/main/animagine-xl-3.0.safetensors"
download "Model/Anmg" "animagine-xl-3.1.safetensors" "https://huggingface.co/cagliostrolab/animagine-xl-3.1/resolve/main/animagine-xl-3.1.safetensors"
download "Model/Pony" "ponyDiffusionV6XL_v6StartWithThisOne.safetensors" "https://huggingface.co/Zuntan/dist/resolve/main/ponyDiffusionV6XL_v6StartWithThisOne.safetensors"
download "Vae" "sdxl_vae.safetensors" "https://huggingface.co/madebyollin/sdxl-vae-fp16-fix/resolve/main/sdxl_vae.safetensors"
download "Embedding" "unaestheticXL2v10.safetensors" "https://civitai.com/api/download/models/302265"
download "Embedding" "negativeXL_D.safetensors" "https://huggingface.co/gsdf/CounterfeitXL/resolve/main/embeddings/negativeXL_D.safetensors"
download "Lora/lcm" "lcm-animagine-3.safetensors" "https://huggingface.co/furusu/SD-LoRA/resolve/main/lcm-animagine-3.safetensors"
download "Lora/lcm" "lcm-lora-sdxl.safetensors" "https://huggingface.co/latent-consistency/lcm-lora-sdxl/resolve/main/pytorch_lora_weights.safetensors"
download "Lora/iroiro" "sdxl-flat.safetensors" "https://huggingface.co/2vXpSwA7/iroiro-lora/resolve/main/sdxl/sdxl-flat.safetensors"
download "Lora" "Fixhands_anime_bdsqlsz_V1.safetensors" "https://huggingface.co/bdsqlsz/stable-diffusion-xl-anime-5.2/resolve/main/Fixhands_anime_bdsqlsz_V1.safetensors"
download "Lora/SDXL-Lightning" "sdxl_lightning_2step_lora.safetensors" "https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_2step_lora.safetensors"
download "Lora/SDXL-Lightning" "sdxl_lightning_8step_lora.safetensors" "https://huggingface.co/ByteDance/SDXL-Lightning/resolve/main/sdxl_lightning_8step_lora.safetensors"
download "Upscaler" "4x-UltraSharp.pth" "https://huggingface.co/Zuntan/dist/resolve/main/4x-UltraSharp.pth"
download "Upscaler" "4x-AnimeSharp.pth" "https://huggingface.co/Zuntan/dist/resolve/main/4x-AnimeSharp.pth"
download "Upscaler" "4x_foolhardy_Remacri.pth" "https://huggingface.co/Zuntan/dist/resolve/main/4x_foolhardy_Remacri.pth"
download "ControlNet" "ip-adapter_xl.pth" "https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_xl.pth"

popd

