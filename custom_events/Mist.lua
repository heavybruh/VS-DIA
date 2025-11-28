--[[ 

	Script made by Heavy Bruh 

]]

local event_name = 'Mist'
local event_active = false
local hit = 0
local hit_max = 3

function onCreate()
	if event_name == 'Mist' then
		makeAnimatedLuaSprite('daspacebar', ('events/')..'Extras', 0, 0)
		addAnimationByPrefix('daspacebar', 'Space press', "Spacebar", 24, false);
		scaleObject('daspacebar', 0, 0)
		setObjectCamera('daspacebar', 'hud');
		setProperty('daspacebar.alpha', 0)
		setObjectOrder('daspacebar', 2)
		addLuaSprite('daspacebar', true)

		makeLuaSprite('mist', 'smoke', 1300, 0);
		setObjectCamera('mist', 'hud');
		--setProperty('mist.color', getColorFromHex('ff0000'))
		setObjectOrder('mist', 20)
		setProperty('mist.alpha', 0)
		scaleObject('mist', 1.35, 1.35)
		addLuaSprite('mist', true);

		makeLuaSprite('mist-1', 'smoke', -1200, getProperty('mist.y'));
		setObjectCamera('mist-1', 'hud');
		setObjectOrder('mist-1', getObjectOrder('mist'))
		--setProperty('mist-1.color', getColorFromHex('00ff00'))
		setProperty('mist-1.alpha', getProperty('mist.alpha'))
		setProperty('mist-1.flipX', true)
		scaleObject('mist-1', getProperty('mist.scale.x'), getProperty('mist.scale.y'))
		addLuaSprite('mist-1', true);

		makeLuaText('hit-counter', "Hits: 0/beans", 0, getProperty('daspacebar.x'), getProperty('daspacebar.y')+470)
		setTextColor('hit-counter', 'ffffff')
		setTextBorder('hit-counter', 3, '000000')
		setTextSize('hit-counter', 45);
		setObjectCamera('hit-counter', 'hud');
		setProperty('hit-counter.alpha', 0)
		doTweenX('brokenIdk-scale-x', 'hit-counter.scale', 0, .01, 'linearInOut')
		doTweenY('brokenIdk-scale-y', 'hit-counter.scale', 0, .01, 'linearInOut')
		addLuaText('hit-counter', true)
	end
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('daspacebar', 'Space press', true)
	end
end

function onEvent(name)
	if name == event_name then
		if event_active == false then
			mistAppear()
			event_active = true
		elseif event_active == true then
			--[[ Do nothing ]]
		end
	end
end

function onUpdate(elapsed)
	screenCenter('daspacebar', 'xy')
	screenCenter('hit-counter', 'x')
	setTextString('hit-counter', "Hits: "..hit.."/"..hit_max.."")

	setProperty('mist-1.y', getProperty('mist.y'))
	setProperty('mist-1.alpha', getProperty('mist.alpha'))
	setProperty('mist-1.scale.y', getProperty('mist.scale.y'))
	
	if downscroll then
		setProperty('mist.y', 400)
	elseif not downscroll then
		setProperty('mist.y', 100)
		setProperty('mist.flipY', true)
		setProperty('mist-1.flipY', true)
	end

    if keyJustPressed('space') and getProperty('daspacebar.alpha') == 1 and event_name == 'Mist' then
		mistMash()
    elseif hit >= hit_max then
		mistDisappear()
    end
end

function mistAppear()
	hit_max = getRandomInt(3,6)
	setTextString('hit-counter', "Hits: "..hit.."/"..hit_max.."")

	dur = 1.5
	doTweenAlpha('daspacebar-alpha-1', 'daspacebar', 1, dur, 'sineInOut')
	doTweenAlpha('mist-alpha-1', 'mist', 1, dur, 'sineInOut')
	doTweenAlpha('hit-counter-alpha-1', 'hit-counter', 1, dur, 'sineInOut')

	doTweenX('daspacebar-scale-x', 'daspacebar.scale', 1, dur, 'sineInOut')
	doTweenY('daspacebar-scale-y', 'daspacebar.scale', 1, dur, 'sineInOut')
	doTweenX('hit-counter-scale-x', 'hit-counter.scale', 1, dur, 'sineInOut')
	doTweenY('hit-counter-scale-y', 'hit-counter.scale', 1, dur, 'sineInOut')

	for i = 0, getProperty('strumLineNotes.length')-1 do
		noteTweenAlpha('strumLineNotes-'..i..'-alpha-0', i, .01, dur, 'sineInOut')
	end

	doTweenX('mist-x', 'mist', 550, dur, 'quadInOut')
	doTweenX('mist-1-x', 'mist-1', -450, dur, 'quadInOut')
end

function mistMash()
	hit = hit + 1
	setProperty('mist.x', getProperty('mist.x')+10)
	setProperty('mist-1.x', getProperty('mist-1.x')-10)

	dur = .15
	setProperty('daspacebar.scale.x', 1.1)
	setProperty('daspacebar.scale.y', 1.1)
	doTweenX('daspacebar-scale-x', 'daspacebar.scale', 1, dur, 'sineInOut')
	doTweenY('daspacebar-scale-y', 'daspacebar.scale', 1, dur, 'sineInOut')

	setProperty('hit-counter.scale.x', 1.1)
	setProperty('hit-counter.scale.y', 1.1)
	doTweenX('hit-counter-scale-x', 'hit-counter.scale', 1, dur, 'sineInOut')
	doTweenY('hit-counter-scale-y', 'hit-counter.scale', 1, dur, 'sineInOut')
end


function mistDisappear()
	dur = 1
	event_active = false
	doTweenAlpha('daspacebar-alpha-0', 'daspacebar', 0, dur, 'sineInOut')
	doTweenAlpha('mist-alpha-0', 'mist', 0, dur, 'sineInOut')
	doTweenAlpha('hit-counter-alpha-0', 'hit-counter', 0, dur, 'sineInOut')

	doTweenX('daspacebar-scale-x', 'daspacebar.scale', 0, dur, 'sineInOut')
	doTweenY('daspacebar-scale-y', 'daspacebar.scale', 0, dur, 'sineInOut')
	doTweenX('hit-counter-scale-x', 'hit-counter.scale', 0, dur, 'sineInOut')
	doTweenY('hit-counter-scale-y', 'hit-counter.scale', 0, dur, 'sineInOut')

	for i = 0, getProperty('strumLineNotes.length')-1 do
		noteTweenAlpha('strumLineNotes-'..i..'-alpha-1', i, 1, dur, 'sineInOut')
	end

	doTweenX('mist-x', 'mist',  getProperty('mist.x')+550, dur, 'sineInOut')
	doTweenX('mist-1-x', 'mist-1',  getProperty('mist-1.x')-550, dur, 'sineInOut')
	hit = 0
end