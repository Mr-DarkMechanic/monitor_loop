#!/usr/bin/env bash

#> VARIABLES
domain=
outdir=

#> ARGUMENT FLAGS
while [ -n "$1" ]; do
    case $1 in
            -d|--domain)
                domain=$2
                shift ;;


            -o|--output)
                outdir=$2
                shift ;;
    esac
    shift
done

mkdir -p $outdir
cd $outdir

while :
do
    echo | subfinder -silent -d $domain -t 100 -o sub.txt | httpx -silent -threads 150 | anew sublive.txt | notify -silent -id moniter-sub 
    sleep 3600
done


