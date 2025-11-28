
local final_assets_dir = ('stages/final-showdown/');

function onCreate()
	if curStage == 'final-showdown' then
		scale = 1

		makeLuaSprite('sky', final_assets_dir..'sky', nil, nil);
		scaleObject('sky', scale, scale);
		screenCenter('sky', 'xy');
		setObjectOrder('sky', 1);
	
		makeLuaSprite('bg-2', final_assets_dir..'bg-2', (getProperty('sky.x')+60), (getProperty('sky.y')-60));
		scaleObject('bg-2', getProperty('sky.scale.x'), getProperty('sky.scale.y'));
		setScrollFactor('bg-2', .4, .4)
		setObjectOrder('bg-2', getObjectOrder('sky')+1);

		makeLuaSprite('bg-1', final_assets_dir..'bg-1', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('bg-1', getProperty('sky.scale.x'), getProperty('sky.scale.y'));
		setObjectOrder('bg-1', getObjectOrder('bg-2')+1);

		makeLuaSprite('warning', final_assets_dir..'warning', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('warning', getProperty('sky.scale.x'), getProperty('sky.scale.y'));
		setObjectOrder('warning', getObjectOrder('bg-1')+1);

		makeLuaSprite('wall', final_assets_dir..'wall', getProperty('sky.x'), getProperty('sky.y'));
		scaleObject('wall', getProperty('sky.scale.x'), getProperty('sky.scale.y'));
	
		addLuaSprite('sky', false);
		addLuaSprite('bg-2', false);
		addLuaSprite('bg-1', false);
		addLuaSprite('warning', false);
		addLuaSprite('wall', true);
	end
	close(true);
end