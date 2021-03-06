# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
umask 0002  # Gives g+w, so I don't clutter up shared spaces with untouchable files.
            # Might not be desireable on all systems!

# Created with Halloween Bash Profile Generator. http://xta.github.io/HalloweenBash/
function parse_git_branch {
   git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[0;32m\]\u@\h \w \$(parse_git_branch)\n\t> \[\e[0m\]"
