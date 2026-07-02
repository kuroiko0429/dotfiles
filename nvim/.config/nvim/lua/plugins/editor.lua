return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    keys = {
      { "<leader>,", "<cmd>Telescope buffers sort_mru=true sort_directories=true<cr>", desc = "Switch Buffer" },
      { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
      { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files (root dir)" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
      { "<leader>sg", "<cmd>Telescope live_grep<cr>", desc = "Grep (root dir)" },
      { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
      { "<leader>sw", "<cmd>Telescope grep_string<cr>", desc = "Word (root dir)" },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<C-j>"] = function(...)
              return require("telescope.actions").move_selection_next(...)
            end,
            ["<C-k>"] = function(...)
              return require("telescope.actions").move_selection_previous(...)
            end,
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "MunifTanjim/nui.nvim",
    },
    keys = {
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (root dir)",
      },
      { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "Explorer NeoTree" },
      { "<C-n>", "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer NeoTree" },
    },
    opts = {
      close_if_last_window = true,
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        filtered_items = {
          visible = true, -- 隠しファイルを表示
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        mappings = {
          ["<space>"] = "none",
          ["l"] = "open",
          ["h"] = "close_node",
        },
      },
    },
  },
  {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      plugins = { spelling = true },
    },
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {},
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>",  desc = "Navigate left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>",  desc = "Navigate down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>",    desc = "Navigate up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate right" },
    },
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      { "<leader>ha", function() require("harpoon"):list():add() end,                                                   desc = "Harpoon add file" },
      { "<leader>hh", function() local h = require("harpoon"); h.ui:toggle_quick_menu(h:list()) end,                   desc = "Harpoon menu" },
      { "<leader>1",  function() require("harpoon"):list():select(1) end,                                               desc = "Harpoon file 1" },
      { "<leader>2",  function() require("harpoon"):list():select(2) end,                                               desc = "Harpoon file 2" },
      { "<leader>3",  function() require("harpoon"):list():select(3) end,                                               desc = "Harpoon file 3" },
      { "<leader>4",  function() require("harpoon"):list():select(4) end,                                               desc = "Harpoon file 4" },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" }
    }
  },
  {
    "MagicDuck/grug-far.nvim",
    cmd = "GrugFar",
    keys = {
      { "<leader>sr", function() require("grug-far").open({ transient = true }) end,                                    desc = "Search and replace" },
      { "<leader>sw", function() require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } }) end,   desc = "Search current word" },
    },
    opts = {},
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
    keys = {
      { "<leader>gd", "<cmd>DiffviewOpen<cr>", desc = "DiffView Open" },
      { "<leader>gD", "<cmd>DiffviewClose<cr>", desc = "DiffView Close" },
    },
  },
  {
    "epwalsh/obsidian.nvim",
    version = "*",  -- 最新の安定版を使う設定
    lazy = true,
    ft = "markdown", -- Markdownファイルを開いた時だけプラグインを起動（起動速度UP！）
    
    -- 依存関係（このプラグインを動かすのに必要な他のプラグイン）
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp", -- 自動補完用（ノートのリンクとかをサクサク入力できる）
      "nvim-telescope/telescope.nvim", -- 検索用（Telescopeを使っている場合）
    },

    -- ここがさっきエラーになっていたメインの設定部分！
    opts = {
      -- ワークスペース（Obsidianのノートを保存しているフォルダ）の設定
      workspaces = {
        {
          name = "main-vault",
          -- 自分のObsidianフォルダの実際のパスに書き換えてね！
          -- 例: "~/Documents/Obsidian" や "~/vaults/personal" など
          path = "~/Documents/Obsidian-sync-vault/",
        },
      },

      -- 日報（Daily notes）の設定
      daily_notes = {
        folder = "dailie", -- 日報を保存するサブフォルダ名
        date_format = "%Y-%m-%d", -- ファイル名の形式（例: 2026-04-21.md）
      },

      -- ノートの自動補完を有効にする
      completion = {
        nvim_cmp = true,
        min_chars = 2,
      },

      -- 便利なショートカットキー設定
      mappings = {
        -- "gf" (Go to Fileの略) を押すと、カーソル下のリンク先のノートにジャンプする
        ["gf"] = {
          action = function()
            return require("obsidian").util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
        -- "<leader>ch" でチェックボックス( [ ] と [x] )をパチパチ切り替える
        ["<leader>ch"] = {
          action = function()
            return require("obsidian").util.toggle_checkbox()
          end,
          opts = { buffer = true },
        },
      },
    },
    keys = {
      { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "New Obsidian Note" },
      { "<leader>os", "<cmd>ObsidianSearch<CR>", desc = "Search Obsidian" },
      { "<leader>oq", "<cmd>ObsidianQuickSwitch<CR>", desc = "Quick Switch Obsidian" },
      { "<leader>ob", "<cmd>ObsidianBacklinks<CR>", desc = "Obsidian Backlinks" },
      { "<leader>od", "<cmd>ObsidianToday<CR>", desc = "Obsidian Today (Daily)" },
    },
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {},
    keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
  },
  {
    "stevearc/aerial.nvim",
    dependencies = {
       "nvim-treesitter/nvim-treesitter",
       "nvim-tree/nvim-web-devicons"
    },
    opts = {},
    keys = {
      { "<leader>a", "<cmd>AerialToggle!<CR>", desc = "Toggle Aerial (Outline)" }
    },
  },
}
