" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.
" 
" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on
"}}}

"------------------------------------------------------------
" Must have options {{{
"
" These are highly recommended options.
 
" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Search as characters are entered
set incsearch

" Highlight searches (use <Ctl-L> to temporarily turn off highlighting; see the
" mapping of <Ctl-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline
"}}}

"------------------------------------------------------------
" Usability options {{{
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.
"  
" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" ´press <Enter> to continue´
set cmdheight=2

" Display line numbers on the left
set number

" draws a horizontal highlight (or underline, depending on your colorscheme)
" on the line your cursor is currently on.
set cursorline

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>
"}}}

"------------------------------------------------------------
" Indentation options {{{
"
" Indentation settings according to personal preference.
 
" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set shiftwidth=4
set softtabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
"set shiftwidth=4
"set tabstop=4

" Enable folding
set foldenable

" Open most folds by default.
" ´foldlevelstart´ is the starting fold level for opening a new buffer. If it is
" set to 0, all folds will be closed. Setting it to 99 would guarantee folds
" are always open. So, setting it to 10 here ensures that only very nested
" blocks of code are folded when opening a buffer.
set foldlevelstart=10

" Folds can be nested. Setting a max on the number of folds guards against too
" many folds. If you need more than 10 fold levels you must be writing some
" Javascript burning in callback-hell and I feel very bad for you.
set foldnestmax=10

" Fold based on indent level
" This tells Vim to fold based on indentation. This is especially useful for
" me since I spend my days in Python. Other acceptable values are marker,
" manual, expr, syntax, diff. Run :help foldmethod to find out what each of
" those do.
set foldmethod=indent
"}}}

"------------------------------------------------------------
" Mappings {{{
"
" Useful mappings
 
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <Ctl-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

" Vim will keep highlighted matches from searches until you either run a new
" one or manually stop highlighting the old search with :nohlsearch. I find
" myself running this all the time so I've mapped it to ,<space>.
nnoremap <leader><space> :nohlsearch<CR>

" space open/closes folds
" I change the mapping of <space> pretty frequently, but this is its current
" command. za opens/closes the fold around the current block. As an interesting
" aside, I've heard the z character is used to represent folding in Vim because
" it looks like a folded piece of paper. Probably not, but it makes a nice story. :)
nnoremap <space> za

" Move vertically by visual line
" These two allow us to move around lines visually. So if there's a very long
" line that gets visually wrapped to two lines, j won't skip over the "fake"
" part of the visual line in favor of the next "real" line.
nnoremap j gj
nnoremap k gk

" Highlight last inserted text
" This one is pretty cool. It visually selects the block of characters you
" added last time you were in INSERT mode.
nnoremap gV `[v`

" Leader is comma
" \ is a little far away for a leader. I've found , to be a much better
" replacement.
let mapleader=","

" Toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" Save session
" Ever wanted to save a given assortment of windows so that they're there next
" time you open up Vim? :mksession does just that! After saving a Vim session,
" you can reopen it with vim -S. Here I've mapped it to ,s, which I remember
" by thinking of it as "super save".
nnoremap <leader>s :mksession<CR>

" Open ag.vim
" The Silver Searcher is a fantastic command line tool to search source code
" in a project. It's wicked fast. The command line tool is named ag (like the
" element silver). Thankfully there is a wonderful Vim plugin ag.vim which
" lets you use ag without leaving Vim and pulls the results into a quickfix
" window for easily jumping to the matches. Here I've mapped it to ,a.
nnoremap <leader>a :Ag

" CtrlP settings
" ctrlp.vim is my life in Vim. If you've never used a fuzzy file searcher this
" will open your eyes. If you're currently using commandt.vim, you're on the
" right track, but CtrlP is the spiritual successor. It's can be (see below)
" significantly faster and more configurable than CommandT (Thanks Reddit!).
" Anyways here are my settings for CtrlP.
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" Allows cursor change in tmux mode
" These lines change the cursor from block cursor mode to vertical bar cursor
" mode when using tmux. Without these lines, tmux always uses block cursor
" mode.
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Autogroups
" This is a slew of commands that create language-specific settings for
" certain filetypes/file extensions. It is important to note they are wrapped
" in an augroup as this ensures the autocmd's are only applied once. In
" addition, the autocmd! directive clears all the autocmd's for the current
" group.
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md
                \:call <SID>StripTrailingWhitespaces()
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END

" Backups
" If you leave a Vim process open in which you've changed file, Vim creates a
" "backup" file. Then, when you open the file from a different Vim session,
" Vim knows to complain at you for trying to edit a file that is already
" being edited. The "backup" file is created by appending a ~ to the end of
" the file in the current directory. This can get quite annoying when
" browsing around a directory, so I applied the following settings to move
" backups to the /tmp folder.
" "backup" and "writebackup" enable backup support. As annoying as this can be, it
" is much better than losing tons of work in an edited-but-not-written file.
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" Toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

" Strips trailing whitespace at the end of files. this is called on buffer
" write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
"}}}

"------------------------------------------------------------

execute pathogen#infect()
"syntax on
"filetype plugin indent on
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"colorscheme badwolf

set runtimepath^=~/.vim/bundle/ag

set modelines=1
" vim:foldmethod=marker:foldlevel=0

