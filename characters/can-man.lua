function onCreate()	
	if boyfriendName == "can-man" then
		addCharacterToList('can-man-dead', 'boyfriend');
		setPropertyFromClass('GameOverSubstate', 'characterName', 'can-man-dead')
	end
end