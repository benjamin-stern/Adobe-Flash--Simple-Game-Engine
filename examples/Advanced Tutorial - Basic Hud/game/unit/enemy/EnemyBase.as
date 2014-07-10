package game.unit.enemy 
{
	import engine.GameObject;
	import flash.events.Event;
	import game.HUD;
	
	/**
	 * ...
	 * @author bnns
	 */
	public class EnemyBase extends GameObject 
	{
		static public const ENEMY_DEATH:String = "onEnemyDeath";
		public function EnemyBase() 
		{
			super();
		}
		
		override public function destroy():void 
		{
			dispatchEvent(new Event(ENEMY_DEATH,true));
			
			//var $hud:HUD = getType(HUD) as HUD;
			//$hud.enemyDied();
			
			super.destroy();
		}
		
	}

}