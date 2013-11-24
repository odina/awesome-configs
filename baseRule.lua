local awful      = require("awful")
local config     = require("forgotten")
local tyrannical = require("tyrannical")
local utils      = require("utils")

tyrannical.settings.block_transient_for_focus_stealing = true
tyrannical.settings.group_children = true
tyrannical.settings.default_layout =  awful.layout.suit.tile.right

tyrannical.tags = {
    {
      name        = "term",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("term.png"),
      screen      = {config.scr.pri, config.scr.sec},
      focus_new   = true,
      selected    = true,
      nmaster     = 1
    },

    {
      name        = "web",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("net.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "mp3",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("media.png"),
      screen      = {config.scr.pri, config.scr.sec},
      no_focus_stealing = true
    },

    {
      name        = "win",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("term.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "a/v",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("video.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "term",
      init        = true,
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("term.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "mail",
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("mail2.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "log",
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("folder.png"),
      screen      = {config.scr.pri, config.scr.sec}
    },

    {
      name        = "social",
      exclusive   = false,
      icon        = utils.tools.invertedIconPath("chat.png"),
      screen      = {config.scr.pri, config.scr.sec}
    }
}
