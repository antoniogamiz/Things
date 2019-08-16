## GitHub

- Git stash

~~~
git stash # stash changes
git stash save # temporary commit message to help identification
git stash list # list stashed changes
git stash apply # redo work keeping them in the stashed list
git stash pop # redo work removing it from the stashed list
~~~

- Rebase: (https://git-rebase.io/)

~~~
git rebase -i [commit]
~~~

- Checkout a specific file:

~~~
git checkout [branch] -- yarn.lock
git checkout [commit] -- yarn.lock
~~~

- Deletes unwanted files from a commit:

~~~
git reset --soft HEAD~1
git reset HEAD path/to/unwanted/file
git commit -m "[...]"
~~~

- Sync a branch:

~~~
git checkout b1
git merge master
~~~

- Push a new branch:

~~~
git checkout -b feature_branch_name
git push -u origin feature_branch_name
~~~

- See changes

~~~
git show [commit] # see changes
git log [file]  # all commits affecting that file
~~~

- Useful commands:

~~~
git cherry-pick sha1
~~~

- Deletes a tag

~~~
# delete local tag '12345'
git tag -d 12345
# delete remote tag '12345' (eg, GitHub version too)
git push origin :refs/tags/12345
# alternative approach
git push --delete origin tagName
git tag -d tagName
~~~

- Sync a fork

~~~
$ git remote -v 
$ git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git
$ git remote -v
# Commits to master will be stored in a local branch (upstream/master)
$ git fetch upstream
$ git checkout master
$ git merge upstream/master
~~~

- Set remote set url to use SSH

~~~
$ git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
~~~

- To delete a commit:

~~~
$ git reset --hard HEAD~1
$ git push origin HEAD --force
~~~

- To avoid the merge commit:

~~~
$ git pull --rebase
~~~

- Extensions (for vscode):

~~~
Git Lens
Git Graph
~~~

- Git Convention:
  - https://nvie.com/posts/a-successful-git-branching-model/
  - Only push to master when a new release is going to be made.
  - Keep a develop branch.
  - Creates features branchs off `develop`, not `master` (autobuilds) with:
  ~~~
  $ git checkout -b feature-* develop
  ~~~
  - Incorporating a finished feature on develop
  ~~~
  $ git checkout develop 
  $ git merge --no-ff feature-*
  $ git branch -d feature-* # avoid losing information about the historical existence of a feature branch
  $ git push origin develop
  ~~~
  - Releases branches: `release-*`. Must be merged into `develop` and `master`. Create a release branch:
  ~~~
  $ git checkout -b release-1.2 develop
  * necessary changes to bump version * (always do this at the beginning)
  $ git commit -a -m "Bumped version to 1.2"
  ~~~
  - Finish a release branch:
  ~~~
  $ git checkout master
  $ git merge --no-ff release-1.2
  (summary of changes)
  $ git tag -a 1.2 (maybe use -s or -u to sign the tag)
  ~~~
  - We also need to update `develop` with the release changes:
  ~~~
  $ git checkout develop
  $ git merge --no-ff release-1.2
  (summary of changes)
  ~~~
  - Now we can delete the release branch:
  ~~~
  $ git branch -d release-1.2
  ~~~
  - `hotfix-*` branches: may branch off from `master`. Must be merged into `develop` and `master`.
  ~~~
  $ git checkout -b hotfix-1.2.1 master
  Switched to a new branch "hotfix-1.2.1"
  $ ./bump-version.sh 1.2.1
  Files modified successfully, version bumped to 1.2.1.
  $ git commit -a -m "Bumped version number to 1.2.1"
  [hotfix-1.2.1 41e61bb] Bumped version number to 1.2.1
  1 files changed, 1 insertions(+), 1 deletions(-)
  (* now we fix the bug *)
  $ git checkout master
  $ git merge --no-ff hostfix-1.2.1
  $ git tag -a 1.2.1
  (* now we must update `develop` *)
  $ git checkout develop
  $ git merge --no-ff hotfix-1.2.1
  IF THERE IS AN EXISTING RELEASE BRANCH, WE WILL MERGE THE HOTFIX BRANCH
  TO THE RELEASE BRANCH UNLESS DEVELOP CANNOT CONTINUE WITHOUT THAT FIX.
  $ git branch -d hotfix-1.2.1
  ~~~
  
![](images/1.jpg)


## Linux

If you type `!<command>` in the terminal, it will execute `<command>` with previous arguments.

---

Use `sudo lsof -i :port` to see what process are using a specified port.

---

`find path -name regex` to search files.

---

## Shortcuts

To duplicate a line in VS Code: shift+alt+down

---

Shortcuts for terminator [here](https://askubuntu.com/questions/717965/what-is-the-shortcut-to-move-between-two-terminator-tabs).

---

## Random

To generate a markdown with the github-flavored style, you can use `grip README.md` (grip is a python module).

---
