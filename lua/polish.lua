-- This will run last in the setup process.
-- This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Source shared vimrc
vim.cmd "source ~/.vimrc"

-- Detect terminal capabilities
local colorterm = vim.env.COLORTERM or ""
local has_truecolor = colorterm == "truecolor" or colorterm == "24bit"

-- Disable true color in terminals that don't support it (e.g., Coder browser terminal)
if not has_truecolor then
  vim.opt.termguicolors = false
end
