# set locale to use utf8 in Japanese
#export LANG=ja_JP.UTF-8

if [[ $OSTYPE = "darwin"* ]]; then
    alias ls='ls -FG'
else
    alias ls='ls -F --color=auto'
fi
alias ll='ls -l'
alias cd='CDBAK=`pwd`;cd'
alias bcd='CDTMP=`pwd`;\cd $CDBAK;CDBAK=$CDTMP'
alias shttpd='python -m SimpleHTTPServer'

# qmake config to make Makefile or Xcode project
#alias qmakeG='qmake -spec macx-g++'
#alias qmakeX='qmake -spec macx-xcode'

#alias finder='open /System/Library/CoreServices/Finder.app'

#export ANT_HOME=/usr/local/ant
#export PATH=${PATH}:${ANT_HOME}/bin

#export PATH=${PATH}:/usr/local/Trolltech/Qt-4.5.0-tp1/bin

# export PATH=${PATH}:~/android-sdk-mac_x86-1.0_r1/tools
#export PATH=${PATH}:/usr/local/android/tools

# add own bin dir
export PATH=${PATH}:~/bin

#export PATH=${PATH}:/Applications/gnuplot.app:/Applications/gnuplot.app/bin

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

