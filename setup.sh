#! /bin/bash

for source_repo in $(cat source-repos.txt)
do
	repo_name=$(echo "$source_repo" | sed 's/https:\/\/github.com\/[^\/]*\///' | sed 's/.git//')
	echo "WORKING ON '${repo_name}'"
	
	if [ ! -d "$repo_name" ]
	then
		git submodule add "git@github.com:hr-curtissimo/${repo_name}.git"
		pushd $repo_name
		git remote add upstream $source_repo
		popd
	fi
	echo "-------------------------------------"
done

