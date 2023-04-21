#!/bin/bash
uid=$(id -u)
check_run_as_root() {
  if [ "${uid}" -eq 0 ]; then echo "run as sudo"; else
    echo "Please run as root!"
    exit 1
  fi
}
manger_package() {
  info=(
    "安装该包"
    "升级该包"
    "删除该包"
    "获取包的相关信息"
    "重新安装该包"
    "修复安装该包"
    "该包依赖信息"
    "该包被依赖信息"
    "下载该包的源代码"
    "退出"
  )
  echo -e "\n\n\n\t\t\t包名称: ${pkg}\n"
  index=1
  for i in "${info[@]}"; do
    echo -e "\t\t\t${index}.${i}"
    let index++
  done
  read -p "请根据上述功能进行选择: " choice
  case $choice in
  1) sudo apt install ${pkg} -y ;;
  2) sudo apt upgrade ${pkg} -y ;;
  3)
    echo "删除的安装包 : ${pkg}"
    read -p "确定是否删除 ${pkg},输入 (y|Y): " is_remove
    if [[ "${is_remove}" =~ [yY] ]]; then
      read -p "删除包时删除配置文件? (y|Y): " is_remove_config
      [[ "${is_remove_config}" =~ [yY] ]] && sudo apt-get autoremove ${pkg} --purge
      sudo apt-get remove ${pkg}
    else
      echo "Not removed"
    fi
    ;;
  4) sudo apt-cache show ${pkg} ;;
  5) sudo apt-get install $pkg --reinstall ;;
  6) sudo apt-get install $pkg -f ;;
  7) sudo apt-cache depends $pkg ;;
  8) sudo apt-cache rdepends $pkg ;;
  9) sudo apt-get source $pkg ;;
  10) return 100 ;;
  *) echo "无效的选择,$choice!" ;;
  esac
}

menu() {
  echo -e "\t\t\tapt管理\n"
  info=(
    "更新源"
    "包管理"
    "升级所有可更新的包"
    "升级系统"
    "退出"
  )
  index=1
  for i in "${info[@]}"; do
    echo -e "\t\t\t${index}.${i}"
    let index++
  done
  read -p "Enter a number: " choice
  case $choice in
  1) sudo apt-get update ;;
  2)
    read -p "输入需要进行管理的包名: " pkg
    while true; do
      manger_package $pkg
      [ $? -eq 100 ] && break
    done
    ;;
  3) sudo apt-get upgrade ;;
  4) sudo apt-get dist-upgrade ;;
  5)
    echo "exit"
    exit 0
    ;;
  *) echo "无效的选择,$choice!" ;;
  esac
}

main() {
  check_run_as_root
  while true; do
    menu
  done
}
main
