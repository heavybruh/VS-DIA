local gameOver = 0;
local tag = "GRAAAAAAH IM GETTING REAL MAD GRRRRRRRR";

function onGameOver()
	gameOver = 1
	return Function_Continue;
end

function onUpdate()	
	if gameOver == 1 then
		if boyfriendName == "gf-dia" then
			makeLuaSprite(tag, 'nil', 0, 0);
			makeGraphic(tag, 1280, 120, '000000')
			scaleObject(tag, 6.0, 6.0);
			setObjectCamera(tag, 'other');
			setObjectOrder(tag, 1)
			addLuaSprite(tag, true);
		end
	end
end