local options = {
  workspaces = {
    {
      name = "Map",
      path = "~/obsidian-vault/(00) Map",
    },
    {
      name = "RMIT",
      path = "~/obsidian-vault/(01) RMIT",
    },
  },
}

require("obsidian").setup(options)
