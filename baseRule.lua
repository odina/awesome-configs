layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.max,
    awful.layout.suit.fair,
    --awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.floating,
    --awful.layout.suit.tile.top,
    --awful.layout.suit.fair.horizontal,
    --awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max.fullscreen,
    --awful.layout.suit.magnifier,
}

layouts_all =
{
    awful.layout.suit.tile,
    awful.layout.suit.max,
    awful.layout.suit.fair,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    --awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier,
    awful.layout.suit.floating
}
-- }}}

shifty.config.tags ={ 
    ["Term"] =       {  init = true, 
			position = 1, 
			exclusive = true, 
			icon = awful.util.getdir("config") .. "/Icon/tags/term.png",
			max_clients = 5,
			screen = {1, 2},
			layout = awful.layout.suit.fair },
    ["Internet"] =   {  init = true, 
			position = 2, 
			exclusive = true, 
			icon = awful.util.getdir("config") .. "/Icon/tags/net.png",
			layout = awful.layout.suit.max },
			
    ["Files"] =      {  init = true, 
			position = 3, 
			exclusive = true, 
			icon = awful.util.getdir("config") .. "/Icon/tags/folder.png",
			max_clients = 5,
			layout = awful.layout.suit.tile },
			
    ["Develop"] =    {  init = true, 
			position = 4, 
			exclusive = true, 
			screen = {1,2},
			icon = awful.util.getdir("config") .. "/Icon/tags/bug.png",
			layout = awful.layout.suit.max },
		      
    ["Edit"] =       {  init = true, 
			position = 5, 
			exclusive = true, 
			screen = {1,2},
			icon = awful.util.getdir("config") .. "/Icon/tags/editor.png",
			max_clients = 5,
			layout = awful.layout.suit.tile.bottom },
			
    ["Media"] =      {  init = true, 
			position = 6, 
			exclusive = true, 
			icon = awful.util.getdir("config") .. "/Icon/tags/media.png",
			layout = awful.layout.suit.max },
			
    ["Doc"] =        {  init = true, 
			position = 7, 
			exclusive = true, 
			icon = awful.util.getdir("config") .. "/Icon/tags/info.png",
			screen = 2,
			layout = awful.layout.suit.magnifier },
    ["Imaging"] =    {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/image.png",
			layout = awful.layout.suit.max },
			
    ["Picture"] =    {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/image.png",
			layout = awful.layout.suit.max },
			
    ["Video"] =      {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/video.png",
			layout = awful.layout.suit.max },
    ["Movie"] =      {  init = false, 
			position = 12, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/video.png",
			layout = awful.layout.suit.max },
    ["3D"] =         {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/3d.png",
			layout = awful.layout.suit.max.fullscreen },
			
    ["Music"] =      {  init = false, 
			position = 10, 
			exclusive = true,
			screen = 2,
			icon = awful.util.getdir("config") .. "/Icon/tags/media.png",
			layout = awful.layout.suit.max },
			
    ["Down"] =       {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/download.png",
			layout = awful.layout.suit.max },
			
    ["Office"] =     {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/office.png",
			layout = awful.layout.suit.max },
			
    ["RSS"] =        {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/rss.png",
			layout = awful.layout.suit.max },
    ["Chat"] =       {  init = false, 
			position = 10, 
			exclusive = true,
			screen = 2,
			icon = awful.util.getdir("config") .. "/Icon/tags/chat.png",
			layout = awful.layout.suit.tile },
    ["Burning"] =       {  init = false, 
			position = 10, 
			exclusive = true,
			icon = awful.util.getdir("config") .. "/Icon/tags/burn.png",
			layout = awful.layout.suit.tile },
    ["Mail"] =       {  init = false, 
			position = 10, 
			exclusive = true,
			screen = 2,
			icon = awful.util.getdir("config") .. "/Icon/tags/mail2.png",
			layout = awful.layout.suit.max },
			
    ["IRC"] =        {  init = false, 
			position = 10, 
			exclusive = true,
			screen = 2,
			icon = awful.util.getdir("config") .. "/Icon/tags/irc.png",
			layout = awful.layout.suit.fair },
    ["Test"] =       {  init = false, 
			position = 99, 
			exclusive = false,
			screen = 2,
			icon = awful.util.getdir("config") .. "/Icon/tools.png",
			layout = awful.layout.suit.max },
    ["Config"] =       {  init = false, 
			position = 10, 
			exclusive = false,
			icon = awful.util.getdir("config") .. "/Icon/tools.png",
			layout = awful.layout.suit.max },
    ["Game"] =       {  init = false, 
			screen = 2,
			position = 10, 
			exclusive = false,
			icon = awful.util.getdir("config") .. "/Icon/tags/game.png",
			layout = awful.layout.suit.max,
			},
    ["Gimp"] =       {  init = false, 
			position = 10, 
			exclusive = false,
			icon = awful.util.getdir("config") .. "/Icon/tags/image.png",
			layout = awful.layout.tile,
			nmaster = 1,
			incncol = 10,
			ncol = 2,
			mwfact = 0.00},
			

}

