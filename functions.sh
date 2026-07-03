#!/usr/bin/env bash

cleandock () {
	for x in $(/usr/local/bin/docker ps -a --format '{{.ID}} {{.Status}}'|grep -v Up|awk -F' ' '{print $1}')
	do
		docker rm $x
	done
	docker images | grep none | awk -F' ' '{print $3}' | xargs docker rmi -f
	echo container space: $(du -sh $HOME/Library/Containers/com.docker.docker/Data|awk '{print $1}')
}

rm-githistory () {
	if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1
	then
		echo "Error: Not a git repository." >&2
		return 1
	fi
	local target="$1"
	if [[ -z "$target" ]]
	then
		echo "Error: Please provide a git path relative to the repository root." >&2
		return 1
	fi
	if ! git diff-index --quiet HEAD --
	then
		echo "Error: You have uncommitted changes. Please commit or stash them first." >&2
		return 1
	fi
	echo "Starting cleanup of '$target' from history at $(date +'%H:%M:%S')..."
	echo "WARNING: This will rewrite Git history and prune objects. Please wait..."
	FILTER_BRANCH_SQUELCH_WARNING=1 git filter-branch --force --index-filter "git rm -r --cached --ignore-unmatch \"$target\"" --prune-empty --tag-name-filter cat -- --all
	git for-each-ref --format='delete %(refname)' refs/original | git update-ref --stdin
	git reflog expire --expire=now --all
	git gc --prune=now --aggressive
	echo "Clean operation finished successfully at $(date +'%H:%M:%S')."
}

rmdock() {
	local image=${1:-"nothing"}
	local c=$(docker images | grep "${image}" | wc -l | tr -d ' ')
	echo "following ${c} images will be removed."

	docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "${image}"

	read -p "continue [y/n]?: " ans
	if [[ $ans == "y" ]]; then
		for a in $(docker images | grep "${image}" | awk '{print $1":"$2}'); do 
			docker rmi "$a"
		done
	fi
}
