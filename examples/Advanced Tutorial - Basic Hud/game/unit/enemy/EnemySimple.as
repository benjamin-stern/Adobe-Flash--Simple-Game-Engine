package game.unit.enemy 
{
	import engine.GameObject;
	import flash.geom.Point;
	import game.environment.Single;
	import game.environment.Wall;
	/**
	 * ...
	 * @author bnns
	 */
	public final class EnemySimple extends EnemyBase 
	{
		private var speed:Number = 1;
		
		private var velocity:Point = new Point(speed);
		
		public function EnemySimple() 
		{
			super();
			
		}
		
		override public function update():void 
		{
			
			var $collideTypes:Array = [Single, Wall];
			var $dir:Number = velocity.x > 0?1: -1;
			
			if (collideAt(x+(width*$dir),y+3,$collideTypes)==null)
			{
				velocity.x *= -1;
			}
			
			//x += velocity.x;
			
			moveBy(velocity.x, 0, $collideTypes);
		}
		
		override public function onCollideX($collision:GameObject):void 
		{
			velocity.x *= -1;
		}
	}

}