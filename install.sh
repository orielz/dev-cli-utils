utils_dir="cli-utils"
bash_file=~/.bash_profile
utils_path=/usr/local/bin/$utils_dir

mkdir -p /usr/local/bin/$utils_dir
grep -Rq $utils_dir $bash_file

if [ "$?" -eq 1 ]; then
    echo 'PATH="/usr/local/bin/'$utils_dir':${PATH}"' >> $bash_file
    echo "export PATH" >> $bash_file
fi

cp $PWD/utils/* $utils_path
ls $utils_path