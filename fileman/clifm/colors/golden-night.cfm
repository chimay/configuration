# Theme file for CliFM
# Theme name: golden-night

# FiletypeColors, InterfaceColors, and ExtColors use the same format used
# by the LS_COLORS environment variable. Thus, "di=01;34" means that (non-empty)
# directories will be printed in bold blue.
# Color codes are just traditional ANSI escape sequences less the escape char
# and the final 'm'.
# 4-bit, 8-bit (256 colors), and 24-bit (RGB/HEX) colors are supported.
# Example:
# 31            4-bit
# 38;5;160      8-bit
# 38;2;255;0;0  24-bit (RGB)
# #ff0000       24-bit (HEX)
#
# One attribute can be used for hex colors using a dash and an attribute
# number (RRGGBB-[1-9]), where 1-9 is:
#
# 1: Bold or increased intensity
# 2: Faint, decreased intensity or dim
# 3: Italic (Not widely supported)
# 4: Underline
# 5: Slow blink
# 6: Rapid blink
# 7: Reverse video or invert
# 8: Conceal or hide (Not widely supported)
# 9: Crossed-out or strike
#
# For example, to print bold red color, the hex code is #ff0000-1

# Definitions
# Define here up to 64 custom color variables. They can be used for:
# FiletypeColors
# InterfaceColors
# ExtColors
# DirIconColor

define D=0 # Default terminal foreground color
#define BD=1 # Bold (keep current color)
define BD=0;1 # Bold (reset foreground color)

define R=31 # Red
define BR=1;31 # Bold red
define DR=2;31 # Dimmed red
define UDR=4;2;31 # Underlined dimmed red
define UBR=4;1;31 # Underlined bold red

define G=32 # Green
define BG=1;32 # Bold green
define DG=2;32 # Dimmed green

define Y=33 # Yellow
define BY=1;33 # Bold yellow
define DY=2;33 # Dimmed yellow

define B=34 # Blue
define BB=1;34 # Bold blue
define DB=2;34 # Dimmed blue

define M=35 # Magenta
define BM=1;35 # Bold Magenta
define DM=2;35 # Dimmed magenta
define UM=4;35 # Underlined magenta

define C=36 # Cyan
define BC=1;36 # Bold cyan
define DC=2;36 # Dimmed cyan
define RC=7;36 # Reverse cyan
define UDC=4;2;36 # Underlined dimmed cyan
define BDC=1;2;36 # Bold dimmed cyan

define DW=2;37 # Dimmed white
define UDW=4;2;37 # Underlined dimmed white

# Foreground-background combinations
define URW=4;31;47 # Red foreground, white background
define WR=37;41 # White foreground, red background
# K stands for black (B is used for Blue)
define KY=30;43 # Black foreground, yellow background
define KR=30;41 # Black foreground, red background
define KG=30;42 # Black foreground, green background
# BG is already used for bold green
define BlGr=34;42 # Blue foreground, green background
define WB=37;44 # white foreground, blue background

# FiletypeColors defines the color used for file names when listing files,
# just as InterfaceColors defines colors for CliFM's interface.
# Consult the manpage for information about these codes.
#FiletypeColors="bd=BY:ca=KR:cd=BD:di=BB:ed=DB:ee=G:ef=DY:ex=BG:fi=D:ln=BC:mh=RC:nd=UBR:ne=UDR:nf=UDR:no=URW:or=UDC:ow=BlGr:pi=M:sg=KY:so=BM:st=WB:su=WR:tw=KG:uf=UDW:"

FiletypeColors='no=00:fi=00:rs=0:di=38;5;88:ex=3;38;5;9:mh=01:ln=3:or=3;38;5;237:pi=38;5;22:so=38;5;11:do=01;35:bd=40;33;01:cd=40;33;01:su=37;41:sg=30;43:ca=30;41:tw=0;32:ow=34;42:st=37;44';

#InterfaceColors="bm=BG:dd=B:df=D:dg=Y:dl=DW:dn=DW:dr=Y:do=C:dp=M:dw=R:dxd=G:dxr=C:dz=G:el=C:em=BR:fc=DB:hb=C:hc=DR:hd=C:he=C:hn=M:hp=C:hq=Y:hr=R:hs=G:hv=G:li=BG:mi=BC:nm=BG:si=BB:sb=DY:sc=DR:sf=UDC:sh=DM:sp=DR:sx=DG:ti=BC:ts=UM:tt=BDC:tx=D:wc=BC:wm=BY:wp=DR:ws1=B:ws2=R:ws3=Y:ws4=G:ws5=C:ws6=C:ws7=C:ws8=C:xf=BR:xs=G:"

