# improve zsh startup time, taken from - https://blog.jonlu.ca/posts/speeding-up-zsh
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git asdf npm)

source $ZSH/oh-my-zsh.sh
source ~/.zsh_profile
source ~/.zsh_priv

# pnpm
export PNPM_HOME="/Users/iv0700/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
# pnpm end

cap() { CI=1 "$@" < /dev/null 2>&1 | tee out.log; }

# wrapper for fzf cd commands
cl() {
  bash ~/.local/scripts/cl "$@"
}
eval "$(mise activate zsh)"

# lean-ctx shell hook — begin
if [ -f "/Users/iv0700/.config/lean-ctx/shell-hook.zsh" ]; then
. "/Users/iv0700/.config/lean-ctx/shell-hook.zsh"
fi
# lean-ctx shell hook — end



