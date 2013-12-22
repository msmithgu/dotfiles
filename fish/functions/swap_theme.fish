function swap_theme --description 'Source a fish theme by name'
  set theme $argv[1]
  . ~/.oh-my-fish/themes/$theme/fish_prompt.fish
end
