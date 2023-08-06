#!/bin/bash

IPFS_PATH="/ipfs_data/data"

echo "REGISTERING DAEMON IN IP: $IPFS_IP_ADDRESS"

# Replace "YOUR_DIRECTORY_PATH" with the directory you want to check
target_directory="$IPFS_PATH"

# Replace "exec command" with the actual command you want to execute
command_to_execute="ipfs init"

# Check if the directory exists
if [ -d "$target_directory" ]; then
  echo "The directory exists."
else
  echo "The directory does not exist. Executing the command: $command_to_execute"
  $command_to_execute
  
  echo "ALLOWS FOR WEBUI" 
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["https://cloudflare-ipfs.com", "http://127.0.0.1:5001", "https://webui.ipfs.io"]'
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "POST"]'

  echo "CHANGE ADDRESSES"
  cd "$IPFS_PATH"
  mv config config_aux
  cat config_aux | jq '.Addresses.Gateway="/ip4/0.0.0.0/tcp/8080"' | jq '.Addresses.API="/ip4/0.0.0.0/tcp/5001"' > config
fi

echo "**********************************************************************************************"


echo "**********************************************************************************************"
ipfs daemon

ipfs swarm peers

