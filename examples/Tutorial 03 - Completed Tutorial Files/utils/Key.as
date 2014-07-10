package utils 
{
	import flash.display.Stage;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author bnns
	 */
	public final class Key 
	{
		static private var keysDownList:Array = [];
		
		public function Key(stage:Stage) 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			keysDownList[e.keyCode] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			keysDownList[e.keyCode] = false;
		}
		
		static public function isKeyPressed(keyCode:uint):Boolean
		{
			return keysDownList[keyCode];
		}
	}

}