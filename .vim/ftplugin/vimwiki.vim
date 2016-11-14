augroup vimwiki
    au! BufReadPre,BufNewFile,BufEnter ~/vimwiki/* execute "!pushd ~/vimwiki; git pull; popd 2>&1 /dev/null" | redraw!
    au! BufWritePost ~/vimwiki/* execute "!pushd ~/vimwiki; git add .;git commit -m \"Auto commit + push.\";git push; popd 2>&1 /dev/null" | redraw!
augroup END
