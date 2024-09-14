files=$(ls -a . | grep -E '.[^.]+' | grep -vE "(.git|cfg_mitigration.sh)")
for file in `echo $files`; do
	ln -s $file ~/$file
	if [ $? -ne 0 ]; then
		mv ~/$file ~/cfg_bak_$file
	fi
done
