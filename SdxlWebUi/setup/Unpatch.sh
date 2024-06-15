#!/bin/bash

export LANG=ja_JP.UTF-8

script_dir="$(dirname "$(readlink -f "$0")")"

if [ ! -d "${script_dir}/lib" ]; then
  mkdir "${script_dir}/lib"
fi

pushd "${script_dir}/lib" >/dev/null

# 引数を指定しないとこのスクリプトの$1が引き継がれてしまう
source "${script_dir}/ActivateVirtualEnvironment.sh" ""
if [ $? -ne 0 ]; then
  popd && exit $?
fi

pip install -q unidiff
if [ $? -ne 0 ]; then
  read -p "Install failed. Press enter to continue"
  popd && exit $?
fi

popd >/dev/null

python "${script_dir}/unpatch.py" "$@"
if [ $? -ne 0 ]; then
  read -p "Unpatch failed. Press enter to continue"
  exit $?
fi
