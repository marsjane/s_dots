#!/bin/bash

function is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  type $1 >/dev/null 2>&1 || { local return_=0; }
  # return
  echo "$return_"
}

function folder_ensure {
  if [ ! -d $1 ]; then
    mkdir -p $1
    echo "$1 created."
  fi
}

function sudofolder_ensure {
  if [ ! -d $1 ]; then
    sudo mkdir -p $1
    echo "$1 created."
  fi
}
function help_info {
  echo "Run --check to check requirements then run as follows:"
  echo "Run --sudocheck to check and install requirements if you are sudo"
  echo "Run --zsh to setup ZSH"
  echo "Run --tmux to setup tmux"
  echo "Run --nvim to setup LazyVim"
  echo "Run --conda to setup conda"
}

function check_requirements {
  echo "Checking system package requirements"
  echo "Current system is Linux"
  if [ "$(is_installed zsh)" == "0" ]; then
    echo "Need zsh"
  fi
  if [ "$(is_installed git)" == "0" ]; then
    echo "Need git"
  fi
  if [ "$(is_installed ag)" == "0" ]; then
    echo "Need silversearcher-ag"
  fi
  if [ "$(is_installed bat)" == "0" ]; then
    echo "Need bat"
  fi
  if [ "$(is_installed curl)" == "0" ]; then
    echo "Need curl"
  fi
  if [ "$(is_installed wget)" == "0" ]; then
    echo "Need wget"
  fi
  if [ "$(is_installed fdfind)" == "0" ]; then
    echo "Need fdfind"
  fi
  if [ "$(is_installed rg)" == "0" ]; then
    echo "Need ripgrep"
  fi
  if [ "$(is_installed tmux)" == "0" ]; then
    echo "Need tmux"
  fi
  if [ "$(is_installed zoxide)" == "0" ]; then
    echo "Need zoxide, install..."
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
  fi
  if [ "$(is_installed fzf)" == "0" ]; then
    echo "Need fzf, install..."
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
  fi
  if [ "$(is_installed nvim)" == "0" ]; then
    echo "Need neovim, install..."
    folder="$HOME/.local/bin"
    folder_ensure $folder
    curl -o "$folder/nvim" -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
    chmod +x "$folder/nvim"
    if [ "$(is_installed "$folder/nvim")" == "1" ]; then
      echo "neovim successfully installed, remember to add PATH"
    fi
  fi
  echo "Check finished"
}

function sudocheck {
  os_type="unknown"
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
      ubuntu)
        echo "This is Ubuntu."
        os_type="ubuntu"
        ;;
      arch | endeavouros)
        echo "This is Arch Linux."
        os_type="arch"
        ;;
      *)
        echo "Unknown Linux distribution: $ID"
        return
        ;;
    esac
  else
    echo "/etc/os-release file not found."
    return
  fi

  case "$os_type" in
    "ubuntu")
      echo "installing requirements for ubuntu"
      if [ "$(is_installed zsh)" == "0" ]; then
        echo "installing zsh"
        sudo apt-get install zsh -y
      fi
      if [ "$(is_installed git)" == "0" ]; then
        echo "installing git"
        sudo apt-get install git
      fi
      if [ "$(is_installed ag)" == "0" ]; then
        echo "installing silversearcher-ag"
        sudo apt-get install silversearcher-ag
      fi
      if [ "$(is_installed bat)" == "0" ]; then
        echo "installing bat"
        sudo apt install bat
      fi
      if [ "$(is_installed curl)" == "0" ]; then
        echo "installing curl"
        sudo apt install curl
      fi
      if [ "$(is_installed wget)" == "0" ]; then
        echo "installing wget"
        sudo apt-get install wget
      fi
      if [ "$(is_installed fdfind)" == "0" ]; then
        echo "installing fdfind"
        sudo apt install fd-find
      fi
      if [ "$(is_installed rg)" == "0" ]; then
        echo "installing ripgrep"
        sudo apt-get install ripgrep
      fi
      if [ "$(is_installed tmux)" == "0" ]; then
        echo "installing tmux"
        sudo apt install tmux
      fi
      if [ "$(is_installed zoxide)" == "0" ]; then
        echo "installing zoxide, install..."
        curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
      fi
      if [ "$(is_installed fzf)" == "0" ]; then
        echo "installing fzf, install..."
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
        ~/.fzf/install
      fi
      if [ "$(is_installed nvim)" == "0" ]; then
        echo "installing neovim, install..."
        folder="$HOME/.local/bin"
        folder_ensure $folder
        curl -o "$folder/nvim" -L https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
        chmod +x "$folder/nvim"
        if [ "$(is_installed "$folder/nvim")" == "1" ]; then
          echo "neovim successfully installed, remember to add PATH"
        fi
      fi
      echo "Check finished"
      ;;
  esac
}


