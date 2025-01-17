if !has("autocmd")
  finish
endif

filetype plugin indent on

au BufRead *.txt  setlocal tw=78 spell spelllang=en_us
au BufRead *.rdoc setlocal tw=78 spell spelllang=en_us

au BufRead *.vim  setlocal syntax=vim filetype=vim

au BufRead diff,patch,*.diff,*.patch setlocal nospell filetype=diff
au BufRead *.rake,*.rf,*.ffi         setlocal filetype=ruby

au FileType objc   setlocal tw=78 ts=4 sts=4 sw=4 et
au FileType python setlocal tw=78 ts=4 sts=4 sw=4 et
au FileType perl   setlocal tw=78 ts=4 sts=4 sw=4 et
au FileType sh     setlocal tw=78 ts=4 sts=4 sw=4 et   nosi

au FileType c   setlocal tw=78 ts=8 sts=4 sw=4 noet
au FileType cpp setlocal tw=78 ts=8 sts=4 sw=4 noet

au FileType groovy setlocal tw=78 ts=2 sts=2 sw=2 et

au FileType css    setlocal tw=78 ts=2 sts=2 sw=2 et   nosi
au FileType ruby   setlocal tw=78 ts=2 sts=2 sw=2 et   nosi
au FileType vim    setlocal tw=78 ts=2 sts=2 sw=2 et   nosi
au FileType xml    setlocal tw=78 ts=2 sts=2 sw=2 et   nosi
au FileType zsh    setlocal tw=78 ts=2 sts=2 sw=2 et   nosi

au FileType eruby setlocal ts=2 sts=2 sw=2 et   nosi noai nofen
au FileType yaml  setlocal ts=2 sts=2 sw=2 et   nosi noai nofen

au FileType json       setlocal tw=78 ts=2 sts=2 sw=2 et
au FileType javascript setlocal tw=78 ts=2 sts=2 sw=2 et

"au BufRead,BufNew,BufEnter * call s:setup_ruby_trunk()
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown

au FileType rust   setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi

au BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

augroup cprog
  au!
  au FileType *      setlocal formatoptions=tcql nocindent comments&
  au FileType c,cpp  setlocal formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

if has("nvim")
  au TermOpen * setlocal nonu nornu
endif

au FocusGained,BufEnter * :checktime

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
au BufReadPost *
   \ if line("'\"") > 0 && line("'\"") <= line("$") |
   \   exe "normal g`\"" |
   \ endif

