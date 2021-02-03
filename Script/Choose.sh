#!/bin/bash
source config.sh
options=("Update" "Open" "Quit")
select action in "${options[@]}"; do
    case $action in
        "Update")
            echo "Updating..."
            bash -c "cd $directory; ./Update.sh"
            break
            ;;
        "Open")
            echo "Opening..."
            bash -c "cd $directory; ./Open.sh"
            break
            ;;
	    "Quit")
	        echo "User requested exit"
	        exit
	        ;;
        *) echo "invalid option $REPLY";;
    esac
done