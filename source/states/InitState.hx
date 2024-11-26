package states;

class InitState extends FlxState
{
	override public function create()
	{
		super.create();

		add(new FlxText(10, 10, 0, "Init"));

		FlxG.switchState(new MainMenuState());
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
