package play;


import flixel.FlxG;
import flixel.FlxSprite;

class DraggedBrick extends FlxSprite {

    private static inline var SIZE = Brick.SIZE;
    private var brick: Brick;
    private var mouseStartX: Float;
    private var mouseStartY: Float;

    public function new(brick: Brick) {
        super();

        this.brick = brick;

        this.mouseStartX = FlxG.mouse.x;
        this.mouseStartY = FlxG.mouse.y;

        this.x = brick.x;
        this.y = brick.y;


        makeGraphic(SIZE, SIZE, brick.brickColor);
        setSize(SIZE, SIZE);
        brick.visible = false;
    }

    override public function update(elapsed: Float): Void {
        var mouseX = FlxG.mouse.x;
        var mouseY = FlxG.mouse.y;

        this.x = brick.x + (mouseX - mouseStartX);
    }

    override public function kill(): Void {
        brick.visible = true;
    }
}
