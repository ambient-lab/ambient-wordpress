IS_MERGE_ONLY=false

while getopts ":m" OPT; do
  case ${OPT} in
  m) 
    IS_MERGE_ONLY=true 
  ;;
  esac
done

PARENT_REPOSITORY_URL="https://github.com/ambient-lab/${PARENT_REPOSITORY}.git"

if ! "${IS_MERGE_ONLY}"; then
  echo "starting Phase 1 ..."
  git remote add upstream ${PARENT_REPOSITORY_URL}
  git checkout -b ambient-lab-develop
  git fetch upstream
  git rebase upstream/develop
  if [ "$?" -eq "1" ]; then
    echo " → git rebase conflict"
    echo "   After the conflict and rebase are resolved, the process can be resumed by adding the m option and executing the shell."
    # コンフリクトとリベースの解消後に-mオプションを追加することで処理を再開することができます。
    exit 1
  else 
    echo " → finished Phase 1"
  fi
else
  echo "skiped Phase 1"
fi

echo "starting Phase 2 ..."
git checkout -
git merge --allow-unrelated-histories ambient-lab-develop
if [ "$?" -eq "1" ]; then
  echo " → git merge conflict"
  exit 1
fi
git push 
echo " → finished Phase 2"