
package ui{
	import flash.text.TextField;
	import fl.transitions.easing.Strong;
	import fl.transitions.Tween;
	import flash.display.MovieClip;

	public class EventBlock extends MovieClip {

		public var xTween:Tween = null;
		public var yTween:Tween = null;

		public var nextX:int;
		public var nextY:int;
		//nextX = this.x;
		//nextY = this.y;
		public var prevX;
		public var prevY;

		public var attendeeList:Array = [firstAttendee, secondAttendee, thirdAttendee, fourthAttendee, fifthAttendee];

		public function EventBlock() {
			this.x = 147;
			this.y = 45;
			this.prevY = 45;
			this.prevX = 147;
			this.nextY = 45;
			this.nextX = 147;
			
		}

		public function initialision() {
			nextX = this.x;
			nextY = this.y;
			prevX = this.x;
			prevY = this.y;
			
			for each(var p in attendeeList){
				//p.text = "";
			}
		}

		public function pleaseMove(percentSpeed) {
			/* Here, percent speed indicates how fast */

		}

		public function isCenter(centerX, centerY) {
			if (this.nextX == centerX) {
				return true;
			} else {
				return false;
			}
		}

		public function closeUP(earlierNextX, earlierNextY) {
			this.nextX = earlierNextX + 50;//Fall 50 behind x values of earlier object
			this.nextY = earlierNextY - 20;//Fall down 20
			//On next goTween call, move to this location noted above
			//May not tween right away - may manipulate first
		}

		public function openUp(laterNextX, laterNextY, numFromCenter) {
			if (numFromCenter == 1) {//In the case of the one right next to the center,
				this.nextX = laterNextX - 435;//Make it move extensively over to the left
				this.nextY = laterNextY + 20;
			} else if (numFromCenter > 1) {//Otherwise
				this.nextX = laterNextX - 50;//Only so much offset
				this.nextY = laterNextY + 20;
			} else {
				return;
			}//Can't use pass, thus return
			//Stays where it is, does not need to move if less than 1
		}

		public function reset() {
			this.x = prevX;
			this.y = prevY;
		}

		public function goTween() {
			//Instantly Tweens from current location to next stated location, for both x
			//and y values - from current to nextX, as well as nextY
			this.xTween = new Tween(this, "x", Strong.easeOut, this.x, this.nextX, 50, false);
			this.yTween = new Tween(this, "y", Strong.easeOut, this.y, this.nextY, 50, false);
			//NOTE: Need to figure out speed of frame tweening, currently using frames, not seconds
		}
	}

}