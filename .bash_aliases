alias rm='rm -i'

alias netstat2='sudo lsof -Pni | grep LISTEN'

alias gshow='git show'
alias gs='git status'
alias gb='git branch'
alias gl='git lg'
alias ga='git add'
alias g-size="git ls-tree -r -l HEAD | awk '{print \$4, \$5}' | numfmt --to=iec --padding=7"
alias g-size-sort="git ls-tree -r -l HEAD | sort -k 4 -n | awk '{print \$4, \$5}' | numfmt --to=iec --padding=7"
alias gp='git push'
alias gp-u='git push-u'

alias docker.pids='for i in $(docker container ls --format "{{.ID}}"); do docker inspect -f '\''{{.State.Pid}} {{.Name}}'\'' $i; done'
alias docker.names='for i in $(docker container ls --format "{{.ID}}"); do docker inspect -f '\''{{.Name}}'\'' $i; done'
alias docker.watch='watch "docker ps --filter \"name=pts-\" --format \"table {{.ID}}\t{{.Command}}\t{{.CreatedAt}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}\""'

