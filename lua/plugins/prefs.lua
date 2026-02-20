-- Custom preferences

---@type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = { follow = true },
          grep = { follow = true },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["<C-s>"] = { "<Cmd>w<CR>", desc = "Save file" },
          ["<D-s>"] = { "<Cmd>w<CR>", desc = "Save file" },
          ["<D-]>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<D-[>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
          ["<Leader>fw"] = { function() Snacks.picker.grep() end, desc = "Find words (grep)" },
        },
        i = {
          ["<C-s>"] = { "<Esc><Cmd>w<CR>", desc = "Save file" },
          ["<D-s>"] = { "<Esc><Cmd>w<CR>", desc = "Save file" },
          ["<D-]>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<D-[>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        },
      },
    },
  },
}
