return {
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		}
	},
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	dependencies = {
	-- 		"saadparwaiz1/cmp_luasnip",
	-- 		"rafamadriz/friendly-snippets",
	-- 	},
	-- 	config = function ()
	-- 		vim.keymap.set({ "i", "s" }, "<c-k>", function()
	-- 			return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
	-- 		end, { silent = true })
	--
	-- 		vim.keymap.set({ "i", "s" }, "<c-j>", function()
	-- 			return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
	-- 		end, { silent = true })
	-- 	end
	-- },
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")

			cmp.setup({
				snippet = {
				  -- REQUIRED - you must specify a snippet engine
				  expand = function(args)
					-- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
					require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
					-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
					-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					-- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
				  end,
				},
				window = {
				  -- completion = cmp.config.window.bordered(),
				  -- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
				  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
				  ['<C-f>'] = cmp.mapping.scroll_docs(4),
				  ['<C-Space>'] = cmp.mapping.complete(),
				  ['<C-e>'] = cmp.mapping.abort(),
				  ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
				  { name = 'nvim_lsp' },
				  -- { name = 'vsnip' }, -- For vsnip users.
				  { name = 'luasnip' }, -- For luasnip users.
				  -- { name = 'ultisnips' }, -- For ultisnips users.
				  -- { name = 'snippy' }, -- For snippy users.
				}, {
				  { name = 'buffer' },
				})
			  })
		end,
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				panel = {
					enabled = true,
					auto_refresh = false,
					keymap = {
						jump_prev = "[[",
						jump_next = "]]",
						accept = "<CR>",
						refresh = "gr",
						open = "<M-CR>"
					},
					layout = {
						position = "bottom", -- | top | left | right | horizontal | vertical
						ratio = 0.4
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					hide_during_completion = true,
					debounce = 75,
					trigger_on_accept = true,
					keymap = {
						accept = "<C-K>",
						accept_word = false,
						accept_line = "<C-L>",
						next = "<C-c>",
						prev = "<C-C>",
						dismiss = "<C-_>",
					},
				},
			})
		end,
	},
}
