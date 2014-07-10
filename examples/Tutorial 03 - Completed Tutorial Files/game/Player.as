package game 
{
	import engine.GameObject;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import utils.Key;
	
	/**
	 * ...
	 * @author bnns
	 */
	public final class Player extends GameObject 
	{
		
		private var speed:Number = 5;
		private var velocity:Point = new Point();
		
		public function Player() 
		{
			super();
			
		}
		
		override public function update():void 
		{
			velocity.x = velocity.y = 0;
			if (Key.isKeyPressed(Keyboard.A))
			{
				velocity.x += -speed;
			}
			if (Key.isKeyPressed(Keyboard.D))
			{
				velocity.x += speed;
			}
			
			if (Key.isKeyPressed(Keyboard.W))
			{
				velocity.y += -speed;
			}
			if (Key.isKeyPressed(Keyboard.S))
			{
				velocity.y += speed;
			}
			
			velocity.normalize(speed);
			
			var $coin:GameObject = collide([Coin,Player]);
			if ($coin)
			{
				$coin.destroy();
			}
			
			moveBy(velocity.x, velocity.y, [Wall]);
			
			//x += velocity.x;
			//y += velocity.y;
			
		}
		
	}

}