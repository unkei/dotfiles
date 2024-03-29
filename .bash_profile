# set locale to use utf8 in Japanese
export LANG=ja_JP.UTF-8
export LC_ALL=$LANG

source $HOME/dotfiles/.git-completion.bash
source $HOME/dotfiles/.git-prompt.sh

GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM=1
GIT_PS1_SHOWUNTRACKEDFILES=
GIT_PS1_SHOWSTASHSTATE=1

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(__git_ps1)\[\033[00m\]\$ '

if [[ $OSTYPE = "darwin"* ]]; then
    export LSCOLORS=gxfxcxdxbxegedabagacad
    alias ls='ls -FG'
else
    export LS_COLORS='no=00:fi=00:di=01;35:ln=01;36:pi=40;33:so=01;36:do=01;36:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
    alias ls='ls -F --color=auto'


    SSH_ENV=$HOME/.ssh/environment

    function start_agent {
        echo "Initialising new SSH agent..."
        /usr/bin/ssh-agent | sed 's/^echo/#echo/' > ${SSH_ENV}
        echo succeeded
        chmod 600 ${SSH_ENV}
        . ${SSH_ENV} > /dev/null
        /usr/bin/ssh-add;
    }

# Source SSH settings, if applicable

    if [ -f "${SSH_ENV}" ]; then
        . ${SSH_ENV} > /dev/null
        #ps ${SSH_AGENT_PID} doesn't work under cywgin
        ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
            start_agent;
        }
    else
        start_agent;
    fi
fi

alias ll='ls -l'
alias cd='CDBAK=`pwd`;cd'
alias bcd='CDTMP=`pwd`;\cd $CDBAK;CDBAK=$CDTMP'
# alias shttpd='python -m SimpleHTTPServer'
alias shttpd='python -m http.server'
alias vin='vim -c NERDTree'
alias swift='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -sdk /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'

# qmake config to make Makefile or Xcode project
#alias qmakeG='qmake -spec macx-g++'
#alias qmakeX='qmake -spec macx-xcode'

#alias finder='open /System/Library/CoreServices/Finder.app'

#export ANT_HOME=/usr/local/ant
#export PATH=${PATH}:${ANT_HOME}/bin

#export PATH=${PATH}:/usr/local/Trolltech/Qt-4.5.0-tp1/bin

# android sdk
ANDROID_SDK=/opt/android/sdk
export PATH=$PATH:${ANDROID_SDK}/tools:${ANDROID_SDK}/tools/bin:${ANDROID_SDK}/platform-tools
export NDKROOT=~/Development/android-ndk-r9d
export NDK_ROOT=${NDKROOT}
export LD_LIBRARY_PATH=${ANDROID_SDK}/tools/lib:${LD_LIBRARY_PATH}
export ANDROID_SDK_ROOT=${ANDROID_SDK}

# setting for test automation
export ANDROID_HOME=${ANDROID_SDK}
export PATH=$PATH:$ANDROID_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/add-ons

# add own bin dir. prioritize /usr/local/bin for brew
export PATH=~/bin:/usr/local/bin:$PATH

export NODE_PATH=/usr/local/lib/node_modules/:/usr/local/lib/jsctags

#export PATH=${PATH}:/Applications/gnuplot.app:/Applications/gnuplot.app/bin

# brew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# compiler options for development on OpenGL and OpenCV
#alias glcc='cc -framework OpenGL -framework GLUT -framework Foundation'
#alias cvcc='c++ -I/opt/local/include/opencv/ -lcxcore -lcv -lhighgui -lcvaux -L/opt/local/lib'

# OpenOffice invisible mode. Use the command followed by macro to run

#function ooffice () { /Applications/OpenOffice.org.app/Contents/MacOS/soffice.bin -invisible "macro:///Standard.MyConversions.SaveAsPDF($@)"; }

##
# Your previous /Users/unkei/.bash_profile file was backed up as /Users/unkei/.bash_profile.macports-saved_2011-01-15_at_13:22:42
##

# MacPorts Installer addition on 2011-01-15_at_13:22:42: adding an appropriate PATH variable for use with MacPorts.
#export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=~/Development/cocos2d-x-3.2/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH

export PATH=~/work/webrtc/depot_tools:"$PATH"

# Ruby
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(_PIPENV_COMPLETE=bash_source pipenv)"

# Connect IQ SDK
export PATH="$PATH:$HOME/Development/connectiq-sdk-mac-3.0.5-2018-11-20-1690028/bin"

# futter
export PATH="$PATH:$HOME/Development/flutter/bin"

# eval $(/usr/libexec/path_helper -s)
export PATH="/usr/local/sbin:$PATH"

. "$HOME/.cargo/env"
