#!/bin/bash

set -e
set -u
set -o pipefail

get_bib () {
	wget --header "Accept: application/x-bibtex" "$1" -O ->> "$2"
	printf "\n\n" >> "$2"
}

get_bib $1 $2
