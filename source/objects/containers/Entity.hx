package objects.containers;

import flixel.FlxG;
import flixel.util.FlxColor;
import objects.sprites.DropShadow;

class Entity extends FlxSpriteContainer
{

    public var hitbox: FlxSprite;
    public var depthOffset: Float = 0;
	var shadow: FlxSprite;

	public function new(?x: Float, ?y: Float, ?maxSize: Int = 0)
	{
		super(x, y, maxSize);

        solid = false;

        hitbox = new FlxSprite();
        hitbox.makeGraphic(10,6,FlxColor.RED);
        hitbox.centerOffsets();
        hitbox.x += 3;
        hitbox.y += 4;
        add(hitbox);

		shadow = new DropShadow();
		add(shadow);

        Globals.entities.add(this);
    }
}