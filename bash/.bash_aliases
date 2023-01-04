ZIG_PATH=/mnt/c/Users/kazto/AppData/Roaming/Zig/zig-linux-x86_64-0.10.0
if [ -f $ZIG_PATH/zig ]
then
  PATH=$ZIG_PATH:$PATH
fi

export PATH

