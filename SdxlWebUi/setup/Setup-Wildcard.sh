#!/bin/bash

export LANG=ja_JP.UTF-8

SCRIPT_DIR=$(dirname "$(readlink -f "$0")")

pushd "${SCRIPT_DIR}/../Wildcard"

cp -r ${SCRIPT_DIR}/res/wildcards/* .

download_file() {
    mkdir -p $1
    curl -o "$1/$2" "$3"
    if [ $? -ne 0 ]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
}

download_file "animagine" "character.txt" "https://huggingface.co/spaces/Linaqruf/animagine-xl/resolve/main/wildcard/character.txt"
download_file "anmg31" "char_add.txt" "https://huggingface.co/spaces/cagliostrolab/animagine-xl-3.1/resolve/main/wildcard/character31.txt"

if [ ! -f "anmg31/char_full.txt" ]; then
    download_file "anmg31" "char_full.txt" "https://huggingface.co/spaces/cagliostrolab/animagine-xl-3.1/resolve/main/wildcard/characterfull.txt"
    pwsh -Command "try { (Get-Content 'anmg31/char_full.txt') -replace '1girl, , original', '' | Set-Content 'anmg31/char_full.txt' } catch { exit 1 }"
    if [ $? -ne 0 ]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
fi

if [ ! -f "pony/female.txt" ]; then
    download_file "pony" "female.txt" "https://files.catbox.moe/oklpz8.txt"
    pwsh -Command "try { (Get-Content 'pony/female.txt') -replace '_\(', ' (' -replace '\)', ')' | Set-Content 'pony/female.txt' } catch { exit 1 }"
    if [ $? -ne 0 ]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
fi

if [ ! -f "pony/male.txt" ]; then
    download_file "pony" "male.txt" "https://files.catbox.moe/1lptzn.txt"
    pwsh -Command "try { (Get-Content 'pony/male.txt') -replace '_\(', ' (' -replace '\)', ')' | Set-Content 'pony/male.txt' } catch { exit 1 }"
    if [ $? -ne 0 ]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
fi

if [[ ! -d "bd" ]]; then
    mkdir -p ${SCRIPT_DIR}/lib
    curl -Lo "${SCRIPT_DIR}/lib/bd.zip" "https://downloads.fanbox.cc/files/post/5680274/IUTQ62gtRAYNNIQHMwWtm5Mg.zip"
    if [[ $? -ne 0 ]]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    
    unzip -O cp932 ${SCRIPT_DIR}/lib/bd.zip -d ${SCRIPT_DIR}/lib/bd/
    if [[ $? -ne 0 ]]; then
        echo "Unzip failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    rm -f "${SCRIPT_DIR}/lib/bd.zip"
    
    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_エフェクト.yml"
    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_コーデ.yml"
    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_ファンタジコーデ.yml"
    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_感情.yml"
    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_旅.yml"
    pwsh -Command "try { &{(Get-Content '${SCRIPT_DIR}/lib/bd/旅.txt') -replace 'BREAK.*$', '' | Set-Content '${SCRIPT_DIR}/lib/bd/bg.txt' } } catch { exit 1 }"

    mkdir -p "bd"

    mv -f "${SCRIPT_DIR}/lib/bd/エフェクト.txt" "bd/effect.txt"
    mv -f "${SCRIPT_DIR}/lib/bd/コーデ.txt" "bd/outfit.txt"
    mv -f "${SCRIPT_DIR}/lib/bd/ファンタジーコーデ.txt" "bd/fantasy_outfit.txt"
    mv -f "${SCRIPT_DIR}/lib/bd/感情.txt" "bd/emotion.txt"
    mv -f "${SCRIPT_DIR}/lib/bd/旅.txt" "bd/journey.txt"
    mv -f "${SCRIPT_DIR}/lib/bd/bg.txt" "bd/bg.txt"
fi

if [[ ! -f "bd/situation.txt" ]]; then
    mkdir -p ${SCRIPT_DIR}/lib
    curl -Lo "${SCRIPT_DIR}/lib/bd_situ.zip" "https://downloads.fanbox.cc/files/post/5754786/IT4TSnDvgWu21nis0hxY0Vkm.zip"
    if [[ $? -ne 0 ]]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    
    unzip -O cp932 ${SCRIPT_DIR}/lib/bd_situ.zip -d ${SCRIPT_DIR}/lib/bd/
    if [[ $? -ne 0 ]]; then
        echo "Unzip failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    rm -f "${SCRIPT_DIR}/lib/bd_situ.zip"

    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_シチュエーション.yml"

    mv -f "${SCRIPT_DIR}/lib/bd/シチュエーション.txt" "bd/situation.txt"
fi

if [[ ! -f "bd/new_fantasy_outfit.txt" ]]; then
    mkdir -p ${SCRIPT_DIR}/lib
    curl -Lo "${SCRIPT_DIR}/lib/bd_nfo.zip" "https://downloads.fanbox.cc/files/post/5822703/VhuspaHInNLgrra6qhQWKtNC.zip"
    if [[ $? -ne 0 ]]; then
        echo "Download failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    
    unzip -O cp932 ${SCRIPT_DIR}/lib/bd_nfo.zip -d ${SCRIPT_DIR}/lib/bd/
    if [[ $? -ne 0 ]]; then
        echo "Expansion failed, exiting..."
        read -p "Press enter to continue..."
        popd
        exit $?
    fi
    rm -f "${SCRIPT_DIR}/lib/bd_nfo.zip"

    pwsh -File "${SCRIPT_DIR}/EpsCategory2Wildcard.ps1" "${SCRIPT_DIR}/lib/bd/BD_Newファンタジーコーデ.yml"

    mv -f "${SCRIPT_DIR}/lib/bd/Newファンタジーコーデ.txt" "bd/new_fantasy_outfit.txt"
fi

download_file "nai" "bdsm.txt" https://pastebin.com/raw/yNeiK7BL
download_file "nai" "bdsm_item.txt"  https://rentry.org/osttx/raw
download_file "nai" "bdsm_outfit.txt"  https://pastebin.com/raw/LZKytJys
download_file "nai" "character.txt"  https://pastebin.com/raw/SpRg5EBK
pwsh -Command "try { &{(Get-Content 'nai/character.txt') -replace '\\\', '' -replace '\(', '\(' -replace '\)', '\)' | Set-Content 'nai/character.txt' } } catch { exit 1 }"
if [[ $? -ne 0 ]]; then
    echo "character.txt modify failed, exiting..."
    read -p "Press enter to continue..."
    popd
    exit $?
fi

download_file "nai" "clothing.txt" "https://pastebin.com/raw/pg3ef3CN"
download_file "nai" "cum.txt" "https://rentry.org/hoom5/raw"
download_file "nai" "exposing.txt" "https://pastebin.com/raw/FySHX8bK"
download_file "nai" "fetish.txt" "https://rentry.org/qm6dx/raw"
download_file "nai" "framing.txt" "https://rentry.org/7droi/raw"
download_file "nai" "hair.txt" "https://rentry.org/gzmd7/raw"
download_file "nai" "lingerie.txt" "https://rentry.org/kgg24/raw"
download_file "nai" "lingerie_state.txt" "https://rentry.org/nxgvi/raw"
download_file "nai" "location.txt" "https://rentry.org/uh9p5/raw"
download_file "nai" "naked_outfit.txt" "https://rentry.org/wquaq/raw"
download_file "nai" "pose.txt" "https://rentry.org/m9dz6/raw"
download_file "nai" "publicity.txt" "https://rentry.org/hqv3p/raw"
download_file "nai" "sex_act.txt" "https://rentry.org/k5auh/raw"
download_file "nai" "sex_face.txt" "https://rentry.org/gt8wk/raw"

