# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Clear greeting
set fish_greeting

set --export JAVA_HOME /System/Library/Frameworks/JavaVM.framework/Home

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish

source $HOME/dotfiles/fish/functions/swap_theme.fish
swap_theme jacaetevha

source_script --bash $HOME/.nvm/nvm.sh