-- client settings
-- order here matters, early rules will be applied first
shifty.config.apps = {
{match = { "xterm", "urxvt", "aterm","sauer_client"} , honorsizehints = false, slave = false, tag = "Term" } ,
{match = { "Opera", "Firefox", "ReKonq", "Dillo", "Arora","Chromium" } , tag = "Internet" } ,
{match = { "Thunar", "Konqueror", "Dolphin", "emelfm2", "Nautilus", "Ark", "XArchiver"} , tag = "Files" } ,
{match = { "Kate", "KDevelop", "Codeblocks", "Code::Blocks", "DDD"} , tag = "Develop" } ,
{match = { "KWrite", "GVim", "Emacs", "Code::Blocks", "DDD"} , tag = "Edit" } ,
{match = { "Xine", "xine Panel", "xine*", "MPlayer", "GMPlayer", "XMMS"} , tag = "Media" } ,
{match = { "VLC"} , tag = "Movie" } , --For fullscreen with controls
{match = { "Inkscape", "KolourPaint", "Krita", "Karbon", "Karbon14"} , tag = "Imaging" } ,
{match = { "Digikam", "F-Spot", "GPicView", "ShowPhoto", "KPhotoAlbum"} , tag = "Picture" } ,
{match = { "KDenLive", "Cinelerra", "AVIDeMux", "Kino"} , honorsizehints = true, tag = "Video" } ,
{match = { "Blender", "Maya", "K-3D", "KPovModeler"} , tag = "3D" } ,
{match = { "Amarok", "SongBird","last.fm"} , tag = "Music" } ,
{match = { "Assistant", "Okular", "Evince", "EPDFviewer", "xpdf", "Xpdf"} , tag = "Doc" } ,
{match = { "Transmission", "KGet"} , tag = "Down" } ,
{match = { "OOWriter","OOCalc","OOMath","OOImpress","OOBase","SQLitebrowser","Silverun","Workbench","KWord","KSpread" 
	    ,"KPres","Basket","openoffice.org","openoffice.org 3.1", "OpenOffice.*" },tag = "Office" } ,
{match = { "Pidgin", "Kopete"} , tag = "Chat" } ,
{match = { "Konversation", "Botch"} , tag = "IRC" } ,
{match = { "MPlayer","pinentry","ksnapshot","pinentry","gtksu","xine","feh","kmix","kcalc","xcalc","yakuake"},float= true},
{match = { "Konversation","Opera","mythfrontend","Firefox","Chrome", "Okular","*OpenOffice*","OpenOffice"} , float = false } ,
{match = { "ksnapshot","pinentry","gtksu","kcalc","xcalc","feh","About KDE","Gradient editor", "Background color" }, intrusive = true, } ,
{match = { "Kimberlite", "Kling", "Krong"} , tag = "Test" } ,
{match = { "Systemsettings", "Kcontrol", "gconf-editor"} , tag = "Config" } ,
{match = { "k3b"} , tag = "Burning" } ,
{match = { "sauer_client", "Cube 2: Sauerbraten","Cube 2$"} , tag = "Game" } ,
{match = { "Thunderbird","kmail","evolution"} , tag = "Mail" } ,
{match = { "rssStock"} , tag = "RSS" , honorsizehints = false } ,
{match = { "pcmanfm","Moving", "^Moving$", "Extracting", "^Extracting$","Deleting","^Deleting$","Copying", "^Copying$" }, slave = true } ,
{match = { "gimp" }, honorsizehints = false, tag = "Gimp" } ,
{match = { "^Conky$" },  intrusive = true,  geometry = {64,39,nil,nil}, sticky=true },
{match = {"gimp-image-window" }, slave = true, geometry = {0,0,200,800},struts = { right=200 }},
{match = {"gimp-dock","Tool Options" }, slave = true, geometry = {nil,0,0,0} },
{match = {"gimp-toolbox","gimp.toolbox","ToolBox" }, slave = false, geometry = {0,0,0,0} },
{ match = { "" },
    buttons = awful.util.table.join(
        awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
        awful.button({ modkey }, 1, awful.mouse.client.move),
        awful.button({ modkey }, 3, awful.mouse.client.resize),
        awful.button({ modkey }, 8, awful.mouse.client.resize)),
    titlebar = false
  },
}