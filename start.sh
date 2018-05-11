#!/bin/bash

dir=$(pwd | cut -d'/' -f5)

case "$dir" in

	"onboarding") echo "$dir is starting"
	echo "******************************"
	bundle exec rails server --port=6000 -b 0.0.0.0
	;;

	"onboarding_data_service") echo $dir is starting""
	echo "******************************"
	bundle exec rails server --port=6002 -b 0.0.0.0
	;;

	"api_gateway-1") echo "$dir is starting"
	echo "******************************"
	bundle exec puma -C config/puma.rb
	;;

	"auth_service") echo "$dir is starting"
	echo "******************************"
	bundle exec rails server
	;;

	"backoffice") echo "$dir is starting"
	echo "******************************"
	bundle exec rails server --port=3004 -b 0.0.0.0
	;;

	"adapter") echo "$dir is starting"
	echo "******************************"
	bundle exec rails server --port=7000
	;;

	"gateway") echo "$dir is starting"
	echo "******************************"
	bundle exec rails server --port=3003 -b 0.0.0.0
	;;

	#starts banking
	*) echo "$dir is starting"
	echo "******************************"
	EVENT_NOTIFIER_REGISTRY=generic PROJECT=generic LOCALE=en bundle exec rails server -b 0.0.0.0 --port=3000
	;;

esac
