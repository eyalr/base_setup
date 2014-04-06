WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
source ~/.git_completion.sh
export PATH="/usr/local/bin:$PATH:$M2_HOME/bin:/usr/local/sbin:/usr/local/share/npm/bin"
export PYTHONSTARTUP=$HOME/.pythonrc
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
PS1='$PS1_CUR_HOME${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

alias cdddd="cd ../../../"
alias cddddd="cd ../../../../"

set_curhome() {
    git_toplevel=`git rev-parse --show-toplevel 2>/dev/null`
    if [[ "$git_toplevel" && -d "$git_toplevel" ]]; then
        export CUR_HOME=$git_toplevel
        export PS1_CUR_HOME="[`basename $CUR_HOME`]"
    fi
}

extra_cd () {
    if [[ "$#" == "0" ]]; then
        cd "${CUR_HOME}"
    else
        cd "$@" && set_curhome
    fi
}

opened() {
    for file in `git status -s | cut -d" " -f3`; do $* $file; done
}

alias cd="extra_cd"
alias sl="ls"

alias vim="mvim -v"

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

#export PROMPT_COMMAND="_update_ps1"
