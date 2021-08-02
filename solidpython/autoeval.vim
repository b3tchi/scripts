" BEGIN start code hook by :source autoeval.vim
" changed python
" run python script
" launch openscad with openscad out_file.scad
" reload openscad
" FINALLY convert .scad to .amf by openscad -o probeholder.amf out_file.scad

autocmd! BufWritePost *.py

autocmd BufWritePost *.py :call s:RunInner(eval('@%'))

function! s:RunInner(data) abort
  " !bash bashin.sh data.yaml > bashout.vim
  " execute '!python3 '.a:data.''
  execute '!python3 model.py'

endfunction

function! s:RunStart() abort
  " let l:data = substitute(a:data, "py", "scad", "")
  execute 'AsyncRun openscad model.scad'

endfunction

call s:RunStart()
