modkey = "Mod1"

-----------------------------------------------------------------------------
--
-- REQUIRES (standard and 3rd party)
--
-----------------------------------------------------------------------------

local awful        = require("awful")
local blind        = require("blind")
local beautiful    = require("beautiful")
local cairo        = require("lgi").cairo
local color        = require("gears.color")
local config       = require("forgotten")
local customMenu   = require("customMenu")
local drawer       = require("drawer")
local gears        = require("gears")
local menubar      = require("menubar")
local utils        = require("utils")
local vicious      = require("extern.vicious")
local wibox        = require("wibox")
local widgets      = require("widgets")

require("awful.autofocus")
require("crashed")

awful.rules = require("awful.rules")




-----------------------------------------------------------------------------
--
-- OWN REQUIRES
--
-----------------------------------------------------------------------------

require("errors")




-----------------------------------------------------------------------------
--
-- PREP PHASE
--
-----------------------------------------------------------------------------

vicious.cache(vicious.widgets.net)
vicious.cache(vicious.widgets.fs)
vicious.cache(vicious.widgets.dio)
vicious.cache(vicious.widgets.cpu)
vicious.cache(vicious.widgets.mem)
vicious.cache(vicious.widgets.dio)

-- Various configuration options
config.showTitleBar  = false
config.themeName     = "arrow"
config.noNotifyPopup = true
config.useListPrefix = true
config.deviceOnDesk  = true
config.desktopIcon   = true
config.advTermTB     = true
config.scriptPath    = awful.util.getdir("config") .. "/Scripts/"

-- Load the theme
config.load()
config.themePath = awful.util.getdir("config") .. "/blind/" .. config.themeName .. "/"
config.iconPath  = config.themePath.. "Icon/"
beautiful.init(config.themePath .. "/theme.lua")


if beautiful.wallpaper then
  for s = 1, screen.count() do
    gears.wallpaper.maximized(beautiful.wallpaper, s, true)
  end
end


-- Table of layouts to cover with awful.layout.inc, order matters.

local layouts =
{
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top
}

dofile(awful.util.getdir("config") .. "/baseRule.lua")


local appMenu        = customMenu.application(nil)
local cr             = cairo.Context(endArrow_alt2i)
local clock          = drawer.dateInfo(nil)
local endArrow       = blind.common.drawing.get_beg_arrow_wdg2({bg_color=beautiful.icon_grad })
local endArrow_alt   = blind.common.drawing.get_beg_arrow_wdg2({bg_color=beautiful.bg_alternate})
local endArrow_alt2  = wibox.widget.imagebox()
local endArrow_alt2i = cairo.ImageSurface(cairo.Format.ARGB32, beautiful.default_height/2+2, beautiful.default_height)
local launcher       = customMenu.launcher(200)
local launchDock     = widgets.dock(nil)
local netinfo        = drawer.netInfo(300)
local placesMenu     = customMenu.places(100)

clock.bg  = beautiful.bg_alternate
cr:set_source_surface(blind.common.drawing.get_beg_arrow2({bg_color=beautiful.bg_alternate}))
cr:paint()
cr:set_source(color(beautiful.icon_grad or beautiful.fg_normal))
cr:set_line_width(1.5)
cr:move_to(0,-2)
cr:line_to(beautiful.default_height/2,beautiful.default_height/2)
cr:line_to(0,beautiful.default_height+2)
cr:stroke()
endArrow_alt2:set_image(endArrow_alt2i)

-- end arrow
local cr          = cairo.Context(endArrowR2i)
local endArrowR   = wibox.widget.imagebox()
local endArrowR2i = cairo.ImageSurface(cairo.Format.ARGB32, beautiful.default_height/2+2, beautiful.default_height)
local endArrowR2  = wibox.widget.imagebox()

cr:set_source_surface(blind.common.drawing.get_beg_arrow2({bg_color=beautiful.bg_alternate ,direction="left"}),2,0)
cr:paint()
cr:set_source(color(beautiful.icon_grad or beautiful.fg_normal))
cr:set_line_width(1.5)
cr:move_to(beautiful.default_height/2+2,-2)
cr:line_to(2,beautiful.default_height/2)
cr:line_to(beautiful.default_height/2+2,beautiful.default_height+2)
cr:stroke()
endArrowR:set_image(endArrowR2i)
endArrowR2:set_image(blind.common.drawing.get_beg_arrow2({bg_color=beautiful.bg_alternate ,direction="left"}),2,0)

local spacer_img = blind.common.drawing.separator_widget()
spacer3          = widgets.spacer({text = "| "}); spacer2 = widgets.spacer({text = "  |"}); spacer4 = widgets.spacer({text = "|"})
spacer5          = widgets.spacer({text = " ",width=5})

-- Create a wibox for each screen and add it
mypromptbox = {}
mytaglist   = {}
mytasklist  = {}
wibox_bot   = {}
wibox_top   = {}

mytaglist.buttons = awful.util.table.join(
  awful.button({        }, 1, awful.tag.viewonly),
  awful.button({ modkey }, 1, awful.client.movetotag),
  awful.button({        }, 4, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end),
  awful.button({        }, 5, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end)
)

mytasklist.buttons = awful.util.table.join(
  awful.button({}, 3, function(c)
    customMenu.clientMenu.client = c
    local menu = customMenu.clientMenu.menu()
    menu.visible = true
  end),

  awful.button({}, 2, function()
    if instance then
      instance:hide()
      instance = nil
    else
      instance = awful.menu.clients({ width = 250 })
    end
  end),

  awful.button({}, 4, function()
    awful.client.focus.byidx(1)
    if client.focus then client.focus:raise() end
  end),

  awful.button({}, 5, function()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end)
)



