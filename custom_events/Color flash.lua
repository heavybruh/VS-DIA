--[[

A more simple and optimized camera flash event :D
- Heavy Bruh

]]

function onEvent(name, value1, value2)
	if name == "Color flash" then
		cameraFlash('other', (value1..''), value2, true)
	end
end