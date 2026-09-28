# ==========================================
# Powerlevel10k Instant Prompt (起動高速化)
# ※この設定は必ずファイルの先頭付近に置く
# ==========================================
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ==========================================
# Oh My Zsh 基本設定
# ==========================================
# Oh My Zshのインストールパス
export ZSH="$HOME/.oh-my-zsh"

# 使用するテーマの設定
ZSH_THEME="powerlevel10k/powerlevel10k"

# 読み込むプラグイン
plugins=(
  git
  extract
  # tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
)

fpath=(~/.local/share/iqos-tracker /usr/share/zsh/site-functions $fpath)

# Oh My Zsh本体の読み込み (compinitはこの中で1回だけ呼ばれる)
source $ZSH/oh-my-zsh.sh

# Gruvbox colors
ZSH_HIGHLIGHT_STYLES[command]='fg=#b8ba25,bold'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#b8ba25,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=#b8ba25,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#b8ba25,bold'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#cc231c'
ZSH_HIGHLIGHT_STYLES[path]='fg=#fabc2e,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#b8ba25'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#b8ba25'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#928373'
ZSH_HIGHLIGHT_STYLES[named-fd]='fg=#83a597'
ZSH_HIGHLIGHT_STYLES[numeric-fd]='fg=#83a597'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=#d3859a'
ZSH_HIGHLIGHT_STYLES[assign]='fg=#d3859a'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#928373'

# ==========================================
# 補完機能の強化 (Zstyle)
# ==========================================
# Tabキーを押したとき、候補を一覧表示して矢印キーで選べるようにする
zstyle ':completion:*:default' menu select=1
# 補完するときに大文字・小文字を区別しない
zstyle ':completionD:*' matcher-list 'm:{a-z}={A-Z}'
# 補完候補に色を付けて見やすくする
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 
# オプションの説明文も一緒に表示する
zstyle ':completion:*' verbose yes

# ==========================================
# 履歴検索の強化
# ==========================================
if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
fi
# 上下キーに割り当て
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ==========================================
# キーバインド (Vimモード)
# ==========================================
# zshの操作をVimモードにする
bindkey -v
# Escキーを押してノーマルモードに戻るまでの遅延をなくす
KEYTIMEOUT=1

# ==========================================
# 外部ツール連携 (zoxide, fzf, navi)
# ==========================================
# zoxide (賢いcdコマンド)
if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi

# fzf (あいまい検索ツール)
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
    source /usr/share/fzf/key-bindings.zsh
fi
if [ -f  /usr/share/fzf/completion.zsh ]; then
    source /usr/share/fzf/completion.zsh
fi
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border=rounded'
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=bg+:#3c3836,bg:#272727,spinner:#fb4833,hl:#928374"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=fg:#ebdbb2,header:#928374,info:#8ec07b,pointer:#fb4833"
FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS --color=marker:#fb4833,fg+:#ebdbb2,prompt:#fb4833,hl+:#fb4833"

# navi (コマンドチートシート / Ctrl+g で起動)
if command -v navi >/dev/null 2>&1; then
    eval "$(navi widget zsh)"
fi

# ==========================================
# エイリアス (短縮コマンド)
# ==========================================
# alias ls='eza --icons'
# alias ll='eza -l --icons'
# alias la='eza -la --icons'
# alias tree='eza --tree --icons'
# alias cat='bat'
# alias lg='lazygit'
# alias sl='ls'
# alias qp='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'
alias -g G='| grep'
alias -g W='| wc -l'
alias -g L='| less'
alias nv='nvim'
alias pi='omp'
# --- ls / eza ---
if command -v eza >/dev/null 2>&1; then
    # ezaがインストールされている場合 (CachyOSなど)
    alias ls='eza --icons auto'
    alias ll='eza -l --icons auto'
    alias la='eza -la --icons auto'
    alias tree='eza --tree --icons auto'
else
    # ezaがない場合 (デフォルトのUbuntuコンテナなど)
    alias ls='ls --color=auto'
    alias ll='ls -l'
    alias la='ls -la'
fi

# --- cat / bat ---
if command -v bat >/dev/null 2>&1; then
    # Archなど、標準でbatコマンドが使える場合
    alias cat='bat'
elif command -v batcat >/dev/null 2>&1; then
    # Ubuntuなど、名前がbatcatになっている場合
    alias cat='batcat'
fi

# --- lazygit ---
if command -v lazygit >/dev/null 2>&1; then
    alias lg='lazygit'
fi

# --- パッケージマネージャ (qp) ---
if command -v pacman >/dev/null 2>&1; then
    # Arch系の場合
    alias qp='pacman -Qq | fzf --preview "pacman -Qil {}" --layout=reverse --bind "enter:execute(pacman -Qil {} | less)"'
elif command -v dpkg >/dev/null 2>&1; then
    # おまけ：Ubuntu系の場合の簡易パッケージ検索
    alias qp='dpkg -l | fzf'
fi

# --- その他 (環境に依存しないもの) ---
alias sl='ls'
alias py="python"
alias hms="home-manager switch --flake ~/.config/home-manager"
alias up="uv run python"

# ==========================================
# XWayland
# ==========================================
export QT_QPA_FONTDIR=/usr/share/fonts

# ==========================================
# テーマの詳細設定と起動時コマンド
# ==========================================
# Powerlevel10kの詳細設定ファイルの読み込み
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

export EDITOR=nvim

# ターミナル起動時にシステム情報を表示
if command -v fastfetch >/dev/null 2>&1; then
    fastfetch --logo CachyOS_small -s "OS:Kernel:Uptime:Packages:CPU:GPU:Memory:Disk"
elif command -v neofetch >/dev/null 2>&1; then
    neofetch
fi
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
export PATH="/home/kuroiko/.cache/.bun/bin:$PATH"
