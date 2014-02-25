WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
source ~/.git_completion.sh
export CUR_HOME="/Users/eyal"
export M2_HOME="/usr/local/apache-maven-2.2.1"
export PATH="/usr/local/bin:$PATH:$M2_HOME/bin:/usr/local/sbin:/usr/local/share/npm/bin"
export PYTHONSTARTUP=$HOME/.pythonrc
export JAVA_HOME=`/usr/libexec/java_home`
export RISK_DIR=/Volume/eb_home/work/risk
export RISK_CONFIG=settings.personal
export EB_VM_MEMSIZE="4096"
CLICOLOR=1
#sets up the color scheme for list export
LSCOLORS=gxfxcxdxbxegedabagacad
#enables color for iTerm
export TERM=xterm-color
#sets up proper alias commands when called
alias ls='ls -G'
alias ll='ls -hl'
color_prompt=yes
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

has_virtualenv() {
    if [ -e .venv ]; then
       NEW_VENV=`cat .venv`
        if [[ "$CUR_VENV" != "$NEW_VENV" ]]; then
            export CUR_VENV="${NEW_VENV}"
            export CUR_HOME=`pwd`
            workon "${CUR_VENV}"
        fi
    fi
}

venv_cd () {
    if [[ "$#" == "0" ]]; then
        cd "${CUR_HOME}"
    else
        cd "$@" && has_virtualenv
    fi
}

opened() {
    for file in `git status -s | cut -d" " -f3`; do $* $file; done
}

alias cd="venv_cd"
alias sl="ls"

alias vim="/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim"

alias pr="post-review -o --guess-description --guess-summary"

export EB_HOME="/Volumes/eb_home/work/eventbritecore/"
function vg() {
   if [ $1 ]
   then
       pushd $EB_HOME/django/scripts/vagrant/vagrant_1.4/;
       vagrant $@;
       popd;
   else
       pushd $EB_HOME;
   fi
}

alias dj="cd /Volumes/eb_home/work/eventbritecore"
alias mandoline_cover="nosetests --cover-html --with-coverage --cover-package=load_data,process_data,transform_data,helpers,constants,cleaner"
alias djrisk="cd /Volumes/eb_home/work/risk"
function _update_ps1() {
   export PS1="$(/usr/bin/python -S ~/powerline-shell/powerline-shell.py $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1"
alias vit="/usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim -c 'CommandT'"
function vack() {
    /usr/local/Cellar/macvim/7.3-66/MacVim.app/Contents/MacOS/Vim -c "Ack $@"
}
