return {
  {
    {
      "mason.nvim",
      opts = {
        ensure_installed = {
          "biome",
        },
      },
    },
    {
      "neovim/nvim-lspconfig",
      opts = {
        servers = {
          biome = {},
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["javascript"] = { { "biome", "prettier" } },
        ["javascriptreact"] = { "biome", "prettier" },
        ["typescript"] = { "biome", "pretter" },
        ["typescriptreact"] = { "biome", "pretter" },
        ["vue"] = { "prettier" },
        ["css"] = { "prettier" },
        ["scss"] = { "prettier" },
        ["less"] = { "prettier" },
        ["html"] = { "prettier" },
        ["json"] = { "biome", "pretter" },
        ["jsonc"] = { "biome", "pretter" },
        ["yaml"] = { "prettier" },
        ["markdown"] = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        ["graphql"] = { "prettier" },
        ["handlebars"] = { "prettier" },
      },
      formatters = {
        prettier = {
          condition = function(ctx)
            return vim.fs.find({
              ".prettierrc",
              ".prettierrc.json",
              ".prettierrc.yml",
              ".prettierrc.yaml",
              ".prettierrc.json5",
              ".prettierrc.js",
              ".prettierrc.cjs",
              ".prettierrc.toml",
              "prettier.config.js",
              "prettier.config.cjs",
            }, { path = ctx.filename, upward = true })[1]
          end,
        },
        biome = {
          condition = function(ctx)
            return vim.fs.find({
              "biome.json",
            }, { path = ctx.filename, upward = true })[1]
          end,
        },
      },
    },
  },
}
