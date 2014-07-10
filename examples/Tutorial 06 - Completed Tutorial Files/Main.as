package  {
	
	import engine.GameObject;
	import engine.Level;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import utils.Input;
	import utils.Key;
	
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	
	public class Main extends MovieClip {
		
		private var levelList:Array = [Level1,Level2];
		
		private var currentLevelIndex:int = 0;
		private var currentLevel:Level;
		
		public function Main() 
		{
			new Key(stage);
			new Input(stage);
			
			loadLevel(currentLevelIndex);
			
			addEventListener(Level.LEVEL_COMPLETE, onLevelComplete);
			addEventListener(Level.LEVEL_FAILED, onLevelFailed);
		}
		
		private function onLevelFailed(e:Event):void 
		{
			restartLevel();
		}
		
		private function onLevelComplete(e:Event):void 
		{
			nextLevel();
		}
		
		public function restartLevel():void
		{
			loadLevel(currentLevelIndex);
		}
		
		public function nextLevel():void
		{
			loadLevel(++currentLevelIndex);
		}
		
		public function loadLevel($targetLevelIndex:int):void
		{
			if (currentLevel)
			{
				currentLevel.destroy();
				if (currentLevel.parent)
					currentLevel.parent.removeChild(currentLevel);
					
				currentLevel = null;
			}
			
			if ($targetLevelIndex < levelList.length)
			{
				currentLevel = new levelList[$targetLevelIndex];
				currentLevelIndex = $targetLevelIndex;
				addChild(currentLevel);
			}
		}
	}
	
}
