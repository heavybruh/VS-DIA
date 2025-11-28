--[[

DO NOT TOUCH

Unless If you're a lua coder then go ahead :)

]]

local del = 0;
local del2 = 0;

local bx = 200
local by = 65
local Bfofs = 9
local bzoom = .9

local px = bx
local py = by
local Dadsofs = 0
local pzoom = .9

local followchar = true

local inCut = false

function onSongStart()
	doTweenAlpha('black-alpha', 'black', 0, 20, 'linearInOut')
end

function onCreate()
	addCharacterToList('dia', 'dad')
	addCharacterToList('gf-back', 'bf')
end

function onCreatePost()
	setObjectOrder('dadGroup', 11)
	setProperty('iconP2.alpha', 0)

	setProperty('dad.visible', false)

	setProperty('camHUD.visible', false)

	setProperty('health', 2)

    for i = 0, getProperty('opponentStrums.length') - 1 do
        setPropertyFromGroup('opponentStrums', i, 'y', -9000)
    end
end

function onUpdatePost()
	setProperty('credits-text.y', getProperty('box.y')+50)
	setProperty('credits-text.x', getProperty('box.x')+150)
end

function onUpdate(elapsed)
	setProperty('gf.visible', false)

	setProperty('dad.scale.x', .35)
	setProperty('dad.scale.y', .35)

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if followchar == true then
	   if mustHitSection == false then
			setProperty("defaultCamZoom", pzoom)
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
	  else
			 setProperty("defaultCamZoom", bzoom)
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
function onStepHit()
	if curStep == 128 then
		setProperty('camHUD.visible', true)
	end

	if curStep == 367 then
		doTweenZoom('into-the-light', 'camGame', 10, 7, 'quintInOut')
		doTweenZoom('we-going-foward', 'camHUD', -1, 7, 'quintInOut')
		doTweenAlpha('black-alpha-1', 'black', 1, 2.6, 'quintInOut')
	end

    if curStep == 383 then
		cancelTween('into-the-light')
		cancelTween('we-going-foward')
		doTweenAlpha('black-alpha-0', 'black', 0, 1.6, 'linearInOut')
		setProperty('iconP2.alpha', 1)
		
		setProperty('health', 1)
		setProperty('dad.visible', true)
		setProperty('boyfriend.visible', true)

		by = 50
		bx = 150

		Dadsofs = Bfofs
		py = by
		px = bx

		for i = 0, getProperty('opponentStrums.length') - 1 do
			setPropertyFromGroup('opponentStrums', i, 'y', getPropertyFromGroup('playerStrums', i, 'y'))
		end
	end

	if curStep == 1048 then
		setProperty('camGame.visible', false)
		doTweenAlpha('hud-alpha', 'camHUD', 0, 1, 'linearInOut')
	end
end

function onStartCountdown()
    if not inCut and isStoryMode then
	    startVideo('poop-fart-start')
	    inCut = true;
	    return Function_Stop;
    end
	return Function_Continue;
end

function onEndSong()
	if not allowEnd and isStoryMode then
	    startVideo('poop-fart-end')
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end

--[[
*jaw drops to floor, eyes pop out of sockets accompanied by trumpets, heart beats out of chest, awooga awooga sound effect, pulls chain on train whistle that has appeared next to head as steam blows out, slams fists on table, rattling any plates, bowls or silverware, whistles loudly, fireworks shoot from top of head, pants loudly as tongue hangs out of mouth, wipes comically large bead of sweat from forehead, clears throat, straightens tie, combs hair* 
]]