#!/bin/bash

dir=$(pwd | cut -d'/' -f5)

case "$dir" in

        "onboarding") echo -e "Booting Onboarding @ 6000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server --port=6000 -b 0.0.0.0
        ;;

        "onboarding_data_service") echo -e "Booting OnboardingDataService @ 6002\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server --port=6002 -b 0.0.0.0
        ;;

        "api_gateway-1") echo -e "Booting Api Gateway\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec puma -C config/puma.rb
        ;;

        "auth_service") echo -e "Booting Auth Service @ 3123\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server
        ;;

        "backoffice") echo -e "Booting Backoffice @ 3004\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server --port=3004 -b 0.0.0.0
        ;;

        "adapter") echo -e "Booting Adapter @ 7000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server --port=7000
        ;;

        "gateway") echo -e "Booting Card Gateway @ 3003\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        bundle exec rails server --port=3003 -b 0.0.0.0
        ;;

        #starts banking
        *) echo -e "Booting Banking @ 3000\n🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 🐾 "
        EVENT_NOTIFIER_REGISTRY=generic PROJECT=generic LOCALE=en bundle exec rails server -b 0.0.0.0 --port=3000
        ;;

esac
