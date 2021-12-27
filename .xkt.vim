" breaks paste
" setglobal mouse=a
setglobal cursorline
set hls
set incsearch
set ignorecase
set smartcase
setglobal wildmenu
" TODO find good use for this one
" noremap Ã¹ .

syntax on

set tabstop=2 shiftwidth=2 expandtab

" xkt
" clipboard
" set clipboard=unamed
noremap <LeftRelease> "+y<LeftRelease>

" all this is dangerous TODO make it clean

map mm mm
nmap ,m `m

nmap <space> v
" nmap <space><space> V
" vmap <space> y
nmap g, <c-w>
nmap ,<space> gcc
xmap ,<space> gcc
nmap ,p PPgccj
"nnoremap Ã§ %
"xnoremap Ã§ %
nmap gl $
"nmap Ã© {
"vmap Ã© {
"nmap Ã  }
"vmap Ã  }
" nmap <Esc>t :set hls<cr>/<c-r><c-w><cr>
nnoremap sy :set hls<cr>/<c-r>"<cr>N
" nmap gr <Plug>(choosewin)
" TODO change some mappings on space visual back to unite
" TODO make search hls at the same time
nnoremap <space>p <end>a<space><esc>p
nmap <space>= <c-w>=
nnoremap <c-g> 1<c-g>
nnoremap g<c-g> <c-w><c-r>
" nnoremap <c-s-tab> :tabp<cr>
" nnoremap <c-tab> :tabn<cr>
nnoremap <c-pageup> :tabp<cr>
nnoremap <c-pagedown> :tabn<cr>
nnoremap <a-t> :tabnew<cr>
nnoremap <esc>t :tabnew<cr>
nnoremap [Tag]n :tabnew<cr>
" nmap gB :exe "tabn ".g:lasttab<CR>
nnoremap ma ggVG
noremap z w
noremap Z W
noremap w z
noremap W Z
nnoremap dz dw
nnoremap dw dz
" noremap a q
noremap A mhvapgqj`h
noremap q a
noremap Q A
onoremap z w
onoremap Z W
onoremap a q
onoremap A Q
onoremap ir i]
onoremap iv i}
onoremap qr a]
onoremap qv a}
noremap j gj
noremap k gk
nmap yiz yiw
nmap yiZ yiW
nnoremap yaz yaw
nnoremap yaZ yaW
" nnoremap ;d vip}p
nnoremap cz mh*`hcw
nnoremap ciz *``ciw
nnoremap ciZ *``ciW
nnoremap caz *``caw
nnoremap caZ *``caW
nnoremap viz viw
nnoremap viZ viW
nnoremap vaz vaw
nnoremap vaZ vaW
nnoremap diz diw
nnoremap diZ diW
nnoremap daz daw
nnoremap daZ daW
nnoremap dqz daw
nnoremap dqZ daW
nnoremap mh mh
nnoremap `h `h
" duplicate
nnoremap [Leader]d mhyyp`hj
" duplicate and comment
nmap [Leader]c<space> mhyypkgci`hj
nmap dc mhyypkgci`hj
" TODO need to remap q to clean exit and macro to something else
nnoremap ,q q
" nnoremap <m-q> :up<cr>:q<cr>
" nnoremap <Leader><tab> :b#<cr>
nnoremap ,<tab> :b#<cr>
" nnoremap <bs> <c-o>
" nnoremap <s-bs> <c-i>
"TODO find good use of this one
" nnoremap Âµ @:
" execute and paste goody command
" TODO simplify this one and use it better
nnoremap <leader>sR yy:.!sh<cr>P
" reselect last
nnoremap gV V`]
" nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'
" TODO put back this?
" nnoremap <esc><esc> <esc>:update<cr>
" map ! /
nnoremap ! /
nnoremap d! d/
nnoremap c! c/
nnoremap v! v/
nnoremap y! y/

" on mac
" map = /
" nnoremap = /
" vnoremap = /
" cnoremap = /
nnoremap d= d/
nnoremap c= c/
nnoremap v= v/
nnoremap y= y/

nnoremap è =
cnoremap è =

nnoremap ° (
nnoremap à }
nnoremap é {

" TODO find another way to do this
" nnoremap vv<space> ^vg_
" nnoremap g! :global//print<cr>
" vnoremap g! :global//print<cr>
" nnoremap ,m :CtrlPMRUFiles<CR>
" nnoremap ,! :CtrlPMRUFiles<CR>
nnoremap <leader>& :up<cr>:!%<cr>
nnoremap <leader>g :up<cr>:!%<cr>
nnoremap <PageDown> <c-f>
nnoremap <PageUp> <c-b>
" nnoremap ,, <C-w>p
" TODO use terrymaps to continue / configure unite
" nnoremap Ã¹ :set hls<cr>n
" nnoremap % .n
nnoremap <silent> gk :call cursor(0, virtcol('$')/2)<CR>
vnoremap <silent> gk mh:call cursor(0, virtcol('$')/2)<CR>v`ho
nnoremap gm :g//<cr>

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction

