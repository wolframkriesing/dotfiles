PS1='\u@\h:\w> '

alias s="clear; git status"

# Open the finder with the current directory!
alias f="open /System/Library/CoreServices/Finder.app ." 

alias ..="cd .."
alias l="ls -alh"
alias ...="cd ../.."

alias cdpicos="cd ~/work/picostitch/picostitch/website; clear;"
alias cdw="cd ~/work/; clear"
# open the app's menu on a connected android, useful with react-native, to fast reload an app manually
alias menu="adb shell input keyevent KEYCODE_MENU"

alias work_console_bg="osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {0,10000,0,0}\""
alias red_console_bg="osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {25000,0,0,0}\""
alias green_console_bg="osascript -e \"tell application \\\"Terminal\\\" to set background color of window 1 to {0,15000,0,0}\""

alias tree="tree -sh"

function dns_flush_cache() {
  sudo dscacheutil -flushcache
  sudo killall -HUP mDNSResponder
}

PATH=./node_modules/.bin:$PATH

###
### git branch name and highlighting in prompt
###

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \[\1\]/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local  LIGHT_BLUE="\[\033[0;33m\]"
  # OPTIONAL - if you want to use any of these other colors:
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  # END OPTIONAL
  local     DEFAULT="\[\033[0m\]"
  PS1="\u@\h:\W$LIGHT_BLUE\$(parse_git_branch)$DEFAULT> "

}

proml

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

###
### git stuff end
###

export TDDBIN_ROOT_DOMAIN=u
export KATAS_SERVICE_DOMAIN=katas.tddbin.local
ulimit -n 2560 # because browserify needs this when compiling react :(

#
# picostitch
#
function picos() {
  cdpicos
  ./start.sh
}

function cosmowiki() {
  cd ~/programming/cosmowiki
  nix-shell --command 'npm start'
}

function authForGitlab() {
  git config user.name "Wolfram Kriesing"
  git config user.email "w+gitlab@kriesing.de"
}

function copyPhotosFromCharosPhone() {
  adb pull -a /storage/self/primary/DCIM/Camera .
  adb pull -a /storage/3737-3432/DCIM/Camera .
  adb pull -a /storage/3737-3432/DCIM/100ANDRO .
}
