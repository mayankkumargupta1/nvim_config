---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.recipes.disable-tabline" },
  {
    "tomiis4/BufferTabs.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- optional
    },
    lazy = false,
    config = function()
      local buffertabs = require "buffertabs"
      buffertabs.setup {
        -- your config here
      }

      -- Toggle BufferTabs with `t`
      vim.keymap.set("n", "t", function() buffertabs.toggle() end, { desc = "Toggle BufferTabs" })
    end,
  },
  {
    "sphamba/smear-cursor.nvim",
    opts = {},
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup {
        variant = "dark",
        transparent = true,
        colors = {
          -- make text lighter
          fg = "#eeeeee", -- very light gray
          dark = {
            fg = "#ffffff", -- pure white for dark variant
          },
        },
      }
      vim.cmd.colorscheme "cyberdream"
    end,
  },
  "wuelnerdotexe/vim-astro",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require "nvim-treesitter.configs"

      configs.setup {
        ensure_installed = {
          "astro",
          "html",
          "css",
          "typescript",
          "tsx",
          "javascript",
        },
        highlight = { enable = true },
      }

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.astro = {
        install_info = {
          url = "https://github.com/virchau13/tree-sitter-astro",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "main",
        },
        filetype = "astro",
      }
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^6", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
