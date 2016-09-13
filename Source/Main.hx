package;

import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Shape;
import openfl.display.Sprite;
import openfl.geom.ColorTransform;

class Main extends Sprite {
	public function new () {
		super ();

		var rectangle = new Sprite();

		var shape = new Shape();
		shape.graphics.beginFill(0xBADA55, 0.5);
		shape.graphics.drawRect(0, 0, 75, 75);
		shape.graphics.endFill();
		shape.graphics.beginFill(0xFF0000, 0.5);
		shape.graphics.drawRect(25, 25, 75, 75);
		shape.graphics.endFill();

		shape.x = -50;
		shape.y = -50;
		rectangle.addChild(shape);

		rectangle.x = 100;
		rectangle.y = 20;
		rectangle.rotation = 45;

		addChild(rectangle);

		var bounds = rectangle.getBounds(this);
		var bd = new BitmapData(Math.ceil(bounds.width), Math.ceil(bounds.height), true, 0);
		var matrix = rectangle.transform.concatenatedMatrix;
		matrix.translate(-bounds.left, -bounds.top);
		bd.draw(rectangle, matrix, new ColorTransform(0, 0, 1, 1, 0, 0, 255, 20));

		var copy = new Bitmap(bd);
		copy.x = 300;
		addChild(copy);
	}
}	