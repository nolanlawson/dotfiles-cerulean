export GRADLE_HOME=/usr/local/Cellar/gradle/1.11/libexec
export GROOVY_HOME=/usr/local/opt/groovy/libexec
export ANDROID_HOME=/Users/nlawson/android-sdk
export SQLITE_PATH=/usr/local/opt/sqlite/bin
export PATH=/usr/local/bin:/usr/local/sbin:$SQLITE_PATH:/usr/local/opt/coreutils/libexec/gnubin:/usr/local/opt/gnu-tar/libexec/gnubin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools/proguard/bin:/Users/nlawson/Downloads/apktool:$PATH

#
# Making sure I don't shoot myself in the foot
#
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

# To make sure the history's brain isn't to small, you should increase its size. The following lines need to be added to your ~/.bashrc file. 
# It increases the history to the last 10.000 commands, erases previous duplicates and makes sure that the commands are 
# appended (and do no override) on shell exit:
export HISTSIZE=10000
export HISTCONTROL=erasedups
#shopt -s histappenda

export EDITOR=`which vi`

function parse_git_branch { 
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /' 
}
function git_is_dirty {
  git status --porcelain 2> /dev/null | tr '\n' ' ' | sed -e 's/.*/* /g'
} 
function kirby_dance {
  kirbies=("<('o'<)" "(>‘o’)>" "v(‘.’)v" "<('.')>" "<('.'<)" "^('.')^" "(>‘.’)>" "v(‘.’)v" "<('.')>")
  len=${#kirbies[*]}
  rando=$(expr $RANDOM % $len)
  echo ${kirbies[$rando]}
}

txtgray='\[\e[1;30m\]' 
txtcyan='\[\e[0;96m\]' 
txtred='\[\e[0;91m\]' 
txtpink='\[\e[1;31m\]' 
txtend='\[\e[00m\]'
export PS1="\u@cerulean:\W $txtcyan\$(parse_git_branch)\$(git_is_dirty)$txtend$txtpink\$(kirby_dance)$txtend $txtgray\$$txtend "

alias grep="ggrep"
alias st="open -a /Applications/SourceTree.app/"
alias mou="open -a /Applications/Mou.app/"
alias mate="open -a /Applications/TextMate.app/"
alias squash-develop='git branch -D tmp; git checkout -b tmp; git checkout -; git reset --hard origin/develop; git merge --squash tmp'
alias squash-master='git branch -D tmp; git checkout -b tmp; git checkout -; git reset --hard origin/master; git merge --squash tmp'
alias copy-head='git rev-parse HEAD | pbcopy'
alias lolcat="logcat-color"
alias gimp="open -a /Applications/GIMP.app/"
alias firefox='open -a /Applications/Firefox.app/'

source ~/gradle-tab-completion.bash

# brew git autocompletion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

export MAVEN_OPTS="-Xmx512M -XX:MaxPermSize=512M"
export GRADLE_OPTS="-Xmx2048M -XX:MaxPermSize=2048M"

export SQSP_BLOG_IOS_HOME=/Users/nlawson/workspace-ios/squarespace-blog
export SQSP_BLOG_ANDR_HOME=/Users/nlawson/workspace-android/android-blog
