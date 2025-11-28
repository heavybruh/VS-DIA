--[[

DO NOT TOUCH

Unless If you're a lua coder then go ahead :)

]]

local px = 520;
local py = 600;
local Dadsofs = 6;

local bx = px;
local by = py;
local Bfofs = 13;

local followChar = true;

function onSongStart()
	doTweenAlpha('black-alpha', 'black', 0, 13, 'linearInOut');
	doTweenAlpha('hud-alpha', 'camHUD', 1, 12, 'linearInOut');
end

function onCreatePost()
	setProperty('boyfriend.visible', false);
	setProperty('gf.visible', false);
	
	setProperty('camHUD.alpha', 0);
	
	--Goodbye dia's notes
    for i = 0, getProperty('opponentStrums.length') - 1 do
        setPropertyFromGroup('opponentStrums', i, 'x', -9999);
    end

    setPropertyFromGroup('playerStrums', 0, 'x', 415);
    setPropertyFromGroup('playerStrums', 1, 'x', 525);
    setPropertyFromGroup('playerStrums', 2, 'x', 645);
    setPropertyFromGroup('playerStrums', 3, 'x', 755);
end

function onUpdatePost()
	setProperty('credits-text.y', getProperty('box.y')+50);
	setProperty('credits-text.x', getProperty('box.x')+180);
end

function onUpdate(elapsed)
    if (followChar == true) then
        if (mustHitSection == false) then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',px-Dadsofs,py);
            elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',px+Dadsofs,py);
            elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',px,py-Dadsofs);
            elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',px,py+Dadsofs);
            elseif getProperty('dad.animation.curAnim.name') == 'laugh' then
                triggerEvent('Camera Follow Pos',px,py);
            elseif getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',px,py);
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',bx-Bfofs,by);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',bx+Bfofs,by);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',bx,by-Bfofs);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',bx,by+Bfofs);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',bx,by);
            end
        end
    end
end

function onStepHit()
	if curStep == 128 then
		doTweenAlpha('hud-alpha', 'camHUD', 1, 0.1, 'linearInOut');
	end
	if curStep == 767 then
		setProperty("defaultCamZoom", getProperty("defaultCamZoom")-.15);
        doTweenY('monster-y', 'monsta', 50, 3, 'quintOut');
		py = 400;
		by = py;
	end
	if curStep == 1023 then
	    doTweenAlpha('hud-alpha', 'camHUD', 0, 1.6, 'linearInOut');
	end
	if curStep == 1040 then
		setProperty('camGame.visible', false);
	end
end