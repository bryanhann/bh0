export BH0NEST=0
_up      () {  export BH0NEST=$((${BH0NEST}+1)); }
_down    () {  export BH0NEST=$((${BH0NEST}-1)); }
_tab     () { [[ "${BH0NEST}" == "0" ]] || for i in $( seq ${BH0NEST} ); do printf '|\\t'; done ; }
_color   () { tput setaf $1; [[ "$2" == "." ]] || tput setab $2; shift; shift; echo -n $*; tput sgr0; }
_black   () { _color 15  0 $(_tab)$*; echo; }
_blue    () { _color 15  4 $(_tab)$*; echo; }
_yellow  () { _color 16 11 $(_tab)$*; echo; }
_green   () { _color  0 10 $(_tab)$*; echo; }
_red     () { _color 15  9 $(_tab)$*; echo; }

bh0note ()      { _green "# $*" }
bh0exec ()      { _red exec: $*; $*; }
bh0export ()    { _blue "setting \$$1 := [$2]" ; export $1=$2 }
bh0call ()      { _yellow "++[$*]" ; _up ; $* ; _down ; _yellow "--[$*]"; }
bh0source ()    { bh0call source $*; }

function bh0firstrun { [[ -z "$BHPID" ]] && return 0 || return 1 }
bh0include () {
    url=https://github.com/bryanhann/$1
    #echo dst=${_INC_}/$1
    dst=$BH0_INC/$1
    [[ -d $dst ]] && bh0note found external: ${1}
    [[ -d $dst ]] || bh0note fetching external: ${1}
    [[ -d $dst ]] || bh0exec git clone $url $dst
    [[ -d $dst ]] && bh0source $dst/activate.sh
    [[ -d $dst ]] || { bh0note cannot fetch external ${1} -- giving up; return  }
}

bh0export BH0BASE $(dirname $ZDOTDIR )
