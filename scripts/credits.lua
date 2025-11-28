--[[ Script made by Heavy Bruh :D ]]

function onCreate()
	precacheImage('events/cards/card-' .. string.lower(songName));

	makeLuaSprite('card', 'events/cards/card-' .. string.lower(songName), -500, nil);
	scaleObject('card', 0.2, 0.2);
	setObjectCamera('card', 'other');
	setProperty('card.alpha', 0);
    addLuaSprite('card', true);
end

function onCreatePost()
	setObjectOrder('card', getObjectOrder('black'));
end

function onSongStart()
	doTweenX('card-x', 'card', 0, (crochet / 300), 'quintInOut');
	doTweenAlpha('card-alpha-1', 'card', 1, (crochet / 300), 'quintInOut');
	runTimer('bye-bye', (crochet / 150));
end

function onTimerCompleted(tag)
    if (tag == 'bye-bye') then
        doTweenX('card-x-bye', 'card', -500, (crochet / 300), 'quintInOut');
		doTweenAlpha('card-alpha-0', 'card', 0, (crochet / 300), 'quintInOut');
    end
end

function onTweenCompleted(tag)
	if (tag == 'card-x-bye') then
        removeLuaSprite('card', true);
    end
end