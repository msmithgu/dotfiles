require 'rake'

desc "Install/update git submodules."
task :submodules do
  puts "install/update git submodules.."
  `git submodule init`
  `git submodule update`
end

def overwrite(target, source)
  if File.exists?(source) || File.symlink?(source)
    `rm #{source}`
    `cp -RH #{source} #{source}`
  end
end

desc "Synchronize our working copy with any system changes."
task :sync do
  working_changes = 0
  #working_changes = `git status --porcelain | wc`.strip.split.first.to_i
  if working_changes > 0
    puts "Commit or discard local changes before attempting sync."
  else
    linkables = Dir.glob('*/**{.link}')
    linkables.each do |linkable|
      local_file = linkable.split('/').last.split('.link').last
      system_file = "#{ENV["HOME"]}/.#{local_file}"
      overwrite(linkable, system_file)
    end
  end
end

desc "Copy our dotfiles into system-standard positions."
task :install => [:submodules] do
  linkables = Dir.glob('*/**{.link}')

  skip_all = false
  overwrite_all = false
  backup_all = false

  fish_file = "#{ENV["HOME"]}/.config/fish/config.fish"
  our_fish_file = "#{ENV["PWD"]}/fish/config.fish"
  puts our_fish_file
  if File.exists?(our_fish_file)
    `rm -f #{fish_file}`
    `ln -s #{our_fish_file} #{fish_file}`
  end

  linkables.each do |linkable|
    overwrite = false
    backup = false

    file = linkable.split('/').last.split('.link').last
    target = "#{ENV["HOME"]}/.#{file}"

    if File.exists?(target) || File.symlink?(target)
      unless skip_all || overwrite_all || backup_all
        puts "File already exists: #{target}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
        case STDIN.gets.chomp
        when 'o' then overwrite = true
        when 'b' then backup = true
        when 'O' then overwrite_all = true
        when 'B' then backup_all = true
        when 'S' then skip_all = true
        when 's' then next
        end
      end
      FileUtils.rm_rf(target) if overwrite || overwrite_all
      `mv "$HOME/.#{file}" "$HOME/.#{file}.backup"` if backup || backup_all
    end
    `ln -s "$PWD/#{linkable}" "#{target}"`
  end
end

task :uninstall do

  Dir.glob('**/*.link').each do |linkable|

    file = linkable.split('/').last.split('.link').last
    target = "#{ENV["HOME"]}/.#{file}"

    # Remove all links created during installation
    FileUtils.rm(target)
    
    # Replace any backups made during installation
    if File.exists?("#{ENV["HOME"]}/.#{file}.backup")
      `mv "$HOME/.#{file}.backup" "$HOME/.#{file}"` 
    end

  end
end

task :default => 'install'
