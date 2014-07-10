package utils 
{
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author bnns
	 */
	public final class Input 
	{
		static private var mouseUpdated:Boolean;
		static private var mouseCurrent:Boolean;
		
		public function Input(stage:Stage) 
		{
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMousePressed);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseReleased);
			
			//stage.addEventListener(Event.EXIT_FRAME, onExitFrame);
		}
		
		static public function updateInput():void
		{
			mouseCurrent = mouseUpdated;
		}
		
		private function onExitFrame(e:Event):void 
		{
			updateInput();
		}
		
		private function onMouseReleased(e:MouseEvent):void 
		{
			mouseUpdated = false;
		}
		
		private function onMousePressed(e:MouseEvent):void 
		{
			mouseUpdated = true;	
		}
		
		static public function get isMousePressed():Boolean
		{
			return mouseCurrent;
		}
		
		static public function get isMouseDown():Boolean
		{
			return mouseUpdated && !mouseCurrent;
		}
		
		static public function get isMouseReleased():Boolean
		{
			return !mouseUpdated && mouseCurrent;
		}
		
		
	}

}