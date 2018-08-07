export PATH="/usr/local/opt/python@2/libexec/bin:$PATH"
source "$HOME/src/liftoff/ops/credentials/developer.profile"
eval "$(rbenv init -)"
alias li="cd $REPOS/liftoff"
alias sk="li; cd skipper/"
alias pi="cd $REPOS/liftoff/postgres_db/pinpoint && psql pinpoint"
alias rmi="$REPOS/liftoff/postgres_db/script/run_all_migrations.sh"
alias pin="li; cd pinpoint/"
alias re="cd $REPOS"
alias co="cd ~/src"
alias sr="cd ~/src"
alias mi="co; cd miscellany"
alias an="psql analytics"
alias coh="psql cohort"
alias lipr="vim ~/.liftoff_profile"
alias ra="./bin/run_app.sh"
export KAFKA_DIR=$REPOS/kafka
alias gaid="grep -o -E '[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}'"
alias idfa="grep -o -E '[A-F0-9]{8}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{4}-[A-F0-9]{12}'"
alias wcl="wc -l"
alias g="git"

alias rs="sk; ANALYTICS_DB_HOST=$(psh -1 analytics-db-replica) \
ANALYTICS_DB_ANNEX_HOST=$(psh -1 analytics-db-annex-standby) \
ANALYTICS_DB_WING_HOST=$(psh -1 analytics-db-wing-standby) \
ANALYTICS_DB_EXT_HOST=$(psh -1 analytics-db-ext-standby) \
ANALYTICS_DB_ARM_HOST=$(psh -1 analytics-db-arm-standby) \
ANALYTICS_DB_LEG_HOST=$(psh -1 analytics-db-leg-standby) \
ANALYTICS_DB_USER=ubuntu \
COHORT_DB_HOST=$(psh -1 cohort-db-standby) \
COHORT_DB_USER=ubuntu \
ADOPS_CACHE=true \
./bin/run_app.sh"
