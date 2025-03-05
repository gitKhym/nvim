return {
  { "rcarriga/nvim-notify", opts = { background_colour = "#000000" } },
  { "dhruvasagar/vim-table-mode", event = "VeryLazy" },
  { "nvim-treesitter/playground", event = "VeryLazy" },
  { "mbbill/undotree", event = "VeryLazy" },
  { "f3fora/cmp-spell", event = "VeryLazy" },
  {
    "MunsMan/kitty-navigator.nvim",
    event = "VeryLazy",
    opts = { keybindings = {} },
  },

  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end,
  },
  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      defaults = {
        file_ignore_patterns = {
          "%.class",
        },
        path_display = {
          "filename_first",
        },
      },
    },
  },
  {
    "giusgad/pets.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "giusgad/hologram.nvim" },
    event = "VeryLazy",
    config = function()
      require("pets").setup {
        row = 5, -- the row (height) to display the pet at (higher row means the pet is lower on the screen), must be 1<=row<=10
        col = 10, -- the column to display the pet at (set to high number to have it stay still on the right side)
        speed_multiplier = 1, -- you can make your pet move faster/slower. If slower the animation will have lower fps.
        default_pet = "cockatiel", -- the pet to use for the PetNew command
        default_style = "gray", -- the style of the pet to use for the PetNew command
        random = true, -- whether to use a random pet for the PetNew command, overrides default_pet and default_style
        death_animation = true, -- animate the pet's death, set to false to feel less guilt -- currently no animations are available
        popup = { -- popup options, try changing these if you see a rectangle around the pets
          width = "45%", -- can be a string with percentage like "45%" or a number of columns like 45
          winblend = 100, -- winblend value - see :h 'winblend' - only used if avoid_statusline is false
          hl = { Normal = "Normal" }, -- hl is only set if avoid_statusline is true, you can put any hl group instead of "Normal"
          avoid_statusline = true, -- if winblend is 100 then the popup is invisible and covers the statusline, if that
          -- doesn't work for you then set this to true and the popup will use hl and will be spawned above the statusline (hopefully)
        },
      }
    end,
  },
  {
    "kawre/leetcode.nvim",

    event = "VeryLazy",
    build = ":TSUpdate html",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim", -- required by telescope
      "MunifTanjim/nui.nvim",

      -- optional
      "nvim-treesitter/nvim-treesitter",
      "rcarriga/nvim-notify",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {
      lang = "python3",
      image_support = false,
      plugins = {
        non_standalone = true,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
  },
  -- SMOOTH
  -- Smooth Cursor
  -- {
  --   "sphamba/smear-cursor.nvim",
  --   opts = {},
  --   event = "VeryLazy",
  -- },
  {
    "karb94/neoscroll.nvim",
    config = function()
      require "configs.neoscroll"
    end,
    event = "VeryLazy",
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      exclude = {
        filetypes = {
          "java",
          "rust",
          "markdown",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "lua",
        },
      },
    },
  },
  {
    "numToStr/FTerm.nvim",
    config = function()
      require "configs.FTerm"
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      require "configs.noice"
    end,
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
    "laytan/tailwind-sorter.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    build = "cd formatter && npm ci && npm run build",
    config = {
      on_save_enabled = true,
    },
  },
  {
    "ThePrimeagen/harpoon",
    config = function()
      require "configs.harpoon"
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      {
        "<leader>;",
        ":LazyGit<return>",
        silent = true,
        noremap = true,
      },
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        keymaps = {
          visual = "s",
        },
      }
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "rust-analyzer",
        "prettierd",
        "eslint-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "css-lsp",
        "html-lsp",
        "terraform-ls",
        "prismals",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "VeryLazy", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require "configs.tiny-inline-diagnostics"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "python",
        "lua",
        "html",
        "css",
        "json",
        "typescript",
        "javascript",
        "tsx",
        "markdown",
        "commonlisp",
        "terraform",
        "prisma",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-refactor",
    opts = function()
      require("nvim-treesitter.configs").setup {
        refactor = {
          navigation = {
            enable = true,
            -- Assign keymaps to false to disable them, e.g. `goto_definition = false`.
            keymaps = {
              goto_definition = false,
              list_definitions = "gnd",
              list_definitions_toc = "gO",
              goto_next_usage = "<a-*>",
              goto_previous_usage = "<a-#>",
            },
          },
        },
      }
    end,
  },
  {
    "smjonas/inc-rename.nvim",
    event = "VeryLazy",
    config = function()
      require("inc_rename").setup()
    end,
  },
}
