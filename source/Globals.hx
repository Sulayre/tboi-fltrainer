import flixel.FlxBasic;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.input.keyboard.FlxKey;
import flixel.util.FlxDirection;
import objects.containers.Entity;
import objects.containers.Player;

enum PlayerState {
	ACTIVE;
	BLINDFOLD;
	INACTIVE;
}

enum GroupsEnum {
    Entity;
    GridEntity;
}

enum KeybindEnum {
    MOVE(dir:FlxDirection);
    FIRE(dir:FlxDirection);
}

class Globals {

    public static var player: Null<Player> = null;

    public static var entities = new FlxTypedGroup<Entity>();
    //public static var Entities = new FlxTypedGroup<Entity>;

    public static var keybinds: Map<KeybindEnum, Array<FlxKey>> = [

        MOVE(UP)       => ["W"],
        MOVE(LEFT)     => ["A"],
        MOVE(DOWN)     => ["S"],
        MOVE(RIGHT)    => ["D"],

        FIRE(UP)       => ["UP"],
        FIRE(LEFT)     => ["LEFT"],
        FIRE(DOWN)     => ["DOWN"],
        FIRE(RIGHT)    => ["RIGHT"],

    ];
}