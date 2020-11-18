#! /bin/bash

for source_repo in $(cat source-repos.txt)
do
	repo_name=$(echo "$source_repo" | sed 's/https:\/\/github.com\/[^\/]*\///' | sed 's/.git//')
	echo "UPDATING ON '${repo_name}'"
	
	if [ -d "$repo_name" ]
	then
		pushd $repo_name
		git pull --ff-only -Xtheirs upstream $(git branch --show-current)
		git pull --ff-only origin $(git branch --show-current)
		git push origin $(git branch --show-current)
		popd
	fi
	echo "-------------------------------------"
done