InterfaceColors="el=00:mi=0:dl=0:tx=0:df=0:dc=0:wc=0:dh=0:li=0:si=01;34:ti=0:em=0:wm=0:nm=0:bm=01;38;5;88:sb=04:sh=03:sf=03:sc=04:sx=03;38;5:52:sp=03:hb=00;36:hc=02;31:he=00;36:hn=00;35:hp=00;36:hq=00;33:hr=00;31:hs=00;32:hv=00;32:wp=0:ws1=0:ws2=0:ws3=0:ws4=0:ws5=0:ws6=0:ws7=0:ws8=0:"

# Colors for specific file extensions
#ExtColors="*.tar=BR:*.tgz=BR:*.taz=BR:*.lha=BR:*.lz4=BR:*.lzh=BR:*.lzma=BR:*.tlz=BR:*.txz=BR:*.tzo=BR:*.t7z=BR:*.zip=BR:*.z=BR:*.dz=BR:*.gz=BR:*.lrz=BR:*.lz=BR:*.lzo=BR:*.xz=BR:*.zst=BR:*.tzst=BR:*.bz2=BR:*.bz=BR:*.tbz=BR:*.tbz2=BR:*.tz=BR:*.deb=BR:*.rpm=BR:*.rar=BR:*.cpio=BR:*.7z=BR:*.rz=BR:*.cab=BR:*.jpg=BM:*.JPG=BM:*.jpeg=BM:*.mjpg=BM:*.mjpeg=BM:*.gif=BM:*.GIF=BM:*.bmp=BM:*.xbm=BM:*.xpm=BM:*.png=BM:*.PNG=BM:*.svg=BM:*.pcx=BM:*.mov=BM:*.mpg=BM:*.mpeg=BM:*.m2v=BM:*.mkv=BM:*.webm=BM:*.webp=BM:*.ogm=BM:*.mp4=BM:*.MP4=BM:*.m4v=BM:*.mp4v=BM:*.vob=BM:*.wmv=BM:*.flc=BM:*.avi=BM:*.flv=BM:*.m4a=C:*.mid=C:*.midi=C:*.mp3=C:*.MP3=C:*.ogg=C:*.wav=C:*.pdf=BR:*.PDF=BR:*.doc=M:*.docx=M:*.xls=M:*.xlsx=M:*.ppt=M:*.pptx=M:*.odt=M:*.ods=M:*.odp=M:*.cache=DW:*.tmp=DW:*.temp=DW:*.log=DW:*.bak=DW:*.bk=DW:*.in=DW:*.out=DW:*.part=DW:*.aux=DW:*.c=BD:*.c++=BD:*.h=BD:*.cc=BD:*.cpp=BD:*.h=BD:*.h++=BD:*.hh=BD:*.go=BD:*.java=BD:*.js=BD:*.lua=BD:*.rb=BD:*.rs=BD:"

ExtColors="*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=38;5;3:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=38;5;3:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=0:*.jpeg=0:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"

# If icons are enabled, use this color for the directories icon
DirIconColor="Y"

# The prompt used by CliFM. Use the 'prompt' command to check for available
# prompts. Enter 'prompt --help' for more information
Prompt="clifm"

# Override prompt values

#Prompt=""
#Notifications=

# A warning prompt to warn the user about invalid command names
EnableWarningPrompt=true

# The string used to construct the line dividing the list of files and
# the prompt (Unicode is supported). Possible values:
# "0": Print just an empty line
# "C": C is a single char. This char is printed up to the end of the screen
# "CCC": 3 or more chars. Only these chars (no more) will be printed
# "": Print a special line drawn with box-drawing characters (not
#     supported by all terminals/consoles)
# The color of this line is controlled by the 'dl' code in InterfaceColors
DividingLine="-"

# The prompt line is built using string literals and/or one or more of
# the following escape sequences:
#
# \xnn: The character whose hexadecimal code is nn.
# \e: Escape character
# \h: The hostname, up to the first dot
# \u: The username
# \H: The full hostname
# \n: A newline character
# \r: A carriage return
# \a: A bell character
# \d: The date, in abbrevieted form (ex: 'Tue May 26')
# \s: The name of the shell (everything after the last slash) currently
#     used by CliFM
# \S: The number of the current workspace
# \l: Print an 'L' if running in light mode
# \P: Current profile name
# \t: The time, in 24-hour HH:MM:SS format
# \T: The time, in 12-hour HH:MM:SS format
# \@: The time, in 12-hour am/pm format
# \A: The time, in 24-hour HH:MM format
# \w: The full current working directory, with $HOME abbreviated with a
#     tilde
# \W: The basename of $PWD, with $HOME abbreviated with a tilde
# \p: A mix of the two above, it abbreviates the current working
#     directory only if longer than PathMax (a value defined in the
#     configuration file).
# \z: Exit code of the last executed command. :) if success and :( in case
#     of error
# \$ '#', if the effective user ID is 0, and '$' otherwise
# \nnn: The character whose ASCII code is the octal value nnn
# \\: A backslash
# \[: Begin a sequence of non-printing characters. This is mostly used to
# add color to the prompt line
# \]: End a sequence of non-printing characters

