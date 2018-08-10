#!/bin/bash

dir=$(pwd | rev | cut -d'/' -f1 | rev)

function ensure_service() {
	# grep status
	service_status=$(brew services ls | tr -s ' ' | grep $1 | cut -d' ' -f2)

	if [ "$service_status" = "stopped" ]; then
		ttab brew services start $1i
	else
		echo -e "\n $1 is up! ✅"
	fi
}

case "$dir" in

        #starts monolith
        "application") ensure_service postgres
	ensure_service redis
	echo -e "\nBooting Monolith @ 3000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾\n "
        bundle exec rails server --port=3000 &
	ttab ~/code/application/bin/deploy/sidekiq &
	wait
        ;;

	*) echo -e "\n🚫 Not a code dir! 🚫\n"
	;;

esac
