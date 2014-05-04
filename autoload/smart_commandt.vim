if !exists(":CommandT")
  echoerr "Smart CommandT requires CommandT to be installed"
  finish
end

function! s:has_untracked_files()
  return str2nr(system("git ls-files --exclude-standard --others | wc -l")) > 0
endfunction

function! s:in_git_repo()
  return filereadable("./.git/HEAD")
endfunction

function! smart_commandt#invoke(...)
  if s:in_git_repo() && s:has_untracked_files()
    exec 'CommandTFlush'
  endif

  if exists("a:1")
    exec 'CommandT ./' . a:1
  else
    exec 'CommandT ./'
  endif
endfunction
