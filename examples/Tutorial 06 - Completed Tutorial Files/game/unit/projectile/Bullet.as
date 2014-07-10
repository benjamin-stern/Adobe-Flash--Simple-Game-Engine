package game.unit.projectile 
{
	import engine.GameObject;
	import flash.display.MovieClip;
	import flash.geom.Point;
	import game.unit.enemy.EnemyBase;
	/**
	 * ...
	 * @author bnns
	 */
	public class Bullet extends GameObject
	{
		private var _image:MovieClip;
		private var _velocity:Point;
		private var _distance:Number;
		
		public function Bullet($image:Class,$angle:Number,$speed:Number,$distance:Number) 
		{
			_image = new $image;
			addChild(_image);
			//_velocity.x = Math.cos($angle)*$speed;
			//_velocity.y = Math.sin($angle) * $speed;
			_velocity = Point.polar($speed, $angle);
			_distance = isNaN($distance)?0:$distance;
			
		}
		
		override public function update():void 
		{
			x += _velocity.x;
			y += _velocity.y;
			
			_distance -= _velocity.length;
			
			var collision:GameObject;
			if ((collision = collide([EnemyBase, Bullet])))
			{
				if (collision is EnemyBase)
				{
					collision.destroy();
				}
				
				destroy();
			}
			//trace("_distance: "+_distance);
			if (_distance <= 0)
			{
				destroy();
			}
		}
		
	}

}