#!/bin/bash

# OUTPUT-COLORING
red='\e[0;31m'
green='\e[0;32m'
yellow='\e[0;33m'
cyan='\e[0;36m'
NC='\e[0m' # No Color

#echo -e "${green}$1${NC}"
OK="${green}OK${NC}"
WW="${yellow}WW${NC}"
EE="${red}EE${NC}"
II="${cyan}II${NC}"

if [ ! -f $log ]; then
  # echo "init" >> $log
  touch $log
fi

function deploy {

  step=$1
  type=$2
  # log=$2

  if [[ $type == "onetime" ]]; then
    steprgx="^${step}$"
    if grep -q $steprgx $log; then
      echo -e "$II - $step ... already installed - skipping"
      return
    fi
  fi


  # if ! grep -q $steprgx $log; then

    file=${sdir}/${system}/${type}/${step}.sh

    chmod +x $file

    if [[ -e $file ]]; then

      #run script
      # $($file)
      source $file

      if [[ $? -eq 0 ]]; then
        echo $step >> $log
        echo -e "$OK - $step"
      else
        echo -e "$EE - $step ... execution failed"
      fi

    else
      echo -e "$WW - $step ... not found - skipping"
    fi
  # else
  #
  # fi
}

