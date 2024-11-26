package states;

import flixel.addons.display.shapes.FlxShapeGrid;
import flixel.util.FlxSort;
import objects.containers.Player;

class PlayState extends FlxState
{
    var player: Player;
    
	override public function create()
	{
		super.create();
		
		setupCamera();

		var grid = new FlxShapeGrid
		(
			0,0,
			16,16,
			13,7,
			{	
				thickness: 1,
            	color: 0xFF68AEd4
			},
			0x00FFFFFF,
		);
		
		add(grid);

        player = new Player(20, 20);
        add(player);

		Globals.player = player;

		FlxG.camera.follow(player, TOPDOWN, 1);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
		Globals.entities.sort(FlxSort.byY);
	}

	function setupCamera()
	{
		FlxG.camera.zoom = 2;
		FlxG.camera.bgColor = 0xFF234975;
	}
}