require 'fileutils'
include FileUtils

files = { 
  "fish/config.fish" => ".config/fish/config.fish",
  "git/.gitconfig" => ".gitconfig",
  "tmux/.tmux.conf" => ".tmux.conf",
  "vim/.vimrc" => ".vimrc",
}

def dest_path(f)
  dst_dir = ENV.fetch("DST_DIR", File.expand_path("~"))
  "#{dst_dir}/#{f}"
end

def cur_path(f)
  cur_dir = Dir.pwd
  "#{cur_dir}/#{f}"
end

task :install do
  files.each do |src, dst|
    ln_s cur_path(src), dest_path(dst), verbose: true
  end
end

task :clean do
  files.values.each do |f|
    rm_f dest_path(f), verbose: true
  end
end

task reinstall: [:clean, :install]
