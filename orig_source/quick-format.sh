#!/bin/bash



#create files based on nav yml
createfiles () {
	grep "url: services" ../_data/navgx.yml | sed 's/url: services\///' | awk '{ system("touch "$1) }'
}

# create base html file with permalink set
setinitialpermalinks () {
for i in `find $1 -type f`
do

perma=`echo $i | sed 's/.html/\//g' | sed 's/\.//g' `
cat << EOF > $i
---
permalink: $perma
---

EOF
done
}


### uncomment function to use

#usage: quick-format.sh
#createfiles

#usage: quick-format.sh ./folder
#setinitialpermalinks $1

