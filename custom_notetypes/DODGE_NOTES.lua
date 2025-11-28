local damage_amt = 0.2

function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if (getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'DODGE_NOTES') then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'events/notes/Bullet_Note-dia');
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if (noteType == 'DODGE_NOTES') then
		cameraShake('hud', .005, .3)
		cameraShake('game', .005, .3)
		playAnim('dad', 'Shoot', true, false, 0);
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if (noteType == 'DODGE_NOTES') then
	    setProperty('health', (getProperty('health')-damage_amt));
	end
end