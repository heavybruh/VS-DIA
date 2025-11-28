
local sm2_assets_dir = ('stages/settling-mist-2/')

function onCreate()
	if curStage == 'contribution' then
		makeLuaSprite('bg-light', sm2_assets_dir..'bg-light', -1000, -800);
		scaleObject('bg-light', .6, .6)
	
		makeLuaSprite('city-bg', sm2_assets_dir..'city-bg', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('city-bg', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
	
		makeLuaSprite('tower', sm2_assets_dir..'tower', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('tower', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
	
		makeLuaSprite('fence', sm2_assets_dir..'fence', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('fence', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		
		makeLuaSprite('bg-alley-2', sm2_assets_dir..'bg-alley', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('bg-alley-2', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
	
		makeLuaSprite('bg-alley-2-border', sm2_assets_dir..'bg-alley-border', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('bg-alley-2-border', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('bg-alley-2-border', getObjectOrder('dadGroup')+1)
	
		makeLuaSprite('monitors', sm2_assets_dir..'monitors', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('monitors', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('monitors', getObjectOrder('bg-alley-2-border')+1)
	
		makeLuaSprite('monitors-2', sm2_assets_dir..'monitors-2', getProperty('bg-light.x'), getProperty('bg-light.y'));
		scaleObject('monitors-2', getProperty('bg-light.scale.x'), getProperty('bg-light.scale.y'));
		setObjectOrder('monitors-2', getObjectOrder('bg-alley-2-border')+1)
	
		addLuaSprite('bg-light', false);
		addLuaSprite('city-bg', false);
		addLuaSprite('tower', false);
		addLuaSprite('fence', false);
		addLuaSprite('bg-alley-2', false);
		addLuaSprite('bg-alley-2-border', false);
		addLuaSprite('monitors-2', false);
		addLuaSprite('monitors', false);
	
		setObjectOrder('gfGroup', getObjectOrder('monitors')+1)
		setObjectOrder('boyfriendGroup', getObjectOrder('gfGroup')+1)
	end
	close(true);
end