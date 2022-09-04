
# IMPORTANT: All functions assume user is inside a git repo. Weird outputs
#            will happen outside of git repos. 

# Format
# [ git status ]  [commit hash]  [git tag]  [gh issues/pr's]

# If large console, show full status (  5/2 咽 9 ● 7  1  6  4  2 )
# Only show icons if medium (  咽 ●     )

function getGitBranch () {
  echo $(git symbolic-ref --short -q HEAD)
}

function getGitTagIfExists () {
  echo $(git describe --tags --exact-match 2> /dev/null)
}

function getGitCommitHash () {
  echo $D6S_ICON_GIT_COMMIT" "$(git rev-parse --short HEAD)
}

function _generateGitSegment() {
  echo " 5/2 咽 9 ● 7  1  6  4  2  $(getGitCommitHash)  笠 v1.4   8  1,309"
}
