return {
  require("kanagawa").setup({

    colors = {
      palette = {
        -- Bg Shades
        sumiInk0 = "#191A2A",
        sumiInk1 = "#303247",
        sumiInk2 = "#2F374C",
        sumiInk3 = "#0f101a",
        sumiInk4 = "#222438",
        sumiInk5 = "#23253A",
        sumiInk6 = "#868697", --fg
        -- Popup and Floats
        waveBlue1 = "#223249",
        waveBlue2 = "#2D4F67",

        -- Diff and Git
        winterGreen = "#2B3328",
        winterYellow = "#49443C",
        winterRed = "#43242B",
        winterBlue = "#252535",
        autumnGreen = "#76946A",
        autumnRed = "#C34043",
        autumnYellow = "#DCA561",

        -- Diag
        samuraiRed = "#E82424",
        roninYellow = "#FF9E3B",
        waveAqua1 = "#6A9589",
        dragonBlue = "#658594",

        -- Fg and Comments
        oldWhite = "#C8C093",
        fujiWhite = "#D9DEE6",
        fujiGray = "#565773",

        oniViolet = "#957FB8",
        oniViolet2 = "#b8b4d0",
        crystalBlue = "#7E9CD8",
        springViolet1 = "#938AA9",
        springViolet2 = "#9CABCA",
        springBlue = "#7FB4CA",
        lightBlue = "#A3D4D5", -- unused yet
        waveAqua2 = "#7AA89F", -- improve lightness: desaturated
      },
      theme = {
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
    overrides = function(colors)
      return {
        LineNr = { fg = colors.palette.fujiGray, bg = "NONE" },
        CursorLineNr = { fg = "#7D86AA", bg = "NONE", bold = false },
      }
    end,
  }),
}
