# .shell_aliases.sh - Custom shell aliases for convenience and system management

# Flush file system buffers with 'sync' and drop cached data from memory
alias clear_cache="/usr/bin/sudo sh -c 'sync && echo 1 > /proc/sys/vm/drop_caches'"

alias my_public_ipv4='dig @resolver1.opendns.com A myip.opendns.com +short -4'
alias my_public_ipv6='dig @resolver1.opendns.com AAAA myip.opendns.com +short -6'

# pipe text output to clipboard (can be pasted using Ctrl v)
alias clipboard='xsel -ib'

# aliases to send traffic through a man-in-the-middle proxy or the tor network
alias proxy_on='export http_proxy=http://localhost:8080; export https_proxy=http://localhost:8080'
alias proxy_tor_on='export http_proxy=socks5://localhost:9050; export https_proxy=socks5://localhost:9050'
alias proxy_status="env | grep -i 'http_proxy\|https_proxy'"
alias proxy_off='unset http_proxy; unset https_proxy'

# Changing "ls" to "eza" (this is not available in Fedora 42; use lsd instead)
#alias ls='eza --color=auto --group-directories-first'
#alias l.='eza --color=auto --group-directories-first -a | egrep "^\."' # show only dotfiles
#alias l1='eza -1 -a --color=auto --group-directories-first'             # Single column output
#alias ll='eza -al --color=auto --group-directories-first'  # long format
#alias lss='eza -a -1 --color=auto --group-directories-first --sort=size'
#alias lsm='eza -a -1 --color=auto --group-directories-first --sort=modified'
#alias lst='eza -aT --color=auto --group-directories-first' # tree listing
#alias lsi='eza -lah --color=auto --group-directories-first --icons'
#alias lsg='eza -lah --color=auto --group-directories-first --git' # Show git status in file listings

# Changing "ls" to "lsd"
#alias ls='eza --color=auto --group-directories-first'
#alias l.='eza --color=auto --group-directories-first -a | egrep "^\."' # show only dotfiles
#alias l1='eza -1 -a --color=auto --group-directories-first'             # Single column output
#alias ll='eza -al --color=auto --group-directories-first'  # long format
#alias lss='eza -a -1 --color=auto --group-directories-first --sort=size'
#alias lsm='eza -a -1 --color=auto --group-directories-first --sort=time'
#alias lst='eza -a --tree --color=auto --group-directories-first' # tree listing
#alias lsi='eza -lah --color=auto --group-directories-first --icon=always'
#alias lsg='eza -lah --color=auto --group-directories-first --git' # Show git status in file listings
