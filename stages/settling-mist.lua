
local sm1_assets_dir = ('stages/settling-mist/')
local sm2_assets_dir = ('stages/settling-mist-2/')

function onCreate()
	if curStage == 'settling-mist' then
		--BG 1
		makeLuaSprite('bg-alley', sm1_assets_dir..'bg-alley', -700, -500);
		scaleObject('bg-alley', .35, .35)
	
		makeLuaSprite('street-light_1', sm1_assets_dir..'street-light_1', getProperty('bg-alley.x'), getProperty('bg-alley.y'));
		scaleObject('street-light_1', getProperty('bg-alley.scale.x'), getProperty('bg-alley.scale.y'));

		makeLuaSprite('street-light', sm1_assets_dir..'street-light', getProperty('bg-alley.x'), getProperty('bg-alley.y'));
		scaleObject('street-light', getProperty('bg-alley.scale.x'), getProperty('bg-alley.scale.y'));

		makeLuaSprite('street-light_2', sm1_assets_dir..'street-light_2', getProperty('bg-alley.x'), getProperty('bg-alley.y'));
		scaleObject('street-light_2', getProperty('bg-alley.scale.x'), getProperty('bg-alley.scale.y'));

		addLuaSprite('bg-alley', false);
		addLuaSprite('street-light_1', false);
		addLuaSprite('street-light_2', false);
		addLuaSprite('street-light', false);

		--BG 2
		makeLuaSprite('bg-light', sm2_assets_dir..'bg-light', -1000, -800);
		scaleObject('bg-light', .6, .6)
		setProperty('bg-light.visible', false)

		makeLuaSprite('city-bg', sm2_assets_dir..'city-bg', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('city-bg', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setProperty('city-bg.visible', false)

		makeLuaSprite('tower', sm2_assets_dir..'tower', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('tower', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setProperty('tower.visible', false)

		makeLuaSprite('fence', sm2_assets_dir..'fence', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('fence', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setProperty('fence.visible', false)
		
		makeLuaSprite('bg-alley-2', sm2_assets_dir..'bg-alley', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('bg-alley-2', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setProperty('bg-alley-2.visible', false)

		makeLuaSprite('bg-alley-2-border', sm2_assets_dir..'bg-alley-border', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('bg-alley-2-border', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('bg-alley-2-border', getObjectOrder('dadGroup')+1)
		setProperty('bg-alley-2-border.visible', false)

		makeLuaSprite('monitors', sm2_assets_dir..'monitors', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('monitors', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('monitors', getObjectOrder('bg-alley-2-border')+1)
		setProperty('monitors.visible', false)

		makeLuaSprite('monitors-2', sm2_assets_dir..'monitors-2', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('monitors-2', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('monitors-2', getObjectOrder('bg-alley-2-border')+1)
		setProperty('monitors-2.visible', false)

		addLuaSprite('bg-light', false);
		addLuaSprite('city-bg', false);
		addLuaSprite('tower', false);
		addLuaSprite('fence', false);
		addLuaSprite('bg-alley-2', false);
		addLuaSprite('bg-alley-2-border', false);
		addLuaSprite('monitors-2', false);
		addLuaSprite('monitors', false);
	end
end

function onUpdatePost()
	--BG Change
	if songName == 'Settling-Mist' then
		if curStep >= 382 then
			setProperty('bg-alley.visible', false)
			setProperty('street-light_1.visible', false)
			setProperty('street-light.visible', false)
			setProperty('street-light_2.visible', false)

			setProperty('bg-light.visible', true)
			setProperty('city-bg.visible', true)
			setProperty('tower.visible', true)
			setProperty('fence.visible', true)
			setProperty('bg-alley-2.visible', true)
			setProperty('bg-alley-2-border.visible', true)
			setProperty('monitors.visible', true)
			setProperty('monitors-2.visible', true)
		end
	end
end