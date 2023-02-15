return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢄⢄⢄⢄⢄⢄⢄⢄⢄⢄⢄⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢔⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠠⡠⡠⡠⡠⠀⠀⠀⠀⠀⠀⢀⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⠕⠡⡠⡠⡠⡠⡠⡠⡠⡠⠀
⠀⠀⠀⠀⠀⠈⠪⡪⡪⠀⠀⠀⠀⢀⢔⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢔⢕⢌⠪⡪⡪⡪⡪⡪⡪⠀
⠀⠀⠀⠀⠀⠀⠀⠈⠪⡀⠀⢀⢐⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢌⠪⡪⡪⡪⡪⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠢⡢⡑⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢌⠪⡪⡪⠀
⠀⠀⢐⢔⠔⢔⢔⢔⢔⢄⢕⢌⠪⡢⡑⠕⠁⠁⠁⠁⠁⡡⡑⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⢕⠕⠈⠀⠀
⠀⠀⢐⢕⠅⠀⠑⢕⢕⢕⢕⢕⢕⠌⠊⠀⠀⠀⠀⡠⡪⡪⡪⡢⡑⢕⢕⢕⢕⢕⢕⢕⢕⢕⠕⠁⠀⠀⠀⠀
⠀⠀⢐⢕⠅⠀⠀⠀⠑⢕⢕⠕⠁⠀⠀⠀⠀⠠⡨⡪⡪⡪⡪⡪⡪⡢⡀⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠐⠑⢡⢠⢠⢠⢠⢠⢁⠀⠀⠀⠀⠀⡌⠊⠊⠊⠊⠊⡪⡪⡪⡪⡪⡪⡪⡠⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢐⢕⢕⢕⢕⢕⢕⢕⢄⠀⠀⠀⡪⡢⡀⠀⠀⠀⡪⡪⡪⡪⠊⠀⡪⡪⡪⡢⡀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢐⢕⢕⢕⢕⢕⢕⢕⢕⢕⢄⠀⡪⡪⡪⡢⡀⠀⡪⡪⠊⠀⠀⠀⡪⡪⡪⡪⡪⡢⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠐⠑⠑⠑⠑⠑⠑⠑⠑⠑⠑⠑⠈⠊⠊⠊⠊⠂⡪⡠⡠⡠⡠⡠⠊⠊⠊⠊⠊⠊⠊⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠀⠀⡪⡪⡪⡪⡪⡪⡘⢜⢜⢜⢜⠄⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡪⡢⡀⠀⠀⠀⡪⡪⡪⡪⡪⡪⡪⡢⡑⢕⢕⠅⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡪⡪⡪⡢⡀⠀⡪⡪⠪⡪⡪⡪⡪⡪⡪⡢⡑⡅⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡪⡪⡪⡪⡪⡢⠊⠀⠈⠨⡪⡪⡪⡪⡪⡪⡪⡂⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡪⡪⡪⡪⡪⡪⠀⠀⠀⠀⠈⠪⡪⡪⡪⡪⡪⡂⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠪⡪⡪⡪⡂⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠪⡪⡂⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠂⠀⠀⠀⠀⠀⠀
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("  n  ", " " .. " New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("  e  ", " " .. " Find file", ":Telescope find_files <CR>"),
      dashboard.button("  r  ", " " .. " Recent files", ":Telescope oldfiles <CR>"),
      dashboard.button("  v  ", " " .. " Quit", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "SpecialComment"
      button.opts.hl_shortcut = "lualine_b_visual"
    end
    dashboard.section.footer.opts.hl = "Error"
    dashboard.section.header.opts.hl = "Error"
    dashboard.section.buttons.opts.hl = "markdownH2"
    dashboard.opts.layout[1].val = 2
    return dashboard
  end,
  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        dashboard.section.footer.val = "マギシステムは" .. ms .. "msで完了"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
