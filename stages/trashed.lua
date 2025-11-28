
local trsh_assets_dir = ('stages/trashed/');

function onCreate()
	if curStage == 'trashed' then
		makeLuaSprite('sky', trsh_assets_dir..'sky', -2600, -2100);
		scaleObject('sky', 1, 1);
	
		makeLuaSprite('bg', trsh_assets_dir..'bg', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('bg', getProperty('sky.scale.x'), getProperty('sky.scale.y'));
	
		makeLuaSprite('tv-screen', trsh_assets_dir..'tv-screen', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('tv-screen', getProperty('sky.scale.x'), getProperty('sky.scale.y'));

		makeLuaSprite('tv-border', trsh_assets_dir..'tv-border', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('tv-border', getProperty('sky.scale.x'), getProperty('sky.scale.y'));

		makeLuaSprite('wall-left', trsh_assets_dir..'wall-left', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('wall-left', getProperty('sky.scale.x'), getProperty('sky.scale.y'));

		makeLuaSprite('wall-right', trsh_assets_dir..'wall-right', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('wall-right', getProperty('sky.scale.x'), getProperty('sky.scale.y'));

		makeLuaSprite('lamp-poles', trsh_assets_dir..'lamp-poles', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('lamp-poles', getProperty('sky.scale.x'), getProperty('sky.scale.y'));

		addLuaSprite('sky');
		addLuaSprite('bg');
		addLuaSprite('tv-screen');
		addLuaSprite('tv-border');
		addLuaSprite('wall-right');
		addLuaSprite('wall-left');
		addLuaSprite('lamp-poles');
	end
	close(true);
end