package objects.sprites;

import objects.containers.Player;

class IsaacSprite extends FlxSpriteContainer
{

    public var owner:Player;
    public var head: FlxSprite;
	public var body: FlxSprite;
    var _headYOffset: Float = 1;
	var _bodyYOffset: Float = 5;

    public function new(?x: Float, ?y: Float, ?maxSize: Int = 0)
    {
        super(x, y, maxSize);

        buildBodySprite();
        buildHeadSprite();
    }

    override function update(elapsed: Float)
    {
        super.update(elapsed);
        if (owner == null) return;
        body.offset.y = body.height / 2 + owner.depthOffset + _bodyYOffset;
        head.offset.y = head.height / 2 + body.offset.y + _headYOffset;
    }

    function buildHeadSprite()
        {
            head = new FlxSprite();
            head.loadGraphic(AssetPaths.isaac_head__png, true, 32, 32);
    
            head.animation.add("left", [1]);
            head.animation.add("down", [0]);
            head.animation.add("up", [2]);
            head.animation.add("right", [3]);
    
            head.setSize(16,16);
            head.centerOffsets();
    
            head.solid = false;
    
            add(head);
        }
    
    
        function buildBodySprite()
        {
            body = new FlxSprite();
    
            body.loadGraphic(AssetPaths.isaac_body__png, true, 32, 32);
    
            body.animation.add("idle", [10]);
    
            body.animation.add("walk_horizontal", [for(i in 0...10) i]);
            body.animation.add("walk_vertical", [for(i in 10...20) i]);
    
            body.animation.timeScale = .5;
    
            body.setSize(16,16);
            body.centerOffsets();
            
            body.solid = false;
            
            add(body);
        }
}