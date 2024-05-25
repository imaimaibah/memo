# Shurt cuts

Spece is the <leader> key. `<leader>` to show the menu.

### Directory tree toggle

:NvimTreeToggle -> `<leader>e`

`f` to filter and `esc` to cancel

### Tabs (buffers)

`<leader>b` to show the menu.

`<leader>bn` to go to next tab

`<leader>bb` to go to previous tab

# Register

You can register yunked contents with `"`.

`"` followed by `a charactor` followed by `y` records the highlited content to the charactor.

For example,

Highlight a content you want to copy with `v`, and then `"ay` to record the highlighted content to `a`. 

You can list registered strings by `:reg`.

Instead of `y<yunk>`, type `p<paste>` will paste the registered content.

In insert mode, Ctrl+r and a charatcor to paste the registered content.

# Disable LSP temporarily

```
:LspStop
```

To start again

```
:LspStart
```

# Delete inside of quotation

`di"` will delete a content in double quotation.

For example,

Bring your cursol in `"test test"` and press `di"`, it will remove the content quoted with `"`
