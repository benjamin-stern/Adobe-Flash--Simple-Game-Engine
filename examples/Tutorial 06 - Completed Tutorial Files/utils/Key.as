package utils 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author bnns
	 */
	public final class Key 
	{
		static private var keysUpdateList:Array = [];
		static private var keysDownList:Array = [];
		
		public function Key(stage:Stage) 
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			//stage.addEventListener(Event.EXIT_FRAME, onFrameExit);
		}
		
		static public function updateKeys():void
		{
			for (var $key:Object in keysUpdateList)
			{
				keysDownList[$key] = keysUpdateList[$key];
				delete keysUpdateList[$key];
			}
		}
		
		private function onFrameExit(e:Event):void 
		{
			updateKeys();
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			keysUpdateList[e.keyCode] = true;
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			keysUpdateList[e.keyCode] = false;
		}
		
		/**
		 * Returns true when the key is held down.
		 * @param	keyCode	Keyboard keycode.
		 * @return
		 */
		static public function isKeyPressed(keyCode:uint):Boolean
		{
			return keysDownList[keyCode];
		}
		
		/**
		 * Returns true when the key is first pressed.
		 * @param	keyCode	Keyboard keycode.
		 * @return
		 */
		static public function isKeyDown(keyCode:uint):Boolean
		{
			return keysUpdateList[keyCode] && !keysDownList[keyCode];
		}
		
		static public function isKeyReleased(keyCode:uint):Boolean
		{
			return !keysUpdateList[keyCode] && keysDownList[keyCode];
		}
	}

}