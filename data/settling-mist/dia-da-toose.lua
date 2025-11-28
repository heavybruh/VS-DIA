
local char_assets_dir = "characters/Dia"

function onCreate()
    makeAnimatedLuaSprite('dia-monitor', char_assets_dir, -200, -442)
    setObjectOrder('dia-monitor', getObjectOrder('dadGroup'))
    setProperty('dia-monitor.flipX', true)
    scaleObject('dia-monitor', .12, .12)

    addAnimationByPrefix('dia-monitor', 'idle', 'Dia idle', 15, false)
    addAnimationByPrefix('dia-monitor', 'singLEFT', 'Dia left', 24, false)
    addAnimationByPrefix('dia-monitor', 'singDOWN', 'Dia right', 24, false)
    addAnimationByPrefix('dia-monitor', 'singUP', 'Dia up', 24, false)
    addAnimationByPrefix('dia-monitor', 'singRIGHT', 'Dia down', 24, false)

    addOffset('dia-monitor', 'idle', 0, 0)
    addOffset('dia-monitor', 'singLEFT', 16, -1)
    addOffset('dia-monitor', 'singDOWN', -3, 8)
    addOffset('dia-monitor', 'singUP', -3, -3)
    addOffset('dia-monitor', 'singRIGHT', -2, 8)
    
    addLuaSprite('dia-monitor', false)
end

function onUpdate(elapsed)
	setProperty('dia-monitor.visible', getProperty('dad.visible'))
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if noteType == '' then
        if direction == 0 then
            playAnim('dia-monitor', 'singLEFT', true)
            runTimer('idledad',0.35)
        end
        if direction == 1 then
            playAnim('dia-monitor', 'singDOWN', true)
            runTimer('idledad',0.35)
        end
        if direction == 2 then
            playAnim('dia-monitor', 'singUP', true)
            runTimer('idledad',0.35)
        end
        if direction == 3 then
            playAnim('dia-monitor', 'singRIGHT', true)
            runTimer('idledad',0.35)
        end
    end
end

function onBeatHit()
    if curBeat %2 == 0 then
        if getProperty("dad.animation.curAnim.name") == 'idle' then
            characterPlayAnim('dad','idle',false)
            playAnim('dia-monitor', 'idle', false)
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'idledad' then
        characterPlayAnim('dad','idle',false)
        playAnim('dia-monitor', 'idle', false)
	end
end