command! ZoomToggle call s:ZoomToggle()
nnoremap <silent> ,o :ZoomToggle<CR>

function! OpenLastBufferInNewTab()
    redir => ls_output
    silent exec 'ls'
    redir END
    let ListBuffers = reverse(split(ls_output, "\n"))
    for line in ListBuffers
      let title = split(line, "\"")[1]
      if title !~  "\[No Name"
        execute "tabnew +" . split(line, " ")[0] . "buf" 
        break
      endif       
    endfor  
endfunction

command! ReOpenLastBufferInNewTab call OpenLastBufferInNewTab()

" to make format work
nnoremap gq ga
" nnoremap <esc>; <c-w>w
" nmap gq ga
nnoremap s* :set hls<cr>*N
vnoremap ! !
" nnoremap g<space> <c-w>w
nnoremap v<space> viw
" nnoremap vg 0v$
nnoremap vm v$

" R: Reindent entire file
"nnoremap R mqHmwgg=G`wzt`q
nnoremap ,r :FZFMru<cr>
" nnoremap ,R mqHmwgg=G`wzt`q
" Ctrl-ss: (S)earch word under cur(s)or in current directory
" nnoremap <c-s><c-s> :Unite -buffer-name=grep grep:.::<C-r><C-w><CR>
" Ctrl-sr: Easier (s)earch and (r)eplace
nnoremap <c-s><c-r> :%s/<c-r><c-w>//gc<left><left><left>
" go substitute because the default map for sleeping is silly
nnoremap gs :%s//g<Left><Left>

" and here for those who have 'gdefault' enabled
nnoremap gs :%s//<Left>

" split followed by command
nnoremap __ :split \|<Space>

" correct previous misspelling
" nnoremap <C-s> [s1z=<c-o>
" inoremap <C-s> <c-g>u<Esc>[s1z=`]A<c-g>u

