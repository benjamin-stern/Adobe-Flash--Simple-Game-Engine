package engine 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import game.HUD;
	import game.interactable.Door;
	import game.unit.enemy.EnemyBase;
	import game.unit.Player;
	import utils.Key;
	
	/**
	 * ...
	 * @author bnns
	 */
	public class Level extends MovieClip 
	{
		
		static public const LEVEL_COMPLETE:String = "levelComplete";
		static public const LEVEL_FAILED:String = "levelFailed";
		
		private var pause:Boolean = false;
		
		private var player:Player;
		
		private var hud:HUD;
		
		private var isDestroyed:Boolean;
		
		public function Level() 
		{
			super();
			addEventListener(Event.ENTER_FRAME, onUpdate);
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			addEventListener(EnemyBase.ENEMY_DEATH, onEnemyDead);
		}
		
		
		private function onAdded(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			
			hud = HUD.getInstance();
			parent.addChild(hud);
		}
		
		public function onUpdate(e:Event):void
		{
			
			if (Key.isKeyDown(Keyboard.P))
			{
				pause = !pause;
				alpha = pause?.5:1;
			}
			if (pause)
				return;
			
			if (!player)
			{
				player = GameObject.getType(Player) as Player;
			}
				
			for (var i:int = GameObject.list.length-1; i >= 0; i--) 
			{
				if(GameObject.list.length > i)
					GameObject.list[i].update();
			}
			
			if (player)
			{
				const $cameraSpeed:Number = 0.1;
				x += (-player.x - x + stage.stageWidth * .5)*$cameraSpeed;
				y += (-player.y - y + stage.stageHeight * .5)*$cameraSpeed;
				
				x = x<<0;
				y = y << 0;
				
				
				if (player.collide([Door]))
				{
					dispatchEvent(new Event(LEVEL_COMPLETE, true));
				}
				
				if (player.isDestroyed)
				{
					dispatchEvent(new Event(LEVEL_FAILED, true));
				}
			}
			
			Key.updateKeys();
		}
		
		
		private function onEnemyDead(e:Event):void 
		{
			if (!isDestroyed)
			{
				hud.enemyDied();
			}
		}
		
		public function destroy():void
		{
			isDestroyed = true;
			removeEventListener(Event.ENTER_FRAME, onUpdate);
			for (var i:int = GameObject.list.length-1; i >= 0 ; i--) 
			{
				GameObject.list[i].destroy();
			}
		}
	}

}