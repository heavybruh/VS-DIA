--[[ Script made by Heavy Bruh :D ]]

local shake_count = 0
local shake_intensity = 0
local shake_speed = 0.45

local shaderName = 'chromabber_camGame'
local shader_amount = 0
local shaderShit = false

function onCountdownTick(counter)
    if counter == 3 then
		doTweenAlpha('black-alpha', 'black', 0, .1, 'linearInOut')
    end
end

function onCreate()
	if not hideHud then
		makeLuaText('note-shake-counter', "fart", 0, 60, 240)
		setTextColor('note-shake-counter', '0xffffff')
		setTextSize('note-shake-counter', getProperty('scoreTxt.size'));
		setObjectCamera('note-shake-counter', 'hud');
		addLuaText('note-shake-counter', true)

		makeLuaText('healthTxt', "fart", 0, 0, 0)
		setTextColor('healthTxt', '0xffffff')
		setTextSize('healthTxt', getProperty('scoreTxt.size'));
		setObjectCamera('healthTxt', 'hud');
		addLuaText('healthTxt', true)
	end
end

function onCreatePost()
	shaderCoordFix()
    addHaxeLibrary("ShaderFilter", "openfl.filters")
	
	setProperty('gf.visible', false)
	setProperty('dad.visible', false)
	setProperty('iconP2.visible', false)

	setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarTxt.visible', false)

	setProperty('timeBar.x', getProperty('healthBar.x')+100)
    setProperty('timeBar.y', getProperty('healthBar.y'))
    setProperty('timeBarBG.x', getProperty('healthBarBG.x')+100)
    setProperty('timeBarBG.y', getProperty('healthBarBG.y'))
    setProperty('timeTxt.x', getProperty('healthBar.x')+100)
    setProperty('timeTxt.y', getProperty('healthBar.y')-12)

	setObjectOrder('timeBarBG', getObjectOrder('healthBar'))
	setObjectOrder('timeBar', getObjectOrder('healthBar')+1)
	setObjectOrder('timeTxt', getObjectOrder('healthBar')+2)

	--Goodbye dia's notes
    for i = 0, getProperty('opponentStrums.length') - 1 do
        setPropertyFromGroup('opponentStrums', i, 'x', -9999)
    end

	--Bf's notes in the middle
	for i = 0, getProperty('playerStrums.length') - 1 do
        setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x')-320)
    end

	makeLuaSprite(shaderName)
    setSpriteShader(shaderName, shaderName)
	setShaderFloat(shaderName, 'amount', shader_amount)
    runHaxeCode([[
        var shaderName = "]] .. shaderName .. [[";

        trace(ShaderFilter);
        game.camGame.setFilters([new ShaderFilter(game.getLuaObject(shaderName).shader)]);
		//game.camHUD.setFilters([new ShaderFilter(game.getLuaObject(shaderName).shader)]);
		shaderName_fuck_idk = game.createRuntimeShader(shaderName);
    ]])
end

function noteMissPress(id, direction, noteType, isSustainNote)
	shake_count = shake_count + 1
	shake_intensity = shake_intensity + 5
	doTweenColor('counterColor', 'note-shake-counter', 'FF0000', 0.01, 'linear');
end

function noteMiss(members, noteData, noteType, isSustainNote)
	shake_count = shake_count + 1
	shake_intensity = shake_intensity + 5
	doTweenColor('counterColor', 'note-shake-counter', 'FF0000', 0.01, 'linear');
end

function onTweenCompleted(tag, t)
	if tag == 'counterColor' then
		doTweenColor('counterColor', 'note-shake-counter', 'FFFFFF', 1, 'linear');
	end
end

function onUpdatePost()
	setProperty('iconP1.x', 40)
	setProperty('iconP1.y', 300)
	setProperty('iconP1.flipX', true)

	setProperty('credits-text.y', getProperty('box.y')+50)
	setProperty('credits-text.x', getProperty('box.x')+160)

	if getProperty('health') <= .4 then
		setProperty('healthTxt.x', 180)
		setProperty('healthTxt.color', getColorFromHex('ff0000'))
	else
		setProperty('healthTxt.x', 160)
		setProperty('healthTxt.color', getColorFromHex('ffffff'))
	end
end

function onUpdate(elapsed)
	setTextString('note-shake-counter', string.format("Dizziness: "..shake_count.."/5"))

    setTextString('healthTxt', '' .. getProperty('healthBar.percent') .. '%', health)
	setProperty('healthTxt.y', getProperty('iconP1.y')+70)

	if shaderShit == true then
		setShaderFloat(shaderName, 'amount', getShaderFloat(shaderName, 'amount')-1.1)
	elseif shaderShit == false then
		setShaderFloat(shaderName, 'amount', 0)
	end

	--Dizzines mechanic
	guh = ((getSongPosition() / 1000)*(bpm/84))
	for i = 0, getProperty('strumLineNotes.length')-1 do
		setPropertyFromGroup('strumLineNotes', i, 'y', defaultPlayerStrumY1 + shake_intensity * math.sin((guh + i*shake_speed) * math.pi), i)
	end
	if shake_count >= 5 then 
		shake_count = 5
		shake_intensity = 25
	end
end

function onStepHit()
	if curStep == 1280 then
		doTweenAlpha('hud-alpha', 'camHUD', 0.5, 0.3, 'linearInOut')
		setProperty("defaultCamZoom", getProperty("defaultCamZoom")+.08)
		setProperty('cameraSpeed', getProperty('cameraSpeed')+50)
	elseif curStep == 1288 or curStep == 1296 or curStep == 1304 then
		setProperty("defaultCamZoom", getProperty("defaultCamZoom")+.08)
	elseif curStep == 1312 then
		setProperty("defaultCamZoom", getProperty("defaultCamZoom")-.32)
		setProperty('cameraSpeed', getProperty('cameraSpeed')-50)
		doTweenAlpha('hud-alpha', 'camHUD', 1, 0.3, 'linearInOut')
	elseif curStep == 1888 then
		setProperty('camZooming', false)
		shaderShit = true
		doTweenZoom('da-zoom', 'camHUD', .01, 8, 'sineInOut')
	elseif curStep == 1904 then
		shaderShit = false
		setProperty('camHUD.visible', false)
		setProperty('camGame.visible', false)
	end
end

function shaderCoordFix()
    runHaxeCode([[
        resetCamCache = function(?spr) {
            if (spr == null || spr.filters == null) return;
            spr.__cacheBitmap = null;
            spr.__cacheBitmapData = null;
        }
        
        fixShaderCoordFix = function(?_) {
            resetCamCache(game.camGame.flashSprite);
            resetCamCache(game.camHUD.flashSprite);
            resetCamCache(game.camOther.flashSprite);
        }
    
        FlxG.signals.gameResized.add(fixShaderCoordFix);
        fixShaderCoordFix();
        return;
    ]])
end