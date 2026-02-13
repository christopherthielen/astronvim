-- Custom preferences

-- Detect terminal capabilities
local colorterm = vim.env.COLORTERM or ""
local has_truecolor = colorterm == "truecolor" or colorterm == "24bit"

---@type LazySpec
return {
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
  -- Disable nerd font icons when true color is unavailable (e.g., Coder browser terminal)
  not has_truecolor and {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = { icons_enabled = false },
  } or nil,
}
