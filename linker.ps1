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
#New-Item -ItemType HardLink -Path "$HOME\Documents\WindowsPowerShell\$file" -Value "$PSScriptRoot\$file"


# Install the vim plugin-manager that we will use in our vim configs
if (-Not (Test-Path $HOME/.vim/bundle/Vundle.vim)) {
  iex "git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim"
}

# Ask whether or not to install powerline fonts
$install_fonts = Read-Host "Install Powerline Fonts (https://github.com/powerline/fonts)? [Y/n]"
if ($install_fonts -EQ "Y") {
  iex "git clone https://github.com/powerline/fonts powerline-fonts"
  Push-Location "$PSScriptRoot/powerline-fonts"
  & "$PSScriptRoot/powerline-fonts/install.ps1"
  Pop-Location
  Remove-Item ./powerline-fonts -Force -Recurse
}

