-- stylua: ignore
-- defines cosmetic and theme based configurations and plugins

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, colors)
        hl.LineNr = {
          fg = "#7a7a7a",
        }
        hl.CursorLineNr = {
          fg = "white",
        }
      end,
    },
  },
  -- {
  --   "nvimdev/dashboard-nvim",
  --   opts = function(_, opts)
  --     local logo = {
  --       [[                                                                       ]],
  --       [[  ██████   █████                   █████   █████  ███                  ]],
  --       [[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
  --       [[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
  --       [[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
  --       [[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
  --       [[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
  --       [[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
  --       [[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
  --       [[                                                                       ]],
  --     }
  --
  --     table.insert(opts.config, { header = logo })
  --
  --     return opts;
  --   end
  -- }
  {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = {
      [[                                       ]],
      [[                                       ]],
      [[                                       ]],
      [[                   -`                  ]],
      [[                  .o+`                 ]],
      [[                 `ooo/                 ]],
      [[                `+oooo:                ]],
      [[               `+oooooo:               ]],
      [[               -+oooooo+:              ]],
      [[             `/:-:++oooo+:             ]],
      [[            `/++++/+++++++:            ]],
      [[           `/++++++++++++++:           ]],
      [[          `/+++ooooooooooooo/`         ]],
      [[         ./ooosssso++osssssso+`        ]],
      [[        .oossssso-````/ossssss+`       ]],
      [[       -osssssso.      :ssssssso.      ]],
      [[      :osssssss/        osssso+++.     ]],
      [[     /ossssssss/        +ssssooo/-     ]],
      [[   `/ossssso+/:-        -:/+osssso+-   ]],
      [[  `+sso+:-`                 `.-/+oso:  ]],
      [[ `++:.                           `-/+/ ]],
      [[ .`                                 `  ]],
      [[                                       ]],
      [[       The One True Text Editor        ]],
      [[                                       ]],
      [[                                       ]],
      [[                                       ]],
    }

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = logo,
        -- stylua: ignore
        center = {
          { action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
}
