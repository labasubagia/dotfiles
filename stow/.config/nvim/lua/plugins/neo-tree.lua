return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    {
      "s1n7ax/nvim-window-picker",
      version = "2.*",
      opts = {
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
      },
    },
  },
  opts = {
    close_if_last_window = true,
    filesystem = {
      hijack_netrw_behavior = "open_default",
      filtered_items = {
        --visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
        never_show = { ".git" },
      },
      follow_current_file = {
        enabled = true,
      },
    },
    buffers = {
      follow_current_file = {
        enabled = true,
      },
    },
  },
  init = function()
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal toggle<CR>", {})
    vim.keymap.set("n", "<C-S-n>", ":Neotree focus<CR>", {})
    -- vim.keymap.set("n", "<C-S-n>", ":Neotree close<CR>", {})

    -- fake that netrw already loaded
    vim.g.loaded_netrwPlugin = 1
    vim.g.loaded_netrw = 1
  end,
}
