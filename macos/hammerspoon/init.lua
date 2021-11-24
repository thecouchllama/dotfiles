-- Disable Animation
hs.window.animationDuration = 0

-- Setup Key Shortcuts
local hyper = {"shift", "cmd", "alt", "ctrl"}

-- Full Screen
hs.hotkey.bind(hyper, "o", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Left Half
hs.hotkey.bind(hyper, "j", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Right Half
hs.hotkey.bind(hyper, ";", function()
  if hs.window.focusedWindow() then
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x + (max.w / 2)
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
  else
    hs.alert.show("No Active Window")
  end
end)

-- Hint Keys
hs.hints.hintChars = {"A", "S", "D", "F", "Q", "W", "E", "R"}

-- Disable Showing Titles
hs.hints.showTitleThresh = 0

-- Hint Shortcut
hs.hotkey.bind(hyper, 'w', function()
  hs.hints.windowHints()
end)

-- Switch Window Focus
hs.hotkey.bind(hyper, '[', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowWest()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, ']', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowEast()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, '-', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowNorth()
  else
    hs.alert.show("No Active Window")
  end
end)

hs.hotkey.bind(hyper, '=', function()
  if hs.window.focusedWindow() then
    hs.window.focusedWindow():focusWindowSouth()
  else
    hs.alert.show("No Active Window")
  end
end)