" nnoremap n nzzzv
nnoremap c "_c
" vnoremap d "_d
" " Up Down Left Right resize splits
" nnoremap <up> <c-w>+
" nnoremap <down> <c-w>-
" nnoremap <left> <c-w><
" nnoremap <right> <c-w>>
"===============================================================================
" Visual Mode Key Mappings
"===============================================================================
" y: Yank and go to end of selection
xnoremap y y`]

" Enter: Highlight visual selections
" xnoremap <silent> <CR> y:let @/ = @"<cr>:set hlsearch<cr>

" Backspace: Delete selected and go into insert mode
xnoremap <bs> c

" .: repeats the last command on every line
xnoremap . :normal.<cr>

" @: repeats macro on every line
xnoremap @ :normal@
" usual combos
nnoremap eq ea
nmap cii cib
nnoremap sl s
" surround
" nnoremap xp xp

function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  echo s:uri
  if s:uri != ""
    silent exec "!chromium '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction
nnoremap gX :call HandleURL()<cr>

nmap <space>s  <Plug>(vimshell_switch)
" nnoremap !  q:VimShellExecute<Space>
" expand all folds
nnoremap ea zR
" open path in current line in vimfiler (use with everything)
nnoremap g<cr> yy:q<cr>:enew<cr>:VimFiler <c-r>"<cr>
" nnoremap <space><tab> :b#<cr>
nnoremap <c-s-e> :VimFilerBufferDir<cr>
" put split on left
nnoremap gL <c-w>L
nnoremap mL <c-w>T
" copy path to clipboard and open in vim use it in unite everything
" nnoremap gt yy:e <c-r>"<bs><cr>
vnoremap gs y:OpenBrowserSmartSearch <c-r>"<cr>
" reopen last file
" nnoremap 00 `0
nnoremap 00 `0gi<esc>
nnoremap <space>vm :<C-u>Unite mapping -start-insert<cr>

" nnoremap <space>VM :<C-u>UniteWithBufferDir -buffer-name=maps -input=nnoremap -start-insert grep:.:nnoremap:<cr>
nnoremap <space>cm :<C-u>Unite -path=~/.vim/rc -start-insert grep:::nnoremap\|nmap\|vnoremap\|vmap\|inoremap\|imap<CR>
nnoremap [Window]t :<C-u>Unite tab -start-insert<cr>
" nnoremap ;o :<C-u>Unite outline -split -vertical -no-quit<cr><c-w>L
nnoremap mo :<C-u>Unite outline -split -vertical -no-quit<cr><c-w>L
" needed?
vmap <Tab> Z
nmap Ã¹ <cr>
cmap Ã¹ <cr>
omap Ã¹ <cr>
xmap Ã¹ <cr>
autocmd FileType unite imap <buffer><special> Ã¹ <cr>

" navigate like bash
nnoremap <c-bs> ciw
cmap <c-bs> <c-w>
cmap <a-f> <c-right>
cmap <a-b> <c-left>
cmap <a-d> <c-right><c-w>
" quick search for mapping (use internal shougo better?)
nnoremap [Alt]m :verbose map 
"nnoremap vm :verbose map 
inoremap <c-bs> <c-w>

" nnoremap <a-d> :let @+=expand("%:p")<cr>:echo "Copied current file path!"<cr>
" open vim at path in clipboard removing quotes
" nnoremap <a-e> :let @p=substitute('<c-r>+',"\"","","g")<cr>:e <c-r>p<cr>

" recursively search for tags
set tags=tags;/
command! -nargs=0 GenCtags :!ctags -R *.c *.h

function! LoadCscope()
	if (executable("cscope") && has("cscope"))
		let UpperPath = findfile("cscope.out", ".;")
		if (!empty(UpperPath))
			let path = strpart(UpperPath, 0, match(UpperPath, "cscope.out$") - 1)	
			if (!empty(path))
				let s:CurrentDir = getcwd()
				let direct = strpart(s:CurrentDir, 0, 2) 
				let s:FullPath = direct . path
				let s:AFullPath = globpath(s:FullPath, "cscope.out")
				let s:CscopeAddString = "cs add " . s:AFullPath . " " . s:FullPath 
				execute s:CscopeAddString 
			endif
		endif
	endif
endfunction
command! LoadCscope call LoadCscope()

" autosource vimrc and xkt.vim
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost .xkt.vim source %

" :!cscope -Rbq
" :cs reset
" check this out fast autoreload
" http://vim.sourceforge.net/scripts/script.php?script_id=5098

nnoremap [Tag]m :tag <c-r><c-w><cr>

function! GotoDefinition()
  let n = search("\\<".expand("<cword>")."\\>[^(]*([^)]*)\\s*\\n*\\s*{")
endfunction


nnoremap gz 4w
nnoremap c_ c^
nnoremap d_ d^
"map Ã§ $

inoremap ,; <esc>:x<cr>
nnoremap ,; :x<cr>

" nnoremap :; :wq<cr>
" inoremap :; <esc>:wq<cr>

inoremap ,, <esc>:w<cr>
nnoremap ,, :w<cr>
" careful a bit dangerous
" nmap <bs> db
" nnoremap ;r :Unite file_mru<cr>

" Evoke a web browser
function! Browser ()
  let line0 = getline (".")
  let line = matchstr (line0, "http[^ ]*")
  :if line==""
  let line = matchstr (line0, "ftp[^ ]*")
  :endif
  :if line==""
  let line = matchstr (line0, "file[^ ]*")
  :endif
  let line = escape (line, "#?&;|%")
  " echo line
  exec ":silent !firefox ".line
endfunction
"vnnoremap ;g :call Browser ()<CR>:redraw!<cr>

" python drop in shell after pb
" import sys, ipdb, traceback
" def info(type, value, tb):
"     traceback.print_exception(type, value, tb)
"     print
"     ipdb.pm()
"
" sys.excepthook = info
" nnoremap <silent> <F5> :!clear;python %<CR>

" custo maps
" change inside <anything>
" nmap ci<space> cib
nnoremap y<space> y$
nnoremap ci<space> cib
nnoremap di<space> dib
nnoremap d<space> d$
nnoremap c<space> c$
nnoremap dh d^
nnoremap ch c^
nnoremap <S-space> V
" unmap <space>
" unmap <space><space>
"map <space><space> vv
"map <space> v
"nmap ;<space> V
"need to remove ; mappings for this to work
"TODO try hack with redraw
nmap ; .<esc>
"nmap Ã¨ .
" otherwise will delete
smap <esc> <esc>
nnoremap H ^
nnoremap L $
" nnoremap Â² :x<cr>

cnoremap W w !sudo tee %
vnoremap <space> "*y

" reopen last position cursor
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

nnoremap ,a :Unite file_mru<cr>

nnoremap ,gf :vsp <cfile><cr>
nnoremap ,f :FZF<cr>
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

"set undofile
"set autowrite
"set autowriteall
"set nofoldenable
"
"set backupdir=.backup/,~/.backup/,/tmp//
"set directory=.swp/,~/.swp/,/tmp//
"set undodir=.undo/,~/.undo/,/tmp//

" vertical split separator get out!!!
set fillchars=""
" remove tilde end of file
" highlight EndOfBuffer ctermfg=bg ctermbg=bg
" or
" hi NonText guifg=bg
" hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg

" function! AdjustCandy()
"      hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" endfunction
"
" augroup candy_colors
"     autocmd!
"     autocmd ColorScheme candy call AdjustCandy()
" augroup END
"

" Resize the current split to at least (90,25) but no more than (140,60)
" or 2/3 of the available space otherwise.
" function! Splitresize()
"     " let hmax = max([winwidth(0), float2nr(&columns*0.66), 90])
"     " let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
"     " exe "vertical resize" . (min([hmax, 140]))
"     " exe "resize" . (min([vmax, 60]))
"     let hmax = max([winwidth(0), float2nr(&columns*0.66), 80])
"     let vmax = max([winheight(0), float2nr(&lines*0.66), 25])
"     exe "vertical resize" . (min([hmax, 110]))
"     exe "resize" . (min([vmax, 60]))
" endfunction

nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,f :FZF<cr>
nnoremap ,l :Unite locate -start-insert<cr>
" open terminal with current path
nnoremap <silent> gt :<c-u>call system("i3-msg layout stacked; urxvt -cd " . expand("%:p:h") . "&")<cr>

" restore cursor position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set cursorline
" remove warnings
set shortmess+=A

nnoremap <up> g;
nnoremap <down> g,
nnoremap <left> <c-o>
nnoremap <right> <c-i>

" damn put copy in clipboard
nnoremap yy "+yy
vnoremap y "+y

command! -nargs=1 Silent execute ':silent !'.<q-args> | execute ':redraw!'
" print output of command in another shell identified with who or w
" Silent python2 % >& /dev/pts/2

" rerun always
" find . -name "ho" | peat -0 "python2 ho"

" how to run in context ipython with /dev/pts

" from vimrcfu.com

" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

function! Reg()
    reg
    echo "Register: "
    let char = nr2char(getchar())
    if char != "\<Esc>"
        execute "normal! \"".char."p"
    endif
    redraw
endfunction
command! -nargs=0 Reg call Reg()

" insert word of the line above
inoremap <C-Y> <C-C>:let @z = @"<CR>mz
			\:exec 'normal!' (col('.')==1 && col('$')==1 ? 'k' : 'kl')<CR>
			\:exec (col('.')==col('$') - 1 ? 'let @" = @_' : 'normal! yw')<CR>
			\`zp:let @" = @z<CR>a


" diff unsaved changes on current line
function! DiffUnsaved()
    w !diff % -
endfunction
command! -nargs=0 DiffUnsaved call DiffUnsaved()

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

" fancy grep
function! SFancyGrep(kwd)
    if len(a:kwd) == 0
        let s:kwd = input('Pattern: ')
    else
        let s:kwd = a:kwd
    endif
    exec "vimgrep /".s:kwd."/ %"
    exec "copen"
endfunction 
nnoremap <leader>fg :call SFancyGrep("")<cr>
nnoremap <leader>fz viwy:call SFancyGrep("<c-r>0")<cr>
vnoremap <leader>fg y:call SFancyGrep("<c-r>0")<cr>

" visual star
function! VisualStarSearchSet(cmdtype,...)
  let temp = @"
  normal! gvy
  if !a:0 || a:1 != 'raw'
    let @" = escape(@", a:cmdtype.'\*')
  endif
  let @/ = substitute(@", '\n', '\\n', 'g')
  let @/ = substitute(@/, '\[', '\\[', 'g')
  let @/ = substitute(@/, '\~', '\\~', 'g')
  let @" = temp
endfunction

" replace vim's built-in visual * and # behavior
xnoremap * :<C-u>call VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

" recursively vimgrep for word under cursor or selection
if maparg('<leader>*', 'n') == ''
  nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
endif
if maparg('<leader>*', 'v') == ''
  vnoremap <leader>* :<C-u>call VisualStarSearchSet('/')<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
endif

" load my bundles
" NeoBundle 'ujihisa/unite-locate'

