return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		misc = require("modules.utils.icons").get("misc"),
		git = require("modules.utils.icons").get("git", true),
		cmp = require("modules.utils.icons").get("cmp", true),
	}

	require("modules.utils").load_plugin("which-key", {
		preset = "classic",
		delay = vim.o.timeoutlen,
		triggers = {
			{ "<auto>", mode = "nixso" },
		},
		plugins = {
			marks = true,
			registers = true,
			spelling = {
				enabled = true,
				suggestions = 20,
			},
			presets = {
				motions = false,
				operators = false,
				text_objects = true,
				windows = true,
				nav = true,
				z = true,
				g = true,
			},
		},
		win = {
			border = "none",
			padding = { 1, 2 },
			wo = { winblend = 0 },
		},
		expand = 1,
		icons = {
			group = "",
			rules = false,
			colors = false,
			breadcrumb = icons.ui.Separator,
			separator = icons.misc.Vbar,
			keys = {
				C = "C-",
				M = "A-",
				S = "S-",
				BS = "<BS> ",
				CR = "<CR> ",
				NL = "<NL> ",
				Esc = "<Esc> ",
				Tab = "<Tab> ",
				Up = "<Up> ",
				Down = "<Down> ",
				Left = "<Left> ",
				Right = "<Right> ",
				Space = "<Space> ",
				ScrollWheelUp = "<ScrollWheelUp> ",
				ScrollWheelDown = "<ScrollWheelDown> ",
			},
		},
		spec = {
			{ "<leader>ag", group = icons.git.Git .. "Git" },
			{ "<leader>ad", group = icons.ui.Bug .. " Debug" },
			{ "<leader>as", group = icons.cmp.tmux .. "Session" },
			{ "<leader>ab", group = icons.ui.Buffer .. " Buffer" },
			{ "<leader>aS", group = icons.ui.Search .. " Search" },
			{ "<leader>aW", group = icons.ui.Window .. " Window" },
			{ "<leader>ap", group = icons.ui.Package .. " Package" },
			{ "<leader>al", group = icons.misc.LspAvailable .. " Lsp" },
			{ "<leader>af", group = icons.ui.Telescope .. " Fuzzy Find" },
			{ "<leader>an", group = icons.ui.FolderOpen .. " Nvim Tree" },
		},
	})
end
