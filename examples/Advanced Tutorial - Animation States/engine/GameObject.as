package engine 
{
	import flash.display.MovieClip;
	
	/**
	 * ...
	 * @author bnns
	 */
	public class GameObject extends MovieClip 
	{
		static public var list:Vector.<GameObject> = new Vector.<GameObject>();
		
		private var _isDestroyed:Boolean;
		
		protected var hitbox:MovieClip;
		
		public function GameObject() 
		{
			super();
			list.push(this);
			hitbox = this;
			//trace("list: " + list.length + " items: " + list);
		}
		
		public function update():void
		{
			//trace(this+": updating");
		}
		
		static public function getType($type:Class):GameObject
		{
			for (var i:int = list.length-1; i >= 0; i--) 
			{
				if (list[i] is $type)
					return list[i];
			}
			
			return null;
		}
		
		public function collide($typesList:Array):GameObject
		{
			if ($typesList)
			{
				for (var i:int = 0; i < list.length; i++) 
				{
					var $current:GameObject = list[i];
					for (var j:int = 0; j < $typesList.length; j++) 
					{
						if ($current is $typesList[j] && hitbox.hitTestObject($current.hitbox) && $current != this)
						{
							return $current;
						}
					}
				}
			}
			return null;
		}
		
		public function collideAt($x:Number = 0, $y:Number = 0, $typesList:Array = null):GameObject
		{
			var $oX:Number = x, 
				$oY:Number = y,
				$collision:GameObject;
				
			x = $x;
			y = $y;
			
			$collision = collide($typesList);
			
			x = $oX;
			y = $oY;
			
			return $collision;
		}
		
		public function moveBy($x:Number=0, $y:Number=0, $typesList:Array=null):void
		{
			const $precision:Number = 10;
			$x = Math.floor($x * $precision)/$precision;
			$y = Math.floor($y * $precision)/$precision;
			
			var $collision:GameObject;
			var $lastCollision:GameObject;
			var $direction:int;
			
			x += $x;
			$direction = $x > 0?1: -1;
			while (($collision = collide($typesList)))
			{
				x -= $direction/$precision;
				$lastCollision = $collision;
			}
			
			if($lastCollision)
				onCollideX($collision);
			
			$lastCollision = null;
			
			y += $y;
			$direction = $y > 0?1: -1;
			while (($collision = collide($typesList)))
			{
				y -= $direction / $precision;
				$lastCollision = $collision;
			}
			
			if($lastCollision)
				onCollideY($collision);
			
		}
		
		public function onCollideX($collision:GameObject):void 
		{
			
		}
		
		public function onCollideY($collision:GameObject):void 
		{
			
		}
		
		public function get isDestroyed():Boolean 
		{
			return _isDestroyed;
		}
		
		public function destroy():void 
		{
			var $indexOf:int = list.indexOf(this);
			if ($indexOf > -1)
			{
				list.splice($indexOf, 1);
			}
			
			if (parent)
			{
				parent.removeChild(this);
			}
			
			_isDestroyed = true;
		}
		
		
	}

}