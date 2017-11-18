package play;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Brick extends FlxSprite {

    public static inline var SIZE = 16;
    private static inline var GRAVITY = 150;
    private static inline var FALLING_SPEED = 100;

    public var brickColor(default, null): FlxColor;

    public function new(x: Float, y: Float, color: FlxColor) {
        super(x, y);

        brickColor = color;
        acceleration.y = 0;
        velocity.y = GRAVITY;
        maxVelocity.set(0, FALLING_SPEED);

        makeGraphic(SIZE, SIZE, color);
        setSize(SIZE, SIZE);
    }
}
