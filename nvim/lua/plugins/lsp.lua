return {
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "saadparwaiz1/cmp_luasnip",
  "onsails/lspkind.nvim",

  {
    "williamboman/mason.nvim",
    opts = { }
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end
      }
    }
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets"
    }
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } }
      }
    }
  }
}
