#!/bin/bash
OUTPUT_OPTIONS=(world asus htc)

help() {
cat <<EOF
Invoke ". mysetup.sh" from your shell to add the following functions to your environment:
- setup_output:   setup which object you want to hello while make.

EOF
}

# check to see if the supplied variant is valid
check_output()
{
    for v in ${OUTPUT_OPTIONS[@]}
    do
        if [ "$v" = "$1" ]
        then
            return 0
        fi
    done
    return 1
}

setup_output() {
    default_value=world

    export TARGET_OUTPUT=

    while [ -z "$TARGET_OUTPUT" ]
    do
        echo "OUTPUT TARGETS: ${OUTPUT_OPTIONS[@]}"
        echo -n "Which output would you like? [$default_value] "
        if [ -z "$1" ] ; then
            read ANSWER
        else
            echo $1
            ANSWER=$1
        fi

        if [ -z "$ANSWER" ] ; then
            export TARGET_OUTPUT=$default_value
            break
        else
            if check_output $ANSWER
            then
                export TARGET_OUTPUT=$ANSWER
                break
            else
                echo "** Not a valid output: $ANSWER"
            fi
        fi
    done

    echo "Your target is $TARGET_OUTPUT"
}


