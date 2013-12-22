set swap_themedir $HOME/.oh-my-fish/themes

function swap_themes
  ls -1 $swap_themedir/
end

function swap_theme --description 'Source a fish theme by name'
  set theme $swap_themedir/$argv[1]/fish_prompt.fish
  if test -f "$theme"
    source $theme
  else
    swap_themes
  end
end

for t in (swap_themes)
  set d (sed -n '/^[a-zA-Z]/p' $swap_themedir/$t/*.md | head -1)
  complete -x -c swap_theme -a $t -d "$d"
end
