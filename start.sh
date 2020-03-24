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
        "application")
		ensure_service postgres
		ensure_service redis
		echo -e "\nBooting Monolith @ 3000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾\n "
		dos2unix bin/deploy/sidekiq
        	bin/rails s &
		wait &
		ttab ~/code/application/bin/webpack-dev-server &
		wait &
		ttab ~/code/application/bin/deploy/sidekiq &
		wait
        ;;

	#starts the integration service 
	"integrations-app")
		echo -e "\nBooting Integrations @ 5000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾\n "
		bin/rails s -p 5000 &
		ttab ~/code/integrations-app/bin/sidekiq &
		wait
	;;

	*)
		echo -e "\n🚫 $PWD is not a code dir!🚫\n"
	;;

esac
