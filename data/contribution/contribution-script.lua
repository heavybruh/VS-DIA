--[[

DO NOT TOUCH

Unless If you're a lua coder then go ahead :)

]]

local del = 0;
local del2 = 0;

local bx = 230
local by = 65
local Bfofs = 9
local bzoom = .9

local gx = bx
local gy = by
local Gfofs = 6
local gzoom = 1.4

local px = bx
local py = by
local Dadsofs = Bfofs
local pzoom = bzoom

local followchar = true

function onSongStart()
	doTweenAlpha('black-alpha', 'black', 0, .3, 'linearInOut')
end

function onUpdatePost()
	setProperty('credits-text.y', getProperty('box.y')+50)
	setProperty('credits-text.x', getProperty('box.x')+180)
end

function onCreatePost()
	setProperty('dad.scale.x', .35)
	setProperty('dad.scale.y', .35)
end

function onUpdate(elapsed)
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if followchar == true then
	   if mustHitSection == false then
			setProperty("defaultCamZoom", pzoom)
			doTweenAlpha('bf-turn', 'boyfriend', 1, .1, 'sineInOut')
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',px-Dadsofs,py)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',px+Dadsofs,py)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',px,py-Dadsofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',px,py+Dadsofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',px,py)
			end
            if gfSection == true then
				setProperty("defaultCamZoom", gzoom)
				doTweenAlpha('dad-turn', 'boyfriend', 0, .1, 'sineInOut')
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',gx-Gfofs,gy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',gx+Gfofs,gy)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',gx,gy-Gfofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',gx,gy+Gfofs)
                end
            end
        else
			 setProperty("defaultCamZoom", bzoom)
			 doTweenAlpha('bf-turn', 'boyfriend', 1, .1, 'sineInOut')
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',bx-Bfofs,by)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',bx+Bfofs,by)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',bx,by-Bfofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',bx,by+Bfofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',bx,by)
			end
		end
	end
end