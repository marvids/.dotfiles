augroup vimwiki
    au! BufReadPre,BufNewFile,BufEnter ~/vimwiki/* !pushd ~/vimwiki; git pull; popd
    au! BufWritePost ~/vimwiki/* !pushd ~/vimwiki; git add %:p;git commit -m "Auto commit + push.";git push
augroup END
