local This = {}

This.hyperMode = hs.hotkey.modal.new({}, "F17")

function enterHyperMode()
  This.hyperMode:enter()
end

function exitHyperMode()
  This.hyperMode:exit()
end

-- Binds the enter/exit functions of the Hyper modal to all
-- combinations of modifiers
function This.install(hotKey)
  hs.hotkey:bind({ "alt", "cmd", "shift", "ctrl" }, hotKey, nil, enterHyperMode, exitHyperMode)
end

return This
