files=$(ls -a . | grep -E '.[^.]+' | grep -vE "(.git|cfg_mitigration.sh)")
for file in `echo $files`; do
	 ln -s $file ~/$file
done
