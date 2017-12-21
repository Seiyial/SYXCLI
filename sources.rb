@dotfiles_source = ENV['DOTFILES_SOURCE'] || "/Users/Seiyial/"

@dotfiles_files = [
  {
    path: '.oh-my-zsh',
    savepath: 'oh-my-zsh',
    savename: '.oh-my-zsh'
  },
  {
    path: '.zshrc',
    savepath: 'zshrc',
    savename: '.zshrc'
  },
  {
    path: '.config/karabiner/karabiner.json',
    savepath: 'karabiner json',
    savename: 'karabiner.json'
  }
]