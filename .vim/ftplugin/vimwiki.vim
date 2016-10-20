augroup vimwiki
    au! BufReadPre,BufNewFile,BufEnter ~/vimwiki/*.wiki !pushd ~/vimwiki; git pull; popd
    au! BufWritePost ~/vimwiki/*.wiki !pushd ~/vimwiki; git add %:p;git commit -m "Auto commit + push.";git push
augroup END
