return {
  {
    "3rd/image.nvim",
    rocks = { "magick" },
    opts = {
      backend = "kitty",
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true,
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  },
  {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    build = ":UpdateRemotePlugins",
    dependencies = { "3rd/image.nvim" },
    lazy = false,
    init = function()
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      vim.g.molten_auto_open_output = false
      vim.g.molten_virt_text_output = true
    end,
    keys = {
      { "<leader>ji", ":MoltenInit<CR>",                        desc = "Init kernel" },
      { "<leader>jl", ":MoltenEvaluateLine<CR>",                desc = "Evaluate line" },
      { "<leader>jr", ":MoltenReevaluateCell<CR>",              desc = "Re-evaluate cell" },
      { "<leader>jd", ":MoltenDelete<CR>",                      desc = "Delete cell" },
      { "<leader>jo", ":MoltenShowOutput<CR>",                  desc = "Show output" },
      { "<leader>jh", ":MoltenHideOutput<CR>",                  desc = "Hide output" },
      { "<leader>je", ":MoltenEvaluateOperator<CR>",            desc = "Evaluate operator" },
      { "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv",       mode = "v", desc = "Evaluate visual" },
    },
  },
}
