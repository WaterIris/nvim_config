return {
  "utilyre/barbecue.nvim",
  version = "*", -- use latest version (can pin later if needed)

  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },

  config = function()
    require("barbecue").setup({
      theme = 'auto',
    })
  end,

  opts_extend = {}, -- extend config fields if needed in future
}

