
local idlePLay = true;

function onCreate()
	if (curStage == 'final-showdown') then
		scale = 1.3;

        makeAnimatedLuaSprite('monsta', 'characters/monster/monsta', 150, 800);
        addAnimationByPrefix('monsta', 'monsta-idle', 'idle', 24, true);
        addAnimationByPrefix('monsta', 'monsta-attack', 'attack', 24, true);
		scaleObject('monsta', scale, scale);
		setObjectOrder('monsta', getObjectOrder('bg-2')+1);
		addLuaSprite('monsta', false);
	end
end

function onBeatHit()
	if (curStage == 'final-showdown') then
		if (curBeat % 2 == 0) then
            if (idlePLay == true) then
                playAnim('monsta', 'monsta-idle', true, false, 0);
            end
        end
	end
end