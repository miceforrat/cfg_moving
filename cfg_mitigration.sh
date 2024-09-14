files=$(ls -a $1 | grep -E '.[^.]+' | grep -vE "(.git|cfg_mitigration.sh)")
for file in `echo $files`; do
	ln -s $1/$file ~/$file
	if [ $? -ne 0 ]; then
		mv ~/$file ~/cfg_bak_$file
		ln -s $1/$file ~/$file
	fi
done
