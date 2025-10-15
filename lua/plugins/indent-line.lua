return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  config = function()
  require("ibl").setup({
    scope = {
      enabled = true,
      show_end = false,
      show_exact_scope = false,
      show_start = false,
    },
  })
  end,
  opts_extend = {}, -- extend config fields if needed in future
}
