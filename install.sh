utils_dir="dev-cli-utils"
bash_file=~/.zshrc
utils_path=/usr/local/bin/$utils_dir

npm install ttab -g

rm -rf /usr/local/bin/$utils_dirz
mkdir -p /usr/local/bin/$utils_dir
grep -Rq $utils_dir $bash_file

if [ "$?" -eq 1 ]; then
    echo 'PATH="/usr/local/bin/'$utils_dir':${PATH}"' >> $bash_file
    echo "export PATH" >> $bash_file
fi

cp $PWD/utils/* $utils_path
find $utils_path -type f -exec chmod 777 {} \;
