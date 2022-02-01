# nvim-treesitter issue #2360

https://github.com/nvim-treesitter/nvim-treesitter/issues/2360

To reproduce:

```
docker build -t nvim-treesitter-2360 .
docker run --rm -it nvim-treesitter-2360
```

First bad commit in neovim (found with bisect):

https://github.com/neovim/neovim/commit/45f7fc9b0607cde787dc8b70b6842aa2b4b56c31
