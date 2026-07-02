local function footer()
  local quotes = {
    "Talk is cheap. Show me the code. - Linus Torvalds",
    "Programs must be written for people to read, and only incidentally for machines to execute. - Harold Abelson",
    "Any fool can write code that a computer can understand. Good programmers write code that humans can understand. - Martin Fowler",
    "First, solve the problem. Then, write the code. - John Johnson",
    "Experience is the name everyone gives to their mistakes. - Oscar Wilde",
    "Before software can be reusable it first has to be usable. - Ralph Johnson",
    "Make it work, make it right, make it fast. - Kent Beck",
  }
  math.randomseed(os.time())
  local quote = quotes[math.random(#quotes)]
  return quote
end

return {
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      
      -- Gruvbox colored Neovim logo
      local logo = {
        [[                                  __]],
        [[     ___     ___    ___   __  __ /\_\    ___ ___]],
        [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\]],
        [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \]],
        [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      dashboard.section.header.val = logo
      -- You can use Gruvbox colors like GruvboxYellow, GruvboxGreen, etc. 
      -- Since gruvbox.nvim maps standard highlight groups, 'String' is a nice yellowish/greenish in Gruvbox.
      -- Or we use custom highlight
      dashboard.section.header.opts.hl = "String"

      -- Quick menu actions
      dashboard.section.buttons.val = {
        dashboard.button("f", "  Find file",       "<cmd>Telescope find_files<CR>"),
        dashboard.button("r", "  Recent files",    "<cmd>Telescope oldfiles<CR>"),
        dashboard.button("n", "  New file",        "<cmd>enew<CR>"),
        dashboard.button("c", "  Config",          "<cmd>cd ~/.config/nvim | Telescope find_files<CR>"),
        dashboard.button("q", "  Quit",            "<cmd>qa<CR>"),
      }
      
      -- Add a quote at the footer

      dashboard.section.footer.val = footer()
      dashboard.section.footer.opts.hl = "Comment"

      dashboard.opts.layout[1].val = 8
      
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end
      
      require("alpha").setup(dashboard.opts)
      
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = footer() .. "\n\n" .. "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
