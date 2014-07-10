package game.unit.projectile 
{
	/**
	 * ...
	 * @author bnns
	 */
	public final class BulletType 
	{
		private var _speed:Number;
		private var _distance:Number;
		//private var _pierce:int;
		
		//private var _spread:Number;
		//private var _amount:int;
		
		private var _image:Class;
		
		public function BulletType($image:Class,$speed:Number,$distance:Number) 
		{
			_image = $image;
			_speed = $speed;
			_distance = $distance;
		}
		
		public function get image():Class 
		{
			return _image;
		}
		
		public function get speed():Number 
		{
			return _speed;
		}
		
		public function get distance():Number 
		{
			return _distance;
		}
		
	}

}