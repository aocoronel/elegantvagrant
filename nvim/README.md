# Neovim

This theme doesn't work by itself. It's mainly a override for the [Catpuccin](https://github.com/catppuccin/nvim) theme.

You can use it by installing Catppuccin and applying the custom_highlights and color_overrides. An example using lazy.nvim follows:

```lua
return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
        custom_highlights = elegantvagrant_highlights,
        color_overrides = {
            mocha = elegantvagrant,
        }
    end
}
```
