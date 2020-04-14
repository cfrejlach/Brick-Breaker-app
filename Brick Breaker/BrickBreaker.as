package  {
	
	import flash.display.MovieClip;
	import flash.events.*;
	
	public class BrickBreaker extends MovieClip {
		//BALL
		public var ball: Ball;
		//BRICK
		public var brick: Brick;
		public var brickList: Array;
		public var nBricks: int;
		//PLATFORM
		public var platform: Platform;
		
		
		public function BrickBreaker() {
			stage.addEventListener(MouseEvent.CLICK, startGame);
		}
		
		public function startGame(event:MouseEvent){
			
			brickList = new Array();
			var X: Number = 134.35;
			var Y: int = 23.95;
			var up: Number = 25;
			var side: Number = 135;
			//NESTED FOR LOOP TO CREATE THE ROW OF BRICKS
			for(var i: int = 0; i <= 2; i++){
				for(var q:int = 0; q <= 2; q++){
					brick = new Brick(X,Y);
					brick.x = brick.mX;
					brick.y = brick.mY;
					nBricks +=1;
					addChild(brick);
					brickList.push(brick);
					Y += up;
				}
				X += side;
				Y = 20;
			}
			
			//CREATING BALL
			 ball = new Ball()
			 ball.x = ball.mX;
			 ball.y = ball.mY;
			 addChild(ball);
			 addEventListener(Event.ENTER_FRAME, moveBall);
			 
			 //CREATING PLATFORM
			 platform = new Platform();
			 platform.x = platform.mX;
			 platform.y = platform.mY;
			 addChild(platform);
			 addEventListener(Event.ENTER_FRAME, movePlatform);
		}
		
		public function movePlatform(event:Event){
			platform.movePos(mouseX);
			platform.x = platform.mX;
			platform.y = platform.mY;
		}
		
		public function moveBall(event:Event){
			for (var i: int = 0; i <= nBricks; i++) {
				ball.movePos(platform.x, platform.y, brickList[i]);
				ball.x = ball.mX;
				ball.y = ball.mY;
				ball.setBoundaries(550, 400, 22.5);
			}
		}
	}
	
	
}
