exit () {
    [[ "$DEPTH" == "0" ]] && {
        echo use builtin exit
        return
    }
    builtin exit
}

