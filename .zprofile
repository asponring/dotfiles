export REPOS=~/src
eval "$(/opt/homebrew/bin/brew shellenv)"
#export PATH="${REPOS}/liftoff/ops/script/git/tools:$(brew --prefix)/opt/postgresql@15/bin:$PATH"
export PATH="$HOME/.local/bin:$REPOS/liftoff/exp/andy:$(brew --prefix)/opt/postgresql@17/bin:$PATH"

source $REPOS/liftoff/ops/credentials/developer.profile

# Aliases
alias li="cd $REPOS/liftoff"
alias sk="li; cd skipper/"
alias bl="li; cd blixem/"
alias h2="li; cd h2go/"
alias ha="li; cd haggler/"
alias pr="li; cd prospector/"
alias pi="cd $REPOS/liftoff/postgresql/pinpoint && psql pinpoint"
alias rmi="$REPOS/liftoff/postgresql/script/run_all_migrations.sh"
alias re="cd $REPOS"
alias mi="re; cd miscellany"
alias ra="./bin/run_app.sh"
alias wcl="wc -l"
# alias g="git"
alias clt="clj -M:liftoff:dev:test"
alias cls="clj -M:liftoff:dev:test"
alias clr="clj -M:liftoff:dev:nrepl"
alias gt="go test ./..."
alias gtv="gt -v"
alias gb="go build"
alias lnt="lintoff ."

export PLOY_RUSH_BUILD="true"