function go_zsh {
  # zsh
  current_shell=$(echo $SHELL)
  echo $current_shell
  if [ "${current_shell: -3}" = "zsh" ]; then
    if [ -L "$HOME/.config/zsh" ] || [ -d "$HOME/.config/zsh" ]; then
      echo "zsh config exist, skip"
      return
    fi
    if [ -L "$HOME/.zshrc" ] || [ -e "$HOME/.zshrc" ]; then
      echo "zshrc exist, skip"
      return
    fi
    if [ -L "$HOME/.p10k.zsh" ] || [ -e "$HOME/.p10k.zsh" ]; then
      echo "p10k config exist, skip"
      return
    fi
    echo "Current shell is zsh."
    folder_ensure "$HOME/.config"
    ln -s ~/dotfile/config/zsh ~/.config/zsh
    ln -s ~/dotfile/zshrc ~/.zshrc
    ln -s ~/dotfile/p10krc ~/.p10k.zsh
    echo "Please run source ~/.zshrc"
  else
    echo "Please set zsh as the default shell"
    echo "try chsh -s $(which zsh)"
    return
  fi
}

function go_tmux {
  echo "Tmux setup"
  if [ -L "$HOME/.config/tmux" ] || [ -d "$HOME/.config/tmux" ]; then
    echo "tmux config exist, skip"
    return
  fi
  if [ -L "$HOME/.tmux.conf" ] || [ -e "$HOME/.tmux.conf" ]; then
    echo "tmux.conf exist, skip"
    return
  fi
  if [ -L "$HOME/.tmux/plugins/tpm" ] || [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "plugin tpm exist, skip"
    return
  fi
  ln -s ~/dotfile/config/tmux ~/.config/tmux
  # ln -s ~/dotfile/config/tmux-powerline ~/.config/tmux-powerline
  ln -s ~/dotfile/config/tmux/tmux.conf ~/.tmux.conf
  # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  echo "Please run tmux to check, current prefix is C-x"
  echo "May need to run:"
  echo "C-x and : and source-file ~/.tmux.conf"
  echo "C-x and I to install plugins"
}

function go_nvim {
  echo "Neovim setup"
  if [ -L "$HOME/.config/nvim" ] || [ -d "$HOME/.config/nvim" ]; then
    echo "nvim config exist, skip"
    return
  fi
  ln -s ~/dotfile/config/nvim/ ~/.config/nvim
  echo "Please run vim to initialize"
  echo "If need to fully reinstall LazyVim, please run rm -rf ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim"
  echo "To install new Language Server, please use :Mason then use i to install"
  echo ":MasonUpdate to update"
  echo ":MasonLog to check log"
}

function go_conda {
  echo "Miniconda setup"
  if [ "$(is_installed conda)" == "0" ]; then
    echo "installing miniconda"
    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh
    echo "Please run follows to config conda:"
    echo "conda config --set auto_activate_base false"
  else
    echo "conda exist, skip"
    return
  fi
}


while test $# -gt 0; do
  case "$1" in
    --help)
      help_info
      exit
      ;;
    --check)
      check_requirements
      exit
      ;;
    --sudocheck)
      sudocheck
      exit
      ;;
    --zsh)
      go_zsh
      exit
      ;;
    --tmux)
      go_tmux
      exit
      ;;
    --nvim)
      go_nvim
      exit
      ;;
    --conda)
      go_conda
      exit
      ;;
  esac
  shift
done
