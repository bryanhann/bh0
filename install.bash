echo $0
pushd $(dirname $0)
source ./globals.sh
#[[ -d $BH1 ]] || git clone -b snappy https://github.com/bryanhann/bh $BH1
echo export ZDOTDIR=$PWD >> ~/.zprofile
echo export ZDOTDIR=$PWD >> ~/.bashrc
echo
echo start a new top level zsh session for installation to complete.
popd
