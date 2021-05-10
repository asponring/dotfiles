source "$HOME/src/liftoff/ops/credentials/developer.profile"
export PATH="$PATH:/Applications/MacVim.app/Contents/bin"
#export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
eval "$(rbenv init -)"
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"
export LIFTOFF_VENV_ROOT=~/.venv
alias li="cd $REPOS/liftoff"
alias sk="li; cd skipper/"
alias h2="li; cd h2go/"
alias ha="li; cd hawker/"
alias pi="cd $REPOS/liftoff/postgres_db/pinpoint && psql pinpoint"
alias rmi="$REPOS/liftoff/postgres_db/script/run_all_migrations.sh"
alias re="cd $REPOS"
alias co="cd ~/src"
alias sr="cd ~/src"
alias mi="co; cd miscellany"
alias ra="./bin/run_app.sh"
export KAFKA_DIR=$REPOS/kafka
alias gaid="grep -o -E '[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'"
alias idfa="grep -o -E '[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}'"
alias wcl="wc -l"
alias g="git"
alias clt="clj -A:liftoff:dev:test"
alias cls="clojure -A:liftoff:dev -m"
alias clr="clojure -A:liftoff:nrepl"
alias gt="go test ./..."
alias gb="go build"

alias rs="sk; ANALYTICS_DB_HOST=analytics-db-replica.liftoff.io \
ANALYTICS_DB_ANNEX_HOST=analytics-db-annex-standby.liftoff.io \
ANALYTICS_DB_OLDANNEX_HOST=analytics-db-oldannex-primary.liftoff.io \
ANALYTICS_DB_OLD2ANNEX_HOST=analytics-db-old2annex-primary.liftoff.io \
ANALYTICS_DB_WING_HOST=analytics-db-wing-standby.liftoff.io \
ANALYTICS_DB_EXT_HOST=analytics-db-ext-standby.liftoff.io \
ANALYTICS_DB_ARM_HOST=analytics-db-arm-standby.liftoff.io \
ANALYTICS_DB_PALM_HOST=analytics-db-palm-standby.liftoff.io \
ANALYTICS_DB_USER=ubuntu \
ATTRIBUTION_DELAY_DB_HOST=attribution-delay-db-primary.liftoff.io \
ATTRIBUTION_DELAY_DB_USER=ubuntu \
COHORT_DB_HOST=cohort-db-standby.liftoff.io \
COHORT_DB_USER=ubuntu \
ADOPS_CACHE=true \
./bin/run_app.sh"
