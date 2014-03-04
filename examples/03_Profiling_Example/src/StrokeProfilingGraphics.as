package
{
	import flash.utils.getTimer;
	
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;

	public class StrokeProfilingGraphics extends Sprite
	{
		private var shape			:Shape;
		private var startTime		:int;
		private var timeLog         :TimeLog;

		public function StrokeProfilingGraphics()
		{
			timeLog = new TimeLog();
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
		}

		private function onAdded ( e:Event ):void
		{
			shape = new Shape();
			addChild(shape);

			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
		}

		private var numFrames:int = 0;
		private function enterFrameHandler( event:Event ):void
		{
			startTime = getTimer();
			shape.graphics.clear();
			shape.graphics.lineStyle( 1, 0xFFFFFF );
			const stageWidth:Number = Starling.current.nativeStage.stageWidth;
			const stageHeight:Number = Starling.current.nativeStage.stageHeight;
			for ( var i:int = 0; i < 100; i++ )
			{
				var L:int = 2 + Math.random() * 20;
				shape.graphics.moveTo(Math.random() * stageWidth, Math.random() * stageHeight);
				for ( var j:int = 0; j < L; j++ )
				{
					shape.graphics.lineTo(Math.random() * stageWidth, Math.random() * stageHeight);
				}
			}
			timeLog.logTime(getTimer()-startTime);
		}
	}
}