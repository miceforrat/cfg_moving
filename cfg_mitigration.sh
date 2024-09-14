files=$(ls -a $1 | grep -E '.[^.]+' | grep -vE "(.git|cfg_mitigration.sh)")
wd=$(pwd)
for file in `echo $files`; do
	ln -s $wd/$file ~/$file
	if [ $? -ne 0 ]; then
		mv ~/$file ~/cfg_bak_$file
		ln -s $wd/$file ~/$file
	fi
done
