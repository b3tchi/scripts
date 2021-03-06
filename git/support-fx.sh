
function registergitssh {

  pat=$1
  title=$2
  sshkey=$3

  echo $pat
  echo $title
  echo $sshkey

  # actual way (2020)
  curl -H "authorization: token $pat" \
    --data "{\"title\":\"$title\",\"key\":\"$sshkey\"}" \
    https://api.github.com/user/keys

  # in github token need prilige write:public_key
  # https://docs.github.com/rest/reference/users#create-a-public-ssh-key-for-the-authenticated-user


  # old way till (2020) - using user
  # curl -u "b3tchi" \
  #   --data "{\"title\":\"devvm_`date +%y%m%d%h%m%s`\",\"key\":\"`cat ~/.ssh/id_rsa_git.pub`\"}" \
  #   https://api.github.com/user/keys

}

function generatessh {
  email=$1
  sshsufx=$2

  keypath=~/.ssh/id_rsa_$sshsufx

  ssh-keygen -t rsa -b 4096 -C $email -f $keypath

  export SSH_PUB=$(cat $keypath)

}

# function namesshmachine {

  #naming machnies table

  # machine hosted
    # az .... azure
    # aw .... amazon workspace
    # vm .... virtual machine
    # sh .... shells
    # pm .... physical machine
    # wl .... windowssubsystemlinux

  #hwid
    # 001

  #os platform
    # w .... windows
    # l .... linux
    # a .... android
    # t .... termux
    # m .... maemo

  # os versinon
    # uu .... ubuntu
    # nn .... neon
    # ey .... elementary
    # mo .... manjaro

  #osid
    # 01

  #user
    # jn
    # lg

  # az001luu01jn
  # azure
  # 001
  # linux
  # ubuntu
  # 01
  # jn

# }









