# RUST
source $HOME/.cargo/env
export RUST_SRC_PATH=`rustc --print sysroot`/lib/rustlib/src/rust/src

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# RVM
export PATH="$PATH:$HOME/.rvm/bin"