-----------------------------------------------------------------------------
--
-- MAIN
--
-----------------------------------------------------------------------------

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()

    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    wibox_top[s] = awful.wibox({ position = "top"   , screen = s,height=beautiful.default_height , bg = beautiful.bg_wibar or beautiful.bg_normal })
    wibox_bot[s] = awful.wibox({ position = "bottom", screen = s,height=beautiful.default_height , bg = beautiful.bg_wibar or beautiful.bg_normal })


    -------------------
    --
    -- TOP LEFT
    --
    -------------------
    local left_layout_top = wibox.layout.fixed.horizontal()
    left_layout_top:add(mytaglist[s])

    local bgb = wibox.widget.background()
    local l2 = wibox.layout.fixed.horizontal()
    local mar = wibox.layout.margin()
    mar:set_left(1)
    mar:set_right(4)
    mar:set_widget(l2)
    bgb:set_widget(mar)
    bgb:set_bg(beautiful.bg_alternate)

    left_layout_top:add(bgb)
    left_layout_top:add(endArrow_alt2)



    -------------------
    --
    -- TOP RIGHT
    --
    -------------------
    local right_layout      = wibox.layout.fixed.horizontal()
    local right_layout_meta = wibox.layout.fixed.horizontal()

    if s < 3 then
      right_layout_meta:add(endArrowR)
      right_layout:add(spacer5)
      right_layout:add(spacer_img)
      right_layout:add(spacer_img)
      right_layout:add(clock)
      local right_bg = wibox.widget.background()
      right_bg:set_bg(beautiful.bg_alternate)
      right_bg:set_widget(right_layout)
      right_layout_meta:add(right_bg)
    end


    -------------------
    --
    -- CREATE TOP
    --
    -------------------
    local layout_top = wibox.layout.align.horizontal()
    layout_top:set_left(left_layout_top)
    if s < 3 then
      layout_top:set_right(right_layout_meta)
    end

    wibox_top[s]:set_widget(layout_top)

    -------------------
    --
    -- BOTTOM LEFT
    --
    -------------------
    local layout_bot = wibox.layout.align.horizontal()
    layout_bot:set_middle(mytasklist[s])
    wibox_bot[s]:set_widget(layout_bot)

    local endArrow2 = wibox.widget.imagebox()
    endArrow2:set_image(blind.common.drawing.get_beg_arrow2({bg_color=beautiful.icon_grad,direction="left"}))

    -------------------
    --
    -- CREATE BOTTOM
    --
    -------------------
    layout_bot:set_right(left_layout_right_bot)
end

root.buttons(awful.util.table.join(
  awful.button({ }, 3, function () end),
  awful.button({ }, 4, awful.tag.viewnext),
  awful.button({ }, 5, awful.tag.viewprev)
))

globalkeys = awful.util.table.join(
  awful.key({ modkey }, "j", function ()
      awful.client.focus.byidx( 1)
      if client.focus then client.focus:raise() end
  end),

  awful.key({ modkey }, "k", function ()
    awful.client.focus.byidx(-1)
    if client.focus then client.focus:raise() end
  end),

  awful.key({ modkey,           }, "Tab"   , function () utils.keyFunctions.altTab()          end ),
  awful.key({ modkey, "Shift"   }, "Tab"   , function () utils.keyFunctions.altTabBack()      end ),

  -- Standard program
  awful.key({ modkey, "Control" }, "r", awesome.restart),
  awful.key({ modkey, "Shift"   }, "q", awesome.quit),

  awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
  awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
  awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
  awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),

  awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
  awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),

  -- Prompt
  awful.key({ modkey, "Shift"   }, "r", function ()
    awful.prompt.run({ prompt = "New tag name: " },
    mypromptbox[mouse.screen].widget,

    function(new_name)
      if not new_name or #new_name == 0 then
        return
      else
        local screen = mouse.screen
        local tag    = awful.tag.selected(screen)
        if tag then tag.name = new_name end
      end
    end)
  end),

  -- Menubar
  awful.key({ modkey }, "p", function() menubar.show() end),

  awful.key({ modkey }, "."     , function() awful.screen.focus_relative(1) end),
  awful.key({ modkey }, ","     , function() awful.screen.focus_relative(-1) end),

  awful.key({ modkey, "Shift" }, "."     , function(c) awful.client.movetoscreen(c,1) end),
  awful.key({ modkey, "Shift" }, ","     , function(c) awful.client.movetoscreen(c,-1) end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 10 do
    globalkeys = awful.util.table.join(globalkeys,
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.movetotag(tag)
                     end
                  end),
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      local tag = awful.tag.gettags(client.focus.screen)[i]
                      if client.focus and tag then
                          awful.client.toggletag(tag)
                      end
                  end))
end

root.keys(globalkeys)

awful.rules.rules = {
  {
    rule       = {},
    properties = {
      border_width = beautiful.border_width,
      border_color = beautiful.border_normal,
      focus        = awful.client.focus.filter,
      keys         = clientkeys
    }
  }
}

client.connect_signal("manage", function (c, startup)
  -- Enable sloppy focusssdaf
  c:connect_signal("mouse::enter", function(c)
    if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
    and awful.client.focus.filter(c) then
      client.focus = c
    end
  end)

  --Fix some weird reload bugs
  if c.size_hints.user_size and startup then
    c:geometry({width = c.size_hints.user_size.width,height = c.size_hints.user_size.height, x = c:geometry().x})
  end

  -- Put windows in a smart way, only if they does not set an initial position.
  if not c.size_hints.user_position and not c.size_hints.program_position then
    awful.placement.no_overlap(c)
    awful.placement.no_offscreen(c)
  end
end)
