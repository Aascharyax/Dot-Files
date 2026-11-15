
return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers = opts.servers or {}
      opts.servers.clangd = opts.servers.clangd or {}

      opts.servers.clangd.init_options = vim.tbl_deep_extend(
        "force",
        opts.servers.clangd.init_options or {},
        {
          usePlaceholders = true,
          completeUnimported = true,
          clangdFileStatus = true,
        }
      )

      -- Compact inline diagnostics
      vim.diagnostic.config({
        virtual_text = {
          spacing = 2,
          source = "if_many",
        },
        signs = true,
        underline = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "if_many",
        },
      })

      -- Function signature help for C/C++
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(event)
          local client =
            vim.lsp.get_client_by_id(event.data.client_id)

          if client and client.name == "clangd" then
            vim.keymap.set(
              "i",
              "<M-k>",
              vim.lsp.buf.signature_help,
              {
                buffer = event.buf,
                desc = "C/C++ Function Signature",
              }
            )
          end
        end,
      })
    end,
  },
}
