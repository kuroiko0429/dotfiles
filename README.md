# dotfiles

CachyOS + Hyprland環境の設定ファイル。テーマは全部Gruvbox。
[GNU Stow](https://www.gnu.org/software/stow/)でシンボリックリンク管理してる。

## 構成

| パッケージ | 内容 |
| :--- | :--- |
| `hypr/` | Hyprland (Lua設定 / `hyprland.lua`起点でモジュール分割) |
| `nvim/` | Neovim ([lazy.nvim](https://github.com/folke/lazy.nvim) + Gruvboxカラースキーム) |
| `tmux/` | tmux ([TPM](https://github.com/tmux-plugins/tpm)でプラグイン管理、prefixは`C-z`) |
| `kitty/` | kitty ターミナル |
| `zsh/` | zsh + [Oh My Zsh](https://ohmyz.sh/) + [Powerlevel10k](https://github.com/romkatv/powerlevel10k) |
| `btop/` | btop（Gruvboxテーマ） |
| `lazygit/` | lazygit（Gruvboxテーマ、force-with-leaseのカスタムコマンド等） |

## 必要なもの

導入前に以下が入ってること前提。

- [GNU Stow](https://www.gnu.org/software/stow/)
- Hyprland（Lua設定対応版）, kitty, tmux, neovim, zsh
- [Oh My Zsh](https://ohmyz.sh/)
- Oh My Zshカスタムプラグイン: [powerlevel10k](https://github.com/romkatv/powerlevel10k)（テーマ）, [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting), [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- JetBrains Mono Nerd Font
- あると幸せ: `eza`, `bat`, `zoxide`, `fzf`, `navi`, `lazygit`, `btop`, `fastfetch`

## 導入

```sh
git clone git@github.com:kuroiko0429/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow -t ~ hypr nvim tmux kitty zsh btop lazygit
```

tmuxのプラグインは初回起動後 `prefix + I`（=`C-z I`）でTPM経由インストール。
neovimはlazy.nvimが初回起動時に自動でブートストラップされる。

## 関連リポジトリ

- [hyprscroller-ng](https://github.com/kuroiko0429/hyprscroller-ng) — Hyprlandプラグイン
- [gruv-shell](https://github.com/kuroiko0429/gruv-shell) — Quickshell製ステータスバー（`kuroiko_bar`）

## 注意

- `hypr/.config/hypr/.back/` と `hypr/.config/hypr/plugins/*.so` はこのリポジトリでは追跡してない（旧設定バックアップ・ビルド成果物）
- 動作確認環境: CachyOS (Panasonic Let's Note SV1)。他ディストロだと調整が必要な箇所あり
