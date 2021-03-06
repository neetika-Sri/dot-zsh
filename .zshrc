source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/extract", from:oh-my-zsh
zplug "robbyrussell/oh-my-zsh", use:"lib/directories.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/theme-and-appearance.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/key-bindings.zsh"
zplug "robbyrussell/oh-my-zsh", use:"lib/history.zsh"
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:$([[ $OSTYPE == *darwin* ]] && echo "*darwin*amd64*" || echo "*linux*amd64*")
zplug "junegunn/fzf", use:"shell/*.zsh"
zplug "rupa/z", use:z.sh
zplug "changyuheng/fz", use:"*.zsh"
zplug "changyuheng/zsh-interactive-cd", use:"*.zsh"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "~/.zsh/script", from:local, use:"alias.zsh"
zplug "~/.zsh/script", from:local, use:"notifier.zsh"
zplug "~/.zsh/script", from:local, use:"xenv.zsh"
zplug "~/.zsh/script", from:local, use:"fzf.zsh", defer:1
zplug "robbyrussell/oh-my-zsh", as:theme, use:"themes/gentoo.zsh-theme"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# Misc
[ -f /usr/libexec/java_home ] && export JAVA_HOME=$(/usr/libexec/java_home)
[ -f ~/.iterm2_shell_integration.zsh ] && test -e ${HOME}/.iterm2_shell_integration.bash && source ${HOME}/.iterm2_shell_integration.bash
[ -f ~/.iterm2_shell_integration.zsh ] && source ~/.iterm2_shell_integration.`basename $SHELL`
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh
