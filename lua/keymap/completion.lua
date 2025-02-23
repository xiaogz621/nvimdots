local bind = require("keymap.bind")
local map_cr = bind.map_cr
local map_callback = bind.map_callback

local mappings = {
	fmt = {
		["n|<leader>sf"] = map_cr("FormatToggle"):with_noremap():with_silent():with_desc("formatter: Toggle format on save"),
		["n|<leader>sF"] = map_cr("Format"):with_noremap():with_silent():with_desc("formatter: Format buffer manually"),
	},
}
bind.nvim_load_mapping(mappings.fmt)

--- The following code allows this file to be exported ---
---    for use with LSP lazy-loaded keymap bindings    ---

local M = {}

---@param buf integer
function M.lsp(buf)
	local map = {
		-- LSP-related keymaps, ONLY effective in buffers with LSP(s) attached
		["n|<leader>li"] = map_cr("LspInfo"):with_silent():with_buffer(buf):with_desc("lsp: Info"),
		["n|<leader>lr"] = map_cr("LspRestart"):with_silent():with_buffer(buf):with_nowait():with_desc("lsp: Restart"),
		["n|<leader>ot"] = map_callback(function()
				require("edgy").toggle("right")
			end)
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Toggle outline"),
		["n|g["] = map_cr("Lspsaga diagnostic_jump_prev")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Prev diagnostic"),
		["n|g]"] = map_cr("Lspsaga diagnostic_jump_next")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Next diagnostic"),
		["n|<leader>lx"] = map_cr("Lspsaga show_line_diagnostics ++unfocus")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Line diagnostic"),
		["n|<leader>gs"] = map_callback(function()
			vim.lsp.buf.signature_help()
		end):with_desc("lsp: Signature help"),
		["n|<leader>gr"] = map_cr("Lspsaga rename"):with_silent():with_buffer(buf):with_desc("lsp: Rename in file range"),
		["n|<leader>gR"] = map_cr("Lspsaga rename ++project")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Rename in project range"),
		["n|K"] = map_cr("Lspsaga hover_doc"):with_silent():with_buffer(buf):with_desc("lsp: Show doc"),
		["nv|<leader>ga"] = map_cr("Lspsaga code_action")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Code action for cursor"),
		["n|<leader>gd"] = map_cr("Lspsaga goto_definition"):with_silent():with_buffer(buf):with_desc("lsp: Goto definition"),
		["n|<leader>gD"] = map_cr("Glance definitions"):with_silent():with_buffer(buf):with_desc("lsp: Preview definition"),
		["n|<leader>gh"] = map_cr("Glance references"):with_silent():with_buffer(buf):with_desc("lsp: Show reference"),
		["n|<leader>gm"] = map_cr("Glance implementations")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show implementation"),
		["n|<leader>gci"] = map_cr("Lspsaga incoming_calls")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show incoming calls"),
		["n|<leader>gco"] = map_cr("Lspsaga outgoing_calls")
			:with_silent()
			:with_buffer(buf)
			:with_desc("lsp: Show outgoing calls"),
	}
	bind.nvim_load_mapping(map)

	local ok, user_mappings = pcall(require, "user.keymap.completion")
	if ok and type(user_mappings.lsp) == "function" then
		require("modules.utils.keymap").replace(user_mappings.lsp(buf))
	end
end

return M
