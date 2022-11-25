cd $CODEBASE_DIR
repos=$(ls -d */)
repos=(${repos//" "/ })
exclude=("notebooks"
"configs"
"scripts")
for i in "${!repos[@]}"
do
  for j in "${exclude[@]}"
  do
    if [[ ${repos[i]::-1} == $j ]]
    then
      unset 'repos[i]'
    fi
  done
done
for i in "${repos[@]}"
do
  echo "----------------------BUILDING $i--------------------------"
  cd $CODEBASE_DIR/$i
  pip3 install -r requirements.txt .
done
python -m pip install autopep8

