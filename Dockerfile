FROM ubuntu:16.10

RUN apt-get update -y && apt-get full-upgrade -y
RUN apt-get install -y bash-completion zsh curl cowsay git vim bsdmainutils

ADD farsava-cli /usr/bin/farsava-cli
ADD _farsava-cli /usr/local/share/zsh/site-functions/_farsava-cli
ADD farsava-cli.bash-completion /etc/bash-completion.d/farsava-cli
RUN chmod 755 /usr/bin/farsava-cli

#
# Install oh-my-zsh
#
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" || true

#
# Enable bash completion
#
RUN echo '\n\
. /etc/bash_completion\n\
source /etc/bash-completion.d/farsava-cli\n\
' >> ~/.bashrc

#
# Setup prompt
#
RUN echo 'export PS1="[Farsava API] \$ "' >> ~/.bashrc
RUN echo 'export PROMPT="[Farsava API] \$ "' >> ~/.zshrc

#
# Setup a welcome message with basic instruction
#
RUN echo 'cat << EOF\n\
\n\
This Docker provides preconfigured environment for running the command\n\
line REST client for $(tput setaf 6)Farsava API$(tput sgr0).\n\
\n\
For convenience, you can export the following environment variables:\n\
\n\
$(tput setaf 3)FARSAVA_SERVER$(tput sgr0) - server URL, e.g. https://example.com:8080\n\

\n\
$(tput setaf 7)Basic usage:$(tput sgr0)\n\
\n\
$(tput setaf 3)Print the list of operations available on the service$(tput sgr0)\n\
$ farsava-cli -h\n\
\n\
$(tput setaf 3)Print the service description$(tput sgr0)\n\
$ farsava-cli --about\n\
\n\
$(tput setaf 3)Print detailed information about specific operation$(tput sgr0)\n\
$ farsava-cli <operationId> -h\n\
\n\
By default you are logged into Zsh with full autocompletion for your REST API,\n\
but you can switch to Bash, where basic autocompletion is also supported.\n\
\n\
EOF\n\
' | tee -a ~/.bashrc ~/.zshrc

ENTRYPOINT ["zsh"]
