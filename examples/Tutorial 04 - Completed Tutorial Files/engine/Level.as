package engine 
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.ui.Keyboard;
	import game.unit.Player;
	import utils.Key;
	
	/**
	 * ...
	 * @author bnns
	 */
	public class Level extends MovieClip 
	{
		
		private var pause:Boolean = false;
		
		private var player:Player;
		
		public function Level() 
		{
			super();
			addEventListener(Event.ENTER_FRAME,onUpdate);
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
				GameObject.list[i].update();
			}
			
			if (player)
			{
				const $cameraSpeed:Number = 0.1;
				x += (-player.x - x + stage.stageWidth * .5)*$cameraSpeed;
				y += (-player.y - y + stage.stageHeight * .5)*$cameraSpeed;
				
				x = x<<0;
				y = y<<0;
			}
		}
	}

}