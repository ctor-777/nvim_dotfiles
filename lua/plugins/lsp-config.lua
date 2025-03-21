return {
	{
		"williamboman/mason.nvim",
		lazy = false,
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()

			local lspconfig = require("lspconfig")
			lspconfig.ts_ls.setup({
				capabilities = capabilities
			})
			lspconfig.solargraph.setup({
				capabilities = capabilities
			})
			lspconfig.html.setup({
				capabilities = capabilities
			})
			lspconfig.lua_ls.setup({
				capabilities = capabilities
			})
			lspconfig.clangd.setup({
				capabilities = capabilities
			})
			lspconfig.jdtls.setup({
				capabilities = capabilities
			})
			-- lspconfig.sqls.setup({
			-- 	capabilities = capabilities
			-- })
			-- lspconfig.asm_lsp.setup({
			-- 	capabilities = capabilities
			-- })

		vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, {})
		vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
		vim.keymap.set("n", "<leader>gR", vim.lsp.buf.references, {})
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		vim.keymap.set("n", "<leader>gi", vim.lsp.buf.incoming_calls, {})
		vim.keymap.set("n", "<leader>gr", vim.lsp.buf.rename, {})

		end,
	},
	{
		"tamago324/nlsp-settings.nvim",
		lazy = false,
	}
	-- {
	-- 	"mfussenegger/nvim-jdtls",
	-- 	lazy = false,
	-- 	config = function()
	-- 		local config = {
	-- 			cmd = {vim.fn.stdpath('data') .. '/mason/bin/jdtls'},
	-- 			root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
	-- 		}
	-- 		require('jdtls').start_or_attach(config)
	-- 	end,
	--
	-- }
}
