package play;

class BricksGrid {

    private static inline var CELL_SIZE = Brick.SIZE;
    private var bricks = new Array<Brick>();

    public function new() {}

    public function add(brick: Brick) {
        bricks.push(brick);
    }

    public function findBrickAt(x: Float, y: Float): Brick {

        for (brick in bricks) {
            var matchesColumn = (brick.x <= x && brick.x + CELL_SIZE >= x);
            var matchesRow = (brick.y <= y && brick.y + CELL_SIZE >= y);

            if (matchesColumn && matchesRow) {
                return brick;
            }
        }

        return null;
    }
}