#Prompt="\[\e[0m\][\[\e[0;36m\]\S\[\e[0m\]]\l \A \u:\H \[\e[0;36m\]\w\n\[\e[0m\]<\z\[\e[0m\]> \[\e[0;34m\]\$ \[\e[0m\]"

# Default prompt, but colorless
Prompt="\[\e[0m\] \n[\S] \l \u@\H : \p\n\n\d, \A \$ "

#Prompt="\S\l \A \u:\H \w\n\z \$ "
#Prompt="\[\e[0m\][\[\e[0;36m\]\S\[\e[0m\]]\l \A \u:\H \[\e[00;36m\]\w\n\[\e[0m\]\z\[\e[0;34m\] \$\[\e[0m\] "
# Default
#Prompt="[\[\e[0;36m\]\S\[\e[0m\]]\l \A \u:\H \[\e[00;36m\]\w\n\[\e[0m\]\z \[\e[0;34m\]\$\[\e[0m\] "
# Simple
#Prompt="[\u@\H] \w \$ "

# The following prompts are built using a patched Nerdfont

# Fireplace
#Prompt="\[\e[00;31m\]┏\[\e[00;31m\]\[\e[00;37;41m\]\A\[\e[00;31;43m\]\[\e[00;30;43m\] \u:\H\[\e[00;33;41m\]\[\e[00;37;41m\] \w\[\e[00;31m\]\[\e[0m\]\n\[\e[00;31m\]┗ "
# Cold winter
#Prompt="\[\e[00;37;100m\] \A \[\e[00;90;46m\]  \[\e[0;30;46m\]\u:\H \[\e[0;36;100m\]  \[\e[00;37;100m\]\w \[\e[00;90;40m\] \n \[\e[1;90m\]\[\e[0m\] "
# Spot
#Prompt="\[\e[00;38;5;0;48;5;178m\] \A \u:\H \w \[\e[00;38;5;178;48;5;0m\]\[\e[0;40m\]\n\[\e[0;38;5;254;48;5;53m\] \$ \[\e[0;38;5;53;48;5;0m\] \[\e[0m\] "
# Artic particles
#Prompt="\[\e[00;37;44m\] \A \[\e[00;34;47m\]  \u:\H \[\e[00;37;44m\] \w \[\e[00;34;40m\] \n\[\e[00;37;44m\] \$ \[\e[00;34;40m\] "
# Green Beret
#Prompt=" ╭─\[\e[0;38;5;239;48;5;232m\]\[\e[0;38;5;15;48;5;239m\]  \A \[\e[0;38;5;239;48;5;70m\]\[\e[0;38;5;0;48;5;70m\] \w \[\e[0;38;5;70;48;5;232m\]\n \[\e[0;40m\]╰──\[\e[0;38;5;70;48;5;0m\]▸\[\e[0;40m\] "

# If set to 'default', CliFM state information (selected files,
# trashed files, current workspace, messages, and stealth mode) will be
# printed to the left of the prompt. Otherwise, if set to 'custom', this
# information will be stored in environment variables to be handled by the
# prompt string itself. Consult the manpage for more information.
PromptStyle=default

# String to be used by the warning prompt. The color of this prompt
# can be customized using the 'wp' code in the color scheme file
WarningPromptStr="(invalid command !) > "

# If FZF TAB completion mode is enabled, pass these options to fzf.
# --height, --margin, +i/-i,--read0, --query, and --ansi will be appended
# to set up the completions interface. Set this value to 'none' to pass
# no option, to the empty string to load the default values (same as those
# specified below), or to any other custom value. Unless set to 'none',
# values set here will override FZF_DEFAULT_OPTS.
FzfTabOptions="--color='16,prompt:6,fg+:-1,pointer:4,hl:5,hl+:5,gutter:-1,marker:2' --bind tab:accept,right:accept,left:abort --inline-info --layout=reverse-list"

# Should we colorize files properties (long mode and pr command)?
ColorizeProperties=true

DirIconsColor="00;33"
