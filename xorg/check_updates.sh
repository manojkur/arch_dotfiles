#!/bin/bash
check_updates() {
    rm -f $HOME/updates.txt
    touch $HOME/updates.txt
    checkupdates | wc -l > $HOME/updates.txt
}

update_date() {
    current_date="$(date +"%A, %B %d | %l:%M:%S %p")"
    echo -e $current_date
}

get_update_count() {
    cat $HOME/updates.txt
}
