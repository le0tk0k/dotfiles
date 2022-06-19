hs.window.animationDuration = 0
units = {
  right50 = { x = 0.50, y = 0.00, w = 0.50, h = 1.00 },
  left50  = { x = 0.00, y = 0.00, w = 0.50, h = 1.00 },
  maximum = { x = 0.00, y = 0.00, w = 1.00, h = 1.00 }
}
mash = { 'ctrl', 'command' }
hs.hotkey.bind(mash, 'l', function() hs.window.focusedWindow():move(units.right50, nil, true) end)
hs.hotkey.bind(mash, 'h', function() hs.window.focusedWindow():move(units.left50, nil, true) end)
hs.hotkey.bind(mash, 'm', function() hs.window.focusedWindow():move(units.maximum, nil, true) end)

switcher = hs.window.switcher.new()
switcher.ui.showSelectedThumbnail = false
hs.hotkey.bind('alt','tab',function()switcher:next()end)
hs.hotkey.bind('alt-shift','tab',function()switcher:previous()end)
