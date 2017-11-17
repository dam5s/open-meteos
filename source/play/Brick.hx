package play;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Brick extends FlxSprite {

    private static inline var GRAVITY = 150;
    private static inline var FALLING_SPEED = 100;

    public function new(x: Float, y: Float, color: FlxColor) {
        super(x, y);

        makeGraphic(16, 16, color);
        setSize(16, 16);

        acceleration.y = 0;
        velocity.y = GRAVITY;
        maxVelocity.set(0, FALLING_SPEED);
    }
}
