return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<C-a>"] = { "ggVG", desc = "Select entire file" },

          -- Disabled
          ["<leader>h"] = false,
        },
      },
    },
  },
}
