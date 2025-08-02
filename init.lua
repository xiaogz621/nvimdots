vim.cmd([[
  source ~/.vimrc
]])

if not vim.g.vscode then
	require("core")
end

-- 简约版状态栏 (Lua)
--vim.opt.statusline = "%f"  -- 只显示文件名
vim.opt.laststatus = 2     -- 总是显示状态栏
