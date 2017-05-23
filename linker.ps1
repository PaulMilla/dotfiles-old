# TODO: Make sure $HOME is valid
# TODO: Make sure git is installed

# Install the vim plugin-manager that we will use in our vim configs
$vundle_install = "git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim"
iex "$vundle_install"

# TODO: Make sure these files exist
# TODO: Wrap the New-Item calls in a function
$file = ".bashrc"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".gitconfig"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".spacemacs"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".vimrc"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".gvimrc"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

# Is this really needed?
$file = ".vsvimrc"
New-Item -ItemType HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = "profile.ps1"
#New-Item -ItemType HardLink -Path "$HOME\Documents\WindowsPowerShell\$file" -Value "$PSScriptRoot\$file"
