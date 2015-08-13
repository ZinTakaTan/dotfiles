#### 言語設定
export LANG=ja_JP.UTF-8

#### パス設定
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:/Applications/MacVim.app/Contents/MacOS
#export MANPATH=<enter path>


#### emacs 風のキーバインド
#bindky -e
## vim 風のキーバインド
bindkey -v



# Aliases Setting: エアリアス設定
# ls -a: all, -C: multicolumn output, -G: colorous output, -l: long
# ls -F: file status (/:directory,*:executable,@:symblic link,=:socket,%:whiteout,|:FIFO)
alias ll='ls -AlFG' la='ls -AG' l='ls -CFG'
alias rm='rm -i' cp='cp -i' mv='mv-i'
alias mkdir='mkdir -p'
#alias git='nocorrect git'
# グローバルエイリアス: 任意の場所で展開できる文字列の設定
alias -g L='| less'
#alias -g H='| head'
#alias -g T='| tail'
#alias -g G='| grep'
#alias -g GI='| grep -i'




# History Setting: ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
# zsh 開始・終了時刻をヒストリに書き込む
# setopt extended_history
# ヒストリを共有
#setopt share_history
# 各セッションがヒストリファイルにヒストリを追加するようになる
#set append_history
set inc_append_history
# 直前と同じコマンドをヒストリに追加しない
setopt hist_ignore_dups
# 追加されるコマンド行が古いものと同じなら古いほうを削除
setopt hist_ignore_all_dups
# ヒストリから選択した後一旦編集
setopt hist_verify
# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space
# history (fc -l) コマンドを追加しない
setopt hist_no_store
# 余分な空白は詰める
setopt hist_reduce_blanks
# 補完時にヒストリをを自動的に展開
setopt hist_expand
# 移動した dir を自動で push しておき Tab + Number で戻る
setopt auto_pushd
setopt pushd_ignore_dups
# cd skipping
setopt auto_cd


## 単語の区切り文字
autoload -U select-word-style
select-word-style default
zstyle 'zle:*' word-chars " /=;:@{}|,"
zstyle 'zle:*' word-style unspecified


## Compilation Configuration: 補完機能
autoload -U compinit
compinit
# Tab で候補を切り替え
setopt auto_menu
# 候補一覧でファイル種別をマーク
setopt list_types
# 候補一覧表示
setopt auto_list
# extended globbing
# setpot extended_glob
# =command を command のパス名に展開
# setopt equal
# --prefix=/usr などの = 以降も補完
# setopt magic_equal_subst
# 補完候補のカーソル選択
# zstyle ':completion:*:default' menu select=1
# カッコの対応などを自動補完
setopt auto_param_keys
# ディレクトリの補完時 / を自動で末尾につける
#setopt auto_param_slash
# 補完候補を詰めて表示
setopt list_packed
# 小文字でも大文字にマッチさせる
zstyle ':completion:*' match-list 'm:{a-z}={A-Z}'
# ../ の後ろでは今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..
# sudo の後ろでコマンド名を補完
zstyle ':completion:*:sudo:*' command-path $PATH
# ps のプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


# 色の使用
autoload -U colors
colors
# 色の表示 shellscript
# for c in {016..225}; do echo -n "\e[38;5;${c}m $c" ; [ $(($((c-16))%6)) -eq 5 ] && echo;done;echo
# プロンプトの色付け
# PROMPT 変数内で変数参照をする
setopt prompt_subst
case ${UID} in
		  501)
					 PROMPT="%B%{${fg[white]}%}%m%#%{${reset_color}%}%b "
					 PROMPT2="%B%{${fg[white]}%}%_%#%{${reset_color}%}%b "
					 SPROMPT="%B%{${fg[white]}%}%r is correct? [n,y,a,e]:%[%{reset_color}%}%b "
					 RPROMPT="%B%{${fg[black]}%}%45<...<%~%{${reset_color}%}%b "
					 [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
								PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
					 ;;
			*)

					 PROMPT="%{${fg[white]}%}%/%%%{${reset_color}%} "
					 PROMPT2="%{${fg[white]}%}%_%%%{${reset_color}%} "
					 SPROMPT="%{${fg[white]}%}%r is correct? [n,y,a,e]:%[%{reset_color}%} "
					 [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
								PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
					 ;;
esac
#local GREEN=$'%{¥e[1;32m%}'
#local BLUE=$'%{¥e[1;34m%}'
#local DEFAULT=$'%{¥e[1;m%}'
#PROMPT=$BLUE'[%N]%# '$WHITE
#RPROMPT=$GREEN'[%~]' $WHITE
# 右プロンプトの表示を最後の行だけにする
setopt transient_rprompt
# 補完候補の色付け
#eval 'dircolors'#							#not function
#export ZLS_COLORS_$LS_COLORS#			#in BSD ls environmental variable for color is LSCOLORS
zstyle ':completion:*:default' list-colors ${(s.:.)LSCOLORS}



# no beep
setopt nobeep
## jobs コマンドの出力をデフォルトで jobs -l に
#setopt long_list_jobs
## サスペンド中のプロセスと同じコマンド名を実行した時は resume
#setopt auto_resume
##	改行コードで終わらない行も表示する
#unsetopt promptcr
# ファイル名の展開は辞書順ではなく数値的に
# setopt numeric_glob_sort
# 出力時 8bit を通す（日本語表示可能に）
setopt print_eight_bit
# スペルチェック
# setopt correct
# {a-c} を a b c と展開
# setopt brace_ccl
# Ctrl-S/Ctrl-Q によるフロー制御の停止
# setopt NO_flow_control
# コマンドラインでも # 以降をコメントとみなす
# setopt interactive_comments
# ファイル名の展開でディレクトリにマッチした場合末尾に / を入れる
setopt mark_dirs
# 最後のスラッシュを削除しない
setopt noautoremoveslash
# コアダンプサイズを制限
# limit coredumpsize 102400


###############  参考  ###########################
# zshbuildins (1) Linux man page -- linux.die.net/man/1/zshbuildins
##################################################
# zshoptions manual（訳）-- ayu.ins.keio.ac.jp/~mukai/translate/zshoptions.html
##################################################
# 少し凝った zshrc -- gist.gituhb.com/mollidier/zshrc_useful.sh
# Lisence: MIT
# http://mollifier.mit-lisence.org/
##################################################
# 世界中の羊をかき集めて -- shepherdmaster.hateblo.jp/entry/20110924/1316881131
##################################################
# zsh は至高の便利性？... -- futurismo.biz/archives/1363
##################################################
# yuyunko's blog__zsh の設定, zshrc --yuyuko.hatenablog.com/entry/20101112/1289551129 ##################################################
# voidy21 の日記__zsh の zstyle での補完時の挙動について -- voidy21.hatenablog.jp/entry/20090902/12511918174
##################################################
# Zsh のオススメ設定集 -- github.com/clear-code/zsh.d
##################################################
# 技術めも__.zshrc を設定してみる -- d.hatena.ne.jp/oovu70/20120405/p1
#
