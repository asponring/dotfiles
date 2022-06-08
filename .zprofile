eval "$(/opt/homebrew/bin/brew shellenv)"
export REPOS=~/src

# Postgres setup
#export PATH="/opt/homebrew/opt/postgresql@10/bin:$PATH"
#export PATH="$(brew --prefix)/opt/postgresql@10/bin:$PATH"

# Python setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Ruby setup
eval "$(rbenv init -)"

source $REPOS/liftoff/ops/credentials/developer.profile

# Aliases
alias li="cd $REPOS/liftoff"
alias sk="li; cd skipper/"
alias bl="li; cd blixem/"
alias h2="li; cd h2go/"
alias ha="li; cd hawker/"
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

# Android setup
export ANDROID_SDK="$HOME/Library/Android/sdk"
export PATH="$ANDROID_SDK/platform-tools:$PATH"
