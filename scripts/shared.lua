--[[ Script made by Heavy Bruh :D ]]

local countdown = 4;

function onUpdate()
    r = getProperty('dad.healthColorArray[0]');
    g = getProperty('dad.healthColorArray[1]');
    b = getProperty('dad.healthColorArray[2]');
    color = (r * 0x10000) + (g * 0x100) + b;
    setProperty('timeBar.color', color);

    if (botPlay) then
        setTextString('scoreTxt', "BOTPLAY");
        setTextString('botplayTxt', nil);
    end
end

function onCreate()
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0);

    makeLuaSprite('black', nil, nil, nil);
	makeGraphic('black',  screenWidth, screenHeight, '000000');
	setObjectCamera('black', 'other');
    addLuaSprite('black', true);

    makeLuaText('countdownTxt', countdown, nil, nil, 300);
    setTextSize('countdownTxt', 150);
    setObjectCamera('countdownTxt', 'other');
    setProperty('countdownTxt.alpha', 0);
    addLuaText('countdownTxt', true)  ;
end

function onStartSong()
	setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 1);
end

function onCountdownTick(counter)
    for i = 0, 2 do
        if (counter == i) then
            countdown = (countdown - 1);
            setProperty('countdownTxt.alpha', 1);
            doTweenAlpha('countdownTxt-alpha', 'countdownTxt', 0, (crochet/1000), 'cubicOut');
            setTextString('countdownTxt', countdown);
            screenCenter('countdownTxt', 'x');
        end
	end

    if (counter == 3) then
        setProperty('countdownTxt.alpha', 1);
        doTweenAlpha('countdownTxt-alpha', 'countdownTxt', 0, (crochet/1000), 'cubicOut');
        setTextString('countdownTxt', "Go!");
        screenCenter('countdownTxt', 'x');
    end
end


function onCreatePost()
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-dia');
	setProperty('healthBarBG.color', getColorFromHex('000000'));
end    

function onSongStart()
    removeLuaText('countdownTxt', true)
end