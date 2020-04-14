package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Platform extends MovieClip{
		public var mX: Number; 
		public var mY: Number;
		
		public function Platform() {
			this.mX = 225;
			this.mY = 370;
		}
		
		public function movePos(targetX){
			var dx: Number = (targetX - mX);
			
			mX += dx;
		}

	}
	
}
