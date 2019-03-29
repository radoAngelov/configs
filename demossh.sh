#!/bin/bash

# ssh to demo scene with kubernetes

if [ ! -z "$1" ]
  then
	pod_name=$(kubectl -n $1 get pods | grep monolith-sidekiq | cut -d' ' -f1)
	kubectl -n $1 exec -it $pod_name -- bash
	
	exit 1
fi

read -p "Please specify your demo scene name(https://overseer.receipt-labs.com/scenes): " demo_scene
read -p "Please specify app name (Leave blank for monolith): " app_name
read -p "Please specify component name (Leave blank for sidekiq): " component_name

app_name=${app_name:-monolith}
component_name=${component_name:-sidekiq}

pod_name=$(kubectl -n $demo_scene get pods | grep "$app_name-$component_name" | cut -d' ' -f1)
kubectl -n $demo_scene exec -it $pod_name -- bash
