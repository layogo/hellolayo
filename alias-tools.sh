############## dir alias #############
alias wp='cd /Users/yulin/workplace'
alias ios='cd /Users/yulin/workplace/ios'
alias an='cd /Users/yulin/workplace/android'


#gt
alias gt='cd /Users/yulin/workplace/ios/gt && r87'
alias gtnode='cd /Users/yulin/workplace/ios/gt/node/global-theat-server/node-server/ && pwd'
alias gts='cd /Users/yulin/workplace/ios/gt/global-theat-server && r87'
#ge
alias ge='cd /Users/yulin/workplace/ios/ge && r20'
alias ges='cd /Users/yulin/workplace/ios/ge/galaxy-server && r20'
#ange
alias age='cd /Users/yulin/workplace/android/ge && r20'
alias ages='cd /Users/yulin/workplace/android/ge/galaxy-server && r20'
#ie
alias ie='cd /Users/yulin/workplace/ios/ie && r87'
alias ies='cd /Users/yulin/workplace/ios/ie/island-server && r87'
alias ieg='cd /Users/yulin/workplace/ios/ie/island-gateway && r87'

alias ughui='cd /Users/yulin/workplace/heroku/ughui && rvm use 2.0.0@rails40.ughui'
############## dir alias #############

# zsh 
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vd='vimdiff '
#alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=mate 
alias -s rb=mate  
alias -s py=vi    
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
# end zsh
#rvm
alias r87='rvm use 1.8.7@rails3020'
alias r20='rvm use ruby-2.0.0-p598@rails40'

#git
alias gs='git status'
alias grd='git push origin --delete '

#server list
source /Users/yulin/workplace/server-alias/android-ge.server
source /Users/yulin/workplace/server-alias/ge.server
source /Users/yulin/workplace/server-alias/gt.server
source /Users/yulin/workplace/server-alias/ie.server
source /Users/yulin/workplace/server-alias/base.developer.server
source /Users/yulin/workplace/server-alias/others.server

export PATH=$PATH:/usr/local/redis-2.8.6/src/

#mongo db 
alias mos='mongod --dbpath=/Users/yulin/data/db --logpath=/Users/yulin/data/log/mongo.log --fork '
alias molog='tail -f /data/log/mongo/mongo.log'

#rails 
alias ra='rails '
alias ras='ra s -p'
alias rasp='ra s -e production p'

alias conn=" read -p 'ip:' ip; ssh -i /Users/yulin/.ssh/0711 ubuntu@$ip"
#update alias tools and update zshrc
alias ua='vi /Users/yulin/workplace/hellolayo/alias-tools.sh && source ~/.zshrc'
alias reload='source ~/.zshrc'

