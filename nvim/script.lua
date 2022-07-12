require'nvim-tree'.setup {
  update_focused_file = {
    enable      = true,
  },
  renderer = {
    group_empty = true,
    indent_markers = {
	    enable = true,
    },
  },
  filters = {
    dotfiles = true,
  }
}

require 'colorizer'.setup()

require'nvim-web-devicons'.setup {
 -- your personnal icons can go here (to override)
 -- you can specify color or cterm_color instead of specifying both of them
 -- DevIcon will be appended to `name`
 override = {
  zsh = {
    icon = "",
    color = "#428850",
    cterm_color = "65",
    name = "Zsh"
  }
 };
 -- globally enable default icons (default to false)
 -- will get overriden by `get_icons` option
 default = true;
}
