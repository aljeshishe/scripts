#!/bin/bash

# Define the Docker Hub repository
REPO_NAME="rayproject/ray"

# Define the Docker Hub API URL for tags
API_URL="https://hub.docker.com/v2/repositories/${REPO_NAME}/tags/?page_size=100"

# Function to retrieve tags for a repository
function get_tags() {
    local page_url="$1"
    local tags_json=$(curl -s "$page_url")
    local tags=$(echo "$tags_json" | jq -r '.results[] | .name')
    echo "$tags"
}

# Retrieve and print all tags for the repository
while [ "$API_URL" != "null" ]; do
    tags=$(get_tags "$API_URL")
    echo "$tags"
    API_URL=$(echo "$tags_json" | jq -r '.next')
done
