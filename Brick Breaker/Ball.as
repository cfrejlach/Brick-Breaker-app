package  {
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class Ball extends MovieClip {
		public var mX: Number; 
		public var mY: Number;
		public var vy: Number = 1;
		public var vx: Number = -1;
		private const REVERSE: Number = -1;
		private var TOP: Number;
		private var LEFT: Number;
		private var RIGHT: Number;
		
		public function Ball() {
			mX = 225;
			mY = 250;
		}
		
		public function setBoundaries(w:Number, h: Number, r: Number): void { 
			TOP = r; 
			LEFT = r;
			RIGHT = w - r; 
			
		}
		public function movePos(platformX: Number, platformY:Number, brickList): void{
			this.mX += this.vx; 
			this.mY += this.vy;
			var hyp = Math.sqrt(Math.pow((platformX-mX),2)+ Math.pow((platformY-mY),2));
			
			if (mY < TOP) {
				vy *= REVERSE;
				mY = TOP; 
			} 
			else if (mY > (platformY - 33.5) && (mX > (platformX - 80) && mX < (platformX + 80))) {
				vy *= REVERSE;
				vx = (mX - platformX)* .02;
				mY = platformY - 33.5;
			}
			if (mX < LEFT) {
				vx *= REVERSE;
				mX= LEFT; 
			}
			else if (mX > RIGHT) {
				vx *= REVERSE;
				mX = RIGHT;
			}
			
			if ((brickList.x - 67.175) <= mX && (brickList.x + 67.175) >= mX && (brickList.y - 12) <= (mY-16.625‬) && (brickList.y + 12) >= (mY-16.625‬)) {
				brickList.x = -200;
				vy *= -1;
			}
		}
		 
			
	}
	
}
