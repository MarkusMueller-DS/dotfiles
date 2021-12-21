
local colorscheme = "tokyonight"

-- Toggle transparancy
vim.g.tokyonight_transparent = true
-- Style of colorscheme
vim.g.tokyonight_style = "night"

-- Error handling 
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
