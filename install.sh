[[ "$0" == "./install.sh" ]] || { echo 'try ./install.sh' ; exit; }
[[ -d $PWD/bh ]] || git clone -b dev https://github.com/bryanhann/bh
echo export ZDOTDIR=$PWD/bh >> ~/.zprofile
echo export ZDOTDIR=$PWD/bh >> ~/.bashrc
echo
echo start a new top level zsh session for installation to complete.
