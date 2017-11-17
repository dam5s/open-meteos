package gameover;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class GameOverState extends FlxState {

    var text = new FlxText();

    override public function create(): Void {
        set_bgColor(FlxColor.GRAY);

        text.text = "GAME\nOVER";
        text.color = FlxColor.WHITE;
        text.borderStyle = FlxTextBorderStyle.OUTLINE;
        text.borderColor = FlxColor.PURPLE;
        text.alignment = FlxTextAlign.CENTER;
        text.setGraphicSize(
            Math.floor(text.width * 3),
            Math.floor(text.height * 3)
        );
        text.setPosition(FlxG.width / 2 - text.width / 2, FlxG.height / 2 - text.height / 2);

        add(text);
    }
}
