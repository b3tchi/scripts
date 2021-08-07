
function registergitssh {

  pat=$1
  title=$2
  sshkey=$3

  # pat="e50df4d8a8f369a4885229a77a4bdb0efdec357a"
  # title="DevVm_`date +%Y%m%d%H%M%S`"
  # sshkey="`cat ~/.ssh/\"$Gfilegit\".pub`"

  echo $pat
  echo $title
  echo $sshkey

  # actual way (2020)
  curl -h "authorization: token $pat" \
    --data "{\"title\":\"$title\",\"key\":\"$sshkey\"}" \
    https://api.github.com/user/keys

  # old way till (2020) - using user
  # curl -u "b3tchi" \
  #   --data "{\"title\":\"devvm_`date +%y%m%d%h%m%s`\",\"key\":\"`cat ~/.ssh/id_rsa_git.pub`\"}" \
  #   https://api.github.com/user/keys

}

function generatessh {
  email=$1
  sshsufx=$2

  keypath=~/.ssh/id_rsa_$sshsufx

  echo $keypath

  ssh-keygen -t rsa -b 4096 -C $email -f $keypath

}

function namesshmachine {

  #naming machnies table

  #hwid
    001

  #virt
    az
    aws
    vm
    na
  #os
    w - windows
    l - linux
    a - android
    t - termux
    m - maemo
  #osid
    01
  #user
    b3tchi
    lego

  001awsw01lego

}









