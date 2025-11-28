--[[ Script made by Heavy Bruh :D ]]

local inanim_assets_dir = ('stages/inanimate/')

function onCreate()
	if curStage == 'inanimate' then
		makeLuaSprite('city-bg', inanim_assets_dir..'city-bg');
		screenCenter('city-bg', 'xy')
		scaleObject('city-bg', .9, .9)
		addLuaSprite('city-bg');
	
		makeLuaSprite('city', inanim_assets_dir..'city');
		screenCenter('city', 'xy')
		scaleObject('city', getProperty('city-bg.scale.x'), getProperty('city-bg.scale.y'));
		addLuaSprite('city');
	
		makeLuaSprite('alley', inanim_assets_dir..'alley');
		screenCenter('alley', 'xy')
		scaleObject('alley', getProperty('city-bg.scale.x'), getProperty('city-bg.scale.y'));
		addLuaSprite('alley');
	
		makeLuaSprite('lamppost', inanim_assets_dir..'lamppost');
		screenCenter('lamppost', 'xy')
		scaleObject('lamppost', getProperty('city-bg.scale.x'), getProperty('city-bg.scale.y'));
		addLuaSprite('lamppost');

		makeLuaSprite('light', inanim_assets_dir..'light');
		screenCenter('light', 'xy')
		scaleObject('light', getProperty('city-bg.scale.x'), getProperty('city-bg.scale.y'));
		setBlendMode('light', 'add')
		addLuaSprite('light', true);

		makeLuaSprite('gradient', inanim_assets_dir..'gradient');
		screenCenter('gradient', 'xy')
		scaleObject('gradient', getProperty('city-bg.scale.x'), getProperty('city-bg.scale.y'));
		addLuaSprite('gradient', true);
	end
	close(true);
end