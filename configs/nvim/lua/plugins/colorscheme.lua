return {
  --  {
  --    "sainnhe/sonokai",
  --    priority = 1000,
  --    config = function()
  --     vim.g.sonokai_transparent_background = "1" --     vim.g.sonokai_enable_italic = "1"
  --     vim.g.sonokai_style = "andromeda"
  --     vim.cmd.colorscheme("sonokai")
  --    end,
  --  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "deep", -- You can choose 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light'
        transparent = true, -- Enable transparency
        term_colors = true, -- Adjust terminal colors if needed
        ending_tildes = false, -- Show end-of-buffer tildes. By default they are hidden
        toggle_style_key = nil, -- None by default, can be a string like <leader>ts to toggle styles
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between
        -- Add any additional settings here
      })
      require("onedark").load()
    end,
  },
}
