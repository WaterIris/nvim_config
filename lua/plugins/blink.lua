return {
  "saghen/blink.cmp",
  dependencies = {
    "rafamadriz/friendly-snippets", -- optional snippet source
  },

  config = function()
  require("blink.cmp").setup({
    keymap = { preset = "enter" }, -- use 'super-tab' or 'enter' if preferred
    appearance = {
      nerd_font_variant = "normal", -- or "normal" for non-mono nerd fonts
    },
    completion = {
      documentation = {
        auto_show = false, -- manually open docs (e.g., with <C-space>)
      },
      ghost_text = {
        enabled = true;
        show_with_menu = true,
      },
    },

    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },

    -- fuzzy = {
      -- implementation = "prefer_rust_with_warning", -- try Rust, fallback to Lua
    -- },
  })
  end,
  opts_extend = { "sources.default" }, -- merge with future options if extended
}

