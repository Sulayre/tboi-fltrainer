package states;

import flixel.ui.FlxButton;

class MainMenuState extends FlxState
{
	var playButton:FlxButton;

	override public function create()
	{
		super.create();

		add(new FlxText(10, 10, 0, "Main Menu"));

		playButton = new FlxButton(0, 0, "Play", clickPlay);
		playButton.screenCenter();
		add(playButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	function clickPlay()
	{
		FlxG.switchState(new PlayState());
	}
}
