package;

import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.FlxG;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState {

    var map = new FlxTilemap();
    var bricks = new FlxGroup();
    var columns: Int;
    var timeSinceLastBrick = 0.0;
    var brickFrequency = 0.2;
    var gameOver = false;

    override public function create(): Void {
        super.create();

        var tiledMap = new TiledMap(AssetPaths.map__tmx);
        var mainLayer: TiledTileLayer = cast tiledMap.getLayer("main");
        var bgLayer: TiledTileLayer = cast tiledMap.getLayer("bg");
        var bg = new FlxTilemap();

        bg.loadMapFromArray(bgLayer.tileArray, tiledMap.width, tiledMap.height, AssetPaths.tiles__png, 16, 16, 1);
        map.loadMapFromArray(mainLayer.tileArray, tiledMap.width, tiledMap.height, AssetPaths.tiles__png, 16, 16, 1);
        columns = Math.floor(map.width / 16.0);

        add(bg);
        add(map);
        add(bricks);
    }

    override public function update(elapsed: Float): Void {
        if (gameOver) {
            FlxG.switchState(new GameOverState());
            return;
        }

        super.update(elapsed);

        addBrickIfNeeded(elapsed);

        FlxG.collide(map, bricks, function(_, brick: Brick) {
            brick.immovable = true;
        });
        FlxG.collide(bricks, bricks, function(b1: Brick ,b2: Brick) {
            b1.immovable = true;
            b2.immovable = true;

            if (b1.y <= 0 || b2.y <= 0) {
                gameOver = true;
            }
        });
    }


    private function addBrickIfNeeded(elapsed: Float): Void {
        timeSinceLastBrick += elapsed;

        if (timeSinceLastBrick > brickFrequency) {
            var x = randomInt(columns) * 16;

            bricks.add(new Brick(x, 0, Color.random()));
            timeSinceLastBrick = 0.0;
        }
    }

    private function randomInt(max: Int): Int {
        return Math.floor(Math.random() * max);
    }
}
