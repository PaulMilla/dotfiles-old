# TODO: Make sure $HOME is valid
# TODO: Make sure git is installed

$archive_dir = "$HOME\dotfiles_old"

function Archive-Old ($Path) {
  if (-Not (Test-Path $archive_dir)) {
    New-Item $archive_dir -ItemType Directory | Out-Null
  }
  Move-Item $Path $archive_dir -Force
}

function Create-Hardlink ($Path, $Value) {
  If (Test-Path $Path) {
    Archive-Old $Path
  }

  New-Item -ItemType HardLink -Path $Path -Value $Value
}


# TODO: Make sure these files exist
$file = ".bashrc"
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".gitconfig"
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".spacemacs"
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".vimrc"
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".gvimrc"
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = ".vsvimrc" # Is this really needed?
Create-HardLink -Path "$HOME\$file" -Value "$PSScriptRoot\$file"

$file = "profile.ps1"
#Create-HardLink -Path "$HOME\Documents\WindowsPowerShell\$file" -Value "$PSScriptRoot\$file"

# Visual Studio Code Settings
$file = "settings.json"
Create-HardLink -Path "$env:APPDATA\Code\User\$file" -Value "$PSScriptRoot\VisualStudioCode\$file"

# Visual Studio Code Key
$file = "keybindings.json"
Create-HardLink -Path "$env:APPDATA\Code\User\$file" -Value "$PSScriptRoot\VisualStudioCode\$file"


# TODO: Install NeoVim

# Install the vim plugin-manager that we will use in our vim configs
if (-Not (Test-Path $HOME/.vim/bundle/Vundle.vim)) {
  iex "git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim"
}

# TOOD: Install Fira Code font - https://github.com/tonsky/FiraCode
# TODO: First find a way to find out if powerline fonts are already installed
# Ask whether or not to install powerline fonts
$install_fonts = Read-Host "Install Powerline Fonts (https://github.com/powerline/fonts)? [Y/n]"
if ($install_fonts -EQ "Y") {
  iex "git clone https://github.com/powerline/fonts powerline-fonts"
  Push-Location "$PSScriptRoot/powerline-fonts"
  & "$PSScriptRoot/powerline-fonts/install.ps1"
  Pop-Location
  Remove-Item ./powerline-fonts -Force -Recurse
}

