git checkout <BRANCH>
git pull --rebase # this will update origin/master among other origin refs
git log
git merge --no-ff --no-commit origin/master
git commit -n -a -m "SI-123: Refresh SI-123_UPDATE_PHP branch from master" 
git push origin <BRANCH>
git diff origin/master
