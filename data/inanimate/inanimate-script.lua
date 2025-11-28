--[[ Script made by Heavy Bruh :D ]]

local bf = {
    cam_x = nil,
    cam_y = nil,
	cam_zoom = 0.75
}

local dad = {
    cam_x = bf.cam_x,
    cam_y = bf.cam_y,
	cam_zoom = bf.cam_zoom
}

local ofs = 9;

local followChar = false;

local flickering_light = false;

function onSongStart()
	debugPrint(crochet / 120)
	doTweenAlpha('black-alpha', 'black', 0, 10, 'linearInOut');
	doTweenZoom('da-zoom-0', 'camGame', 0.8, 5.4, 'sineInOut');
	doTweenX('camera-x-1', getProperty('camFollowPos'), 450, (crochet / 62.7), 'sineInOut');
	doTweenY('camera-y-1', getProperty('camFollowPos'), 600, (crochet / 62.7), 'sineInOut');
end

function onCreate()
	addCharacterToList('corpse', 'dad');

	makeLuaSprite('corpse-jumpscare', 'events/Omg', nil, nil);
	setObjectCamera('corpse-jumpscare', 'other');
	scaleObject('corpse-jumpscare', 0.4, 0.4);
	setProperty('corpse-jumpscare.visible', false);
    addLuaSprite('corpse-jumpscare', false);
end

function onCreatePost()
	triggerEvent('Camera Follow Pos', 150, 150);

	setProperty('camHUD.visible', false);

	setProperty('gf.visible', false);
	setProperty('dad.visible', false);
end

function onUpdatePost()
	setProperty('corpse-jumpscare.x', getRandomFloat(170, 190));
	setProperty('corpse-jumpscare.y', getRandomFloat(-40, -60));

	setProperty('boyfriend.color', getColorFromHex('a5d6e7'));
    setProperty('dad.color', getProperty('boyfriend.color'));
end

function onSectionHit()
    if (mustHitSection == false) then
        setProperty("defaultCamZoom", dad.cam_zoom);
    else
        setProperty("defaultCamZoom", bf.cam_zoom);
    end

	flickering_light = true;
	runTimer('flickering-light-end', (crochet / 1000), nil);
end

function onUpdate()
    if (followChar == true) then
        if (mustHitSection == false) then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', dad.cam_x-ofs, dad.cam_y);
            elseif getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', dad.cam_x+ofs, dad.cam_y);
            elseif getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', dad.cam_x, dad.cam_y-ofs);
            elseif getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', dad.cam_x, dad.cam_y+ofs);
            elseif getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', dad.cam_x, dad.cam_y);
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos', bf.cam_x-ofs, bf.cam_y);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos', bf.cam_x+ofs, bf.cam_y);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos', bf.cam_x, bf.cam_y-ofs);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos', bf.cam_x, bf.cam_y+ofs);
            elseif getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos', bf.cam_x, bf.cam_y);
            end
        end
    end

	if (flickering_light == true) then
		setProperty('light.visible', getRandomBool(80));
	else
		setProperty('light.visible', true);
	end

	if (getProperty('corpse-jumpscare.visible') == true) then
		setProperty('camFollowPos.x', (px - 100));
		setProperty('camFollowPos.y', py);
	end
end

function onStepHit()
	if (curStep == 64) then
		oogaBooga(1);
	elseif (curStep == 65) then
		oogaBooga(2);
	elseif (curStep == 768) then
		doTweenZoom('da-zoom-2', 'camGame', .9, 23, 'sineInOut');
		doTweenAlpha('hud-alpha-0.8', 'camHUD', .8, 3, 'sineInOut');
    elseif (curStep == 896) then
		setProperty('camGame.visible', false);
		doTweenAlpha('hud-alpha-0', 'camHUD', 0, 3, 'sineOut');
	elseif (curStep == 908) then
		setProperty('camZooming', false);
	end
end

function oogaBooga(idfk)
	if (idfk == 1) then
		bf.cam_x = 450;
		bf.cam_y = 600;
		dad.cam_x = 350;
		dad.cam_y = bf.cam_y;
		followChar = true;
		setProperty('corpse-jumpscare.visible', true);
		setProperty('camGame.visible', false);
		setProperty('camHUD.visible', false);

	elseif (idfk == 2) then
		removeLuaSprite('corpse-jumpscare', true);
		setProperty('dad.visible', true);
		setProperty('camGame.visible', true);
		setProperty('camHUD.visible', true);
    end
end

function onTimerCompleted(tag)
	if (tag == 'flickering-light-end') then
		flickering_light = false;
	end
end

function onTweenCompleted(tag)
	if (tag == 'da-zoom-0') then
		doTweenZoom('da-zoom-1', 'camGame', 0.9, (crochet / 120), 'sineInOut');
	elseif (tag == 'corpse-jumpscare-alpha-0') then
		removeLuaSprite('corpse-jumpscare', true);
	end
end