## GIT
```
# Git setting
# if need, create keys
# ssh-keygen -t ed25519 -C "*"
# ssh-keygen -t rsa -b 4096 -C "*"
git config --global user.name "youxing"
git config --global user.email youxing@air
# gh
gh auth login
# clone
git clone https://github.com/marsjane/dotfile.git ~/dotfile
git clone git@github.com:marsjane/dotfile.git ~/dotfile
```

## Ubuntu

```
chmod +x ~/dotfile/setup.sh.sh
sudo apt-get install git build-essential cargo
~/dotfile/setup.sh
```
these packages will be installed
```
zsh git silversearcher-ag pip3 curl Node.js npm neovim xclip tmux tpm fonts-firacode snapd fonts-powerline zoxide fdfind ripgrep bat
```

## Arch i3wm

```
ln -s ~/dotfile/config/i3 ~/.config/i3
chmod +x ~/.config/i3/polybar/launch.sh
```

## MacOS

### General Guide

```
# Pre work
- Xcode command line tools
- Git
- ssh key to github
- Quantumult X
- AppStore SG login

# Script install
- Run macos_setup.sh script to install and run as instructed
- SIP setting
- Setup yabai related
- Reboot
```

### App Pref

```
BetterTouchTool: Preset, start at login, mouse, activate
Displaylink: start at login, experimental resolution
onedrive
dropbox
Todesk: diable start at login
Nomachine: diable start at login
displayplacer list
```

### Reference(Mac)

```
# refer to https://www.sorrycc.com/posts/macbook-pro-configuration-from-zero

# Fonts
brew install font-source-code-pro
brew install font-sarasa-gothic

# Font names
JetBrainsMono Nerd Font
Hack Nerd Font Mono
SF Pro
sketchybar-app-font
Liga SFMono Nerd Font

# Setapp (can also go without it)
SetApp
 AirBuddy \
 AIDente Pro \
 bartender \
 bettertouchtool \
 cleanshot \
 Dash \
 Dato \
 downie \
 Forklift \
 istat-menus \
 KeyKey Typing Tutor \
 NotePlan \
 Session \
 TypingMind
  

arc                   ->  browser
balenaetcher          ->  Tool to flash OS images
battery-buddy         ->  cute battery
brave-browser         ->  browser
cyberduck             ->  Server and cloud storage browser
dteoh-devdocs         ->  code docs
espanso               ->  snippets
handbrake             ->  video transcoder
karabiner-elements    ->  free key mapper
keycastr              ->  key record
gimp                  ->  image editor
iterm2                ->  Terminal
itsycal               ->  Calendar
mos                   ->  Mouse controller
neteasemusic          ->  Music
nomachine             ->  Remote
nutstore              ->  WebDev Cloud
obs                   ->  video recording and live streaming
raycast               ->  launcher
setapp                ->  Pay app sets
sourcetree            ->  Git client
spaceid               ->  Show spaceid on menu bar
squirrel              ->  input method
stats                 ->  Monitor menu bar
thor                  ->  App starter
todesk                ->  Remote tool
usr-sse2-rdm          ->  Retina display to custom resolutions
videofusion           ->  VideoFusion video edit
warp                  ->  Rust-based terminal

# terminal
iterm2 or terminal
# theme
https://github.com/daltonmenezes/aura-theme.git
# use JetbrainsMonoNL Nerd Font
# other setting
iterm2 key should use esc+ for Option-key && enable App access clipboard

```

## More Reference

### zsh related
```
# zsh deps
zsh fdfind fzf zoxide ripgrep bat

# confirm use zsh as default
echo $SHELL
# or can refer to https://unix.stackexchange.com/questions/136423/making-zsh-default-shell-without-root-access

```

### rainbar
for [rainbar](https://github.com/creaktive/rainbarf/tree/master)  
Either setup with
```
# try this new method
cpan Module::Build
sudo cpan -i App::rainbarf
# if not working
mkdir ~/local
git clone https://github.com/creaktive/rainbarf.git ~/local/rainbarf
cd ~/local/rainbarf
perl Build.PL
./Build test
./Build install
# mac already installed above
```
or can disable this bar by edit
```
~/.config/tmux-powerline/themes/powerline-theme.sh
```
