-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, 'F17')

-- Enter Hyper Mode when F18 (Hyper/Capslock) is pressed
function enterHyperMode()
  hyper.triggered = false
  hyper:enter()
end

-- Leave Hyper Mode when F18 (Hyper/Capslock) is pressed,
-- send ESCAPE if no other keys are pressed.
function exitHyperMode()
  hyper:exit()
  if not hyper.triggered then
    hs.eventtap.keyStroke({}, 'ESCAPE')
  end
end

-- Bind the Hyper key
f18 = hs.hotkey.bind({}, 'F18', enterHyperMode, exitHyperMode)

hyper:bind({}, 'u', function()
  hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, 'u')
  hyper.triggered = true
end)


hyper:bind({}, 's', function()
  hs.eventtap.keyStroke({'cmd','alt','shift','ctrl'}, 's')
  hyper.triggered = true
end)
