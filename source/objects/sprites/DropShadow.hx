package objects.sprites;

class DropShadow extends FlxSprite
{
    public function new(x: Float = 0, y: Float = 0)
    {
        super(x+4, y+4);
        loadGraphic(AssetPaths.entity_shadow__png);
        setSize(8,8);
        centerOffsets();
        solid = false;
    }
}