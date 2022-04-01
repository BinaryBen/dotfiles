
################################################################################
# Create a new branch based on project tracker issue and then push to remote
################################################################################

function git-push-new-branch() {

  usage="git new <branch-name> [parent]"
  
  branch=$1
  parent=${2:-master}

  tracker=$(git config --get project.tracker.type)
  url=$(git config project.tracker.baseurl)
  token=$(git config project.tracker.token)
  email=$(git config user.email)
  json=$(curl )

  git fetch origin $parent && \
  git checkout -b $1 origin/$parent && \
  git commit -m "$1" --allow-empty && \
  git push -u origin $1 && \
  git-pr $parent
}

################################################################################
# Create a draft pull request
################################################################################

function git-create-draft-pr() {

  usage="git draft [parent] [source]"

  parent=$(git branch --show-current)
  source=master

  if [ $# -eq 1 ] ; then
      source=$1
  fi

  echo --------------------------------------------------------------
  echo "attempting make draft PR [$parent] into [$source]"
  echo --------------------------------------------------------------

  if command -v gh &> /dev/null ; then
    gh pr create -B $source -dt "$parent" -b
  else
    echo "Github CLI not found. Please install it before trying again."
  fi
}
