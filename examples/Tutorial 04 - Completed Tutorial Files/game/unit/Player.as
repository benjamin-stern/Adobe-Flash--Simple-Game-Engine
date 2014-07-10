package game.unit 
{
	import engine.GameObject;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import game.environment.Single;
	import game.environment.Wall;
	import game.interactable.Coin;
	import utils.Key;
	
	/**
	 * ...
	 * @author bnns
	 */
	public final class Player extends GameObject 
	{
		private var gravity:Number = 1;
		private var jump:Number = -15;
		private var speed:Number = 5;
		
		private var hasJumped:Boolean = false;
		
		private var velocity:Point = new Point();
		
		public function Player() 
		{
			super();
			
		}
		
		override public function update():void 
		{
			velocity.x = 0;
			if (Key.isKeyPressed(Keyboard.A))
			{
				velocity.x += -speed;
			}
			if (Key.isKeyPressed(Keyboard.D))
			{
				velocity.x += speed;
			}
			
			if (Key.isKeyDown(Keyboard.W) && !hasJumped)
			{
				velocity.y = jump;
				hasJumped = true;
			}
			
			
			var $isInSingle:Boolean = collide([Single])!=null;
			
			var $coin:GameObject = collide([Coin]);
			if ($coin)
			{
				$coin.destroy();
			}
			
			velocity.y += gravity;
			
			var $moveCollision:Array = [Wall];
			
			if (velocity.y > 0 && !$isInSingle)
				$moveCollision.push(Single);
			
			moveBy(velocity.x, velocity.y, $moveCollision);
			
			//x += velocity.x;
			//y += velocity.y;
			
		}
		
		override public function onCollideY($collision:GameObject):void 
		{
			if (velocity.y > 0)
			{
				hasJumped = false;
			}
			
			velocity.y = 0;
		}
	}

}