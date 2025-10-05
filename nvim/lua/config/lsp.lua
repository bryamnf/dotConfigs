vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local bufnr = args.buf
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		local opts = { buffer = bufnr, silent = true, noremap = true }
		local map = vim.keymap.set

		-- === CORE LSP ===
		map("n", "<leader>cl", "<cmd>LspInfo<cr>", opts)

		if client:supports_method("textDocument/definition") then
			map("n", "gd", vim.lsp.buf.definition, opts)
		end
		if client:supports_method("textDocument/references") then
			map("n", "gr", vim.lsp.buf.references, opts)
			map("n", "]]", vim.lsp.buf.references, opts) -- Next reference (could integrate with plugins like vim-illuminate)
			map("n", "[[", vim.lsp.buf.references, opts) -- Prev reference
			map("n", "<A-n>", vim.lsp.buf.references, opts)
			map("n", "<A-p>", vim.lsp.buf.references, opts)
		end
		if client:supports_method("textDocument/implementation") then
			map("n", "gI", vim.lsp.buf.implementation, opts)
		end
		if client:supports_method("textDocument/typeDefinition") then
			map("n", "gy", vim.lsp.buf.type_definition, opts)
		end
		if client:supports_method("textDocument/declaration") then
			map("n", "gD", vim.lsp.buf.declaration, opts)
		end
		if client:supports_method("textDocument/hover") then
			map("n", "K", vim.lsp.buf.hover, opts)
		end
		if client:supports_method("textDocument/signatureHelp") then
			map("n", "gK", vim.lsp.buf.signature_help, opts)
			map("i", "<C-k>", vim.lsp.buf.signature_help, opts)
		end

		-- === ACTIONS ===
		if client:supports_method("textDocument/codeAction") then
			map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			map({ "n", "v" }, "<leader>cc", vim.lsp.codelens.run, opts)
			map("n", "<leader>cC", vim.lsp.codelens.refresh, opts)
			map("n", "<leader>cA", function()
				vim.lsp.buf.code_action({
					context = { only = { "source" } },
					apply = true,
				})
			end, opts)
		end
		if client:supports_method("textDocument/rename") then
			map("n", "<leader>cr", vim.lsp.buf.rename, opts)
		end

		-- === FILE RENAME (requires support, may need extra plugin integration) ===
		map("n", "<leader>cR", function()
			local old_name = vim.api.nvim_buf_get_name(0)
			vim.ui.input({ prompt = "New File Name: ", default = old_name }, function(new_name)
				if not new_name or new_name == "" then return end
				os.rename(old_name, new_name)
				vim.cmd("edit " .. new_name)
				vim.lsp.util.rename(old_name, new_name) -- some servers may react
			end)
		end, opts)

		-- === COMPLETION ===
		--	if client:supports_method("textDocument/completion") then
		--		vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
		--	end

		-- === AUTO-FORMAT ON SAVE ===
		if not client:supports_method("textDocument/willSaveWaitUntil")
		    and client:supports_method("textDocument/formatting") then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("my.lsp.format", { clear = false }),
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr, id = client.id, timeout_ms = 1000 })
				end,
			})
		end
	end,
})
