"#### Configure for neobundles.
"Note: skip initialization for vim-tiny or vim-small
if 0 | endif

if has('vim_starting')
		  if &compatible
					 set nocompatible
		  endif

		  "Required:
		  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
"Required:
call neobundle#begin(expand('~/.vim/bundle/'))

"Let NeoBundle manage NeoBandle
"Required:
NeoBundleFetch 'Shougo/neobundle.vim'



"###### My Bundles here:
"NOTE: Don't set neobundle setting in .gvimrc!
NeoBundle 'lervag/vimtex'
NeoBundle 'deton/imactivatemap.vim'

call neobundle#end()


"Required:
filetype plugin indent on
"If there are uninstalled bundle found on startup,
"this will conveniently prompt you to install them
NeoBundleCheck
