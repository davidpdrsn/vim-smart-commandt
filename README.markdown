vim-smart-commandt
==================

This is a plugin that I have wanted to for a long time. The issue is:

I wanna use CommandT to navigate to files, I want CommandT to always be up to date with newly created files, but I don't wanna flush the cache every time I invoke it.

The solution I came up with was to write a small wrapper function that checks if you are currently in a git repo, if you are and there are untracked files then it clears the cache before invoking CommandT. Otherwise it will just invoke it without clearing the cache. I find that this gives you the best of both worlds. Oh yeah and if you're not in a git repo, it clears the cache every time.

Usage
-----

Here is a sample config. It should be quite self explanatory:

```vim
map <leader>f :call smart_commandt#invoke()<cr>
```

You can also scope CommandT to a specific subfolder. So if you were a Rails developer you might wanna do this:

```vim
map <leader>fs :call smart_commandt#invoke("spec")<cr>
map <leader>fc :call smart_commandt#invoke("app/controllers")<cr>
map <leader>fv :call smart_commandt#invoke("app/views")<cr>
map <leader>fm :call smart_commandt#invoke("app/models")<cr>
map <leader>fa :call smart_commandt#invoke("app/assets")<cr>
map <leader>fl :call smart_commandt#invoke("lib")<cr>
```

Installation
------------

I recommend you install it with Vundle. Just add this to your vimrc.

```vim
Bundle 'davidpdrsn/vim-smart-commandt'
```

And run `:BundleInstall`.

Contributing
------------

If you find bugs or have some great ideas of how to improve this, please let me know.
