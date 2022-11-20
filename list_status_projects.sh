cd $CODEBASE_DIR
repos=$(ls -d */)
repos=(${repos//" "/ })
exclude=("notebooks")
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'
echo "-------------------------------------------------------------------------------------------------------------------------------"
printf "| %20s %30s %30s %40s |\n" "Repository" "Modified" "Untracked" "Branch"
echo "-------------------------------------------------------------------------------------------------------------------------------"
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
  cd $CODEBASE_DIR/$i
  changes='yes'
  branch=$(git branch)
  mods=$(git ls-files --modified)
  unt=$(git ls-files --others --exclude-standard)
  mods=(${mods//"\n"/ })
  mods=${#mods[@]}
  unt=(${unt//"\n"/ })
  unt=${#unt[@]}
  if [[ $mods != 0 ]]
  then
    printf "| \033[0;31m%20s %27s %30s %43s \033[0m|\n" ${i::-1} $mods $unt ${branch:2}
  elif [[ $mods == 0 && $unt != 0 ]]
  then
    printf "| \033[1;33m%20s %27s %30s %43s \033[0m|\n" ${i::-1} $mods $unt ${branch:2}
  else
    printf "| %20s %27s %30s %43s |\n" ${i::-1} $mods $unt ${branch:2}
  fi
done
echo "-------------------------------------------------------------------------------------------------------------------------------"