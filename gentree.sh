echo -e "\033[32m" "Start generating structure." "\033[0m"
if [ ! -d structure/  ]
then
  mkdir structure/
fi

for file in data/*
do
    if test -d $file
    then
        echo -e "\033[32m" $file " -> tree" "\033[0m"
        ./tree -Js -L 1 --md5 $file > structure/$(basename $file .pak).json
    fi
done


for directory in $(find data -maxdepth 2 -mindepth 2 -type d)
do
    mkdir -p structure/$(dirname $directory)
    echo -e "\033[32m" $directory " -> tree" "\033[0m"
    ./tree -Js --md5 $directory > structure/$directory.json
done
