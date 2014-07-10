package game 
{
	import engine.GameObject;
	import flash.display.MovieClip;
	import flash.text.TextField;
	import game.unit.Player;
	
	/**
	 * ...
	 * @author ...
	 */
	public class HUD extends GameObject 
	{
		
		//public var playerHealth_mc:MovieClip;
		//public var coins_txt:TextField;
		//public var enemy_txt:TextField;
		
		private var enemyDeathCount:int;
		
		static private var _instance:HUD;
		static private var _allowInstantiation:Boolean;
		
		public function HUD() 
		{
			super();
			if (!_allowInstantiation)
				throw new Error("HUD:Singleton Class: Call getInstance method");
		}
		
		
		static public function getInstance():HUD
		{
			if (!_instance)
			{
				_allowInstantiation = true;
				_instance = new HUD;
				_allowInstantiation = false;
			}
			
			return _instance;
		}
		
		override public function update():void 
		{
			var $player:Player = getType(Player) as Player;
			if ($player)
			{
				coins_txt.text = $player.coinsCollected.toString();
				//playerHealth_mc.gotoAndStop(playerHealth_mc.totalFrames-$player.health);
				playerHealth_mc.stop();
				playerHealth_mc.scaleX = ($player.health + 1) / 4;
				
			}
			
			enemy_txt.text = enemyDeathCount.toString();
		}
		
		
		
		public function enemyDied():void
		{
			enemyDeathCount++;
		}
		
		override public function destroy():void 
		{
			//super.destroy();
			
		}
	}

}