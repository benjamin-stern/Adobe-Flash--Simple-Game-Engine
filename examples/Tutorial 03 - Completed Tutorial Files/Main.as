package  {
	
	import engine.GameObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Key;
	
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Main extends MovieClip {
		
		public function Main() 
		{
			new Key(stage);
			
			addEventListener(Event.ENTER_FRAME,onUpdate);
		}
		
		public function onUpdate(e:Event):void
		{
			for (var i:int = GameObject.list.length-1; i >= 0; i--) 
			{
				GameObject.list[i].update();
			}
		}
	}
	
}
