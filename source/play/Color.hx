package play;

import flixel.util.FlxColor;

class Color {

    private static var allColors = [
        FlxColor.GREEN,
        FlxColor.YELLOW,
        FlxColor.BLUE,
        FlxColor.RED,
        FlxColor.PURPLE,
        FlxColor.CYAN
    ];

    public static function random(): FlxColor {
        return allColors[randomInt(allColors.length)];
    }


    private static function randomInt(max: Int): Int {
        return Math.floor(Math.random() * max);
    }
}
