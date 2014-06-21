# set locale to use utf8 in Japanese
#export LANG=ja_JP.UTF-8

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
alias shttpd='python -m SimpleHTTPServer'
alias vin='vim -c NERDTree'
alias swift='/Applications/Xcode6-Beta2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift -sdk /Applications/Xcode6-Beta2.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.10.sdk'


# add own bin dir. prioritize /usr/local/bin for brew
export PATH=~/bin:/usr/local/bin:$PATH

# android sdk
ANDROID_SDK=~/Development/android-sdk-mac_x86/sdk
export PATH=$PATH:${ANDROID_SDK}/tools:${ANDROID_SDK}/platform-tools
export NDKROOT=~/Development/android-ndk-r9d
export NDK_ROOT=${NDKROOT}
export LD_LIBRARY_PATH=${ANDROID_SDK}/tools/lib:${LD_LIBRARY_PATH}
export ANDROID_SDK_ROOT=${ANDROID_SDK}

# setting for test automation
export ANDROID_HOME=${ANDROID_SDK}
export PATH=$PATH:$ANDROID_HOME:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$ANDROID_HOME/add-ons

export PATH=/usr/local/share/npm/bin:$PATH
export NODE_PATH=/usr/local/lib/node_modules

# prompt
autoload colors
colors
PROMPT="%{${fg[green]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[green]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"

# rvm
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=~/Development/cocos2d-x-3.1.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/bin
export PATH=$ANT_ROOT:$PATH

