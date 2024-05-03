#!/bin/bash
export LANG=ja_JP.UTF-8

script_dir=$(dirname "$(realpath "$0")")

if [ ! -d "${script_dir}/lib" ]; then
    mkdir "${script_dir}/lib"
fi

pushd "${script_dir}/lib"

source "${script_dir}/ActivateVirtualEnvironment.sh"
if [ $? -ne 0 ]; then
    popd
    exit $?
fi

pip install -q unidiff
if [ $? -ne 0 ]; then
    read -p "続けるにはエンターキーを押してください"
    popd
    exit $?
fi

popd

python "${script_dir}/patch.py" "$@"
if [ $? -ne 0 ]; then
    read -p "続けるにはエンターキーを押してください"
    exit $?
fi
