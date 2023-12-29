#!/bin/bash
soporte=@drowkid01;		link="https://raw.githubusercontent.com/vpsnetdk/tmx/main/ADM-db"
declare -A dir=( [0]="$PREFIX/etc/drowkid" [bot]="$PREFIX/etc/drowkid/bot" )
declare -A file=( [ShellBot]="${dir[bot]}/ShellBot.sh" [botScript]="${dir[bot]}/botScript.sh" [BotGen]="${dir[bot]}/BotGen.sh" [init]="${dir[bot]}/.init" )
declare -A url=( [ShellBot]="$link/ShellBot.sh" [botScript]="$link/botScript.sh" [BotGen]="$link/BotGen.sh" )
	for sdir in $(echo "${dir[0]} ${dir[bot]}") ; do
		[[ ! -d "${sdir}" ]] && mkdir -p ${sdir} &> /dev/null
	done
	[[ ! -e "${file[init]}" ]] && { touch ${file[init]}
		for arqx in $(echo "ShellBot botScript BotGen") ; do
		wget -O ${file[$arqx]} ${url[$arqx]} &> /dev/null
		chmod +x ${file[$arqx]}
		done
	}
