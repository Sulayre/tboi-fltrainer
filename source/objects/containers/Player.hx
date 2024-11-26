package objects.containers;

import flixel.FlxG;
import objects.sprites.IsaacSprite;

class Player extends Entity
{
	static inline var SPEED: Float = 80;
	static inline var DRAG: Float = 800;
	
	var isaacSprite: IsaacSprite;

	public function new(?x: Float, ?y: Float, ?maxSize: Int = 0)
	{
		super(x, y, maxSize);

		isaacSprite = new IsaacSprite();
		isaacSprite.owner = this;
		add(isaacSprite);

		solid = false;

		drag.x = drag.y = DRAG;
	}


	override function update(elapsed: Float)
	{
		super.update(elapsed);
		_updateMovement(elapsed * 60.);
		_updateFire(elapsed * 60.);
	}


	private function _updateMovement(delta: Float)
	{
		var keybindUp 		= Globals.keybinds.get(KeybindEnum.MOVE(UP));
		var keybindLeft		= Globals.keybinds.get(KeybindEnum.MOVE(LEFT));
		var keybindDown 	= Globals.keybinds.get(KeybindEnum.MOVE(DOWN));
		var keybindRight 	= Globals.keybinds.get(KeybindEnum.MOVE(RIGHT));

		var y_axis = FlxG.keys.anyPressed(keybindUp)	? -1 : FlxG.keys.anyPressed(keybindDown)	? 1 : 0;
		var x_axis = FlxG.keys.anyPressed(keybindLeft)	? -1 : FlxG.keys.anyPressed(keybindRight)	? 1 : 0;
		
		var is_moving_horizontally: Bool = x_axis != 0;
		var is_moving_vertically: Bool = y_axis != 0;

		var is_moving: Bool = is_moving_horizontally || is_moving_vertically;

		if (is_moving)
		{
			velocity.x = velocity.y = 0;

			if (is_moving_horizontally)
			{
				velocity.x = x_axis;

				isaacSprite.head.animation.play(velocity.x < 0 ? "left" : "right");
				isaacSprite.body.animation.play("walk_horizontal");

				isaacSprite.body.flipX = velocity.x < 0;
			} 

			if (is_moving_vertically)
			{
				velocity.y = y_axis;

				if (!is_moving_horizontally)
				{
					isaacSprite.head.animation.play(velocity.y < 0 ? "up" : "down");
					isaacSprite.body.animation.play("walk_vertical", false, velocity.y < 0);

					isaacSprite.body.flipX = false;
				}
			}

			velocity = velocity.normalize() * SPEED * delta;	
		}
		else {
			isaacSprite.head.animation.play("down");
			isaacSprite.body.animation.play("idle");
		}
	}


	private function _updateFire(delta: Float)
	{
		
	}
}