import flixel.text.FlxText;
import flixel.FlxState;
import flixel.FlxG;
// lol
// doesn't actually load anything except fixing menus
class LoadingState extends FlxState {
    public static function loadAndSwitchState(target:FlxState, ?allowDjkf:Bool) {

		PlayerSettings.player1.controls.setKeyboardScheme(Solo(false));
        if ((target is ChartingState)) {
            FlxG.switchState(new LoadingState());
        } else {
			FlxG.switchState(target);
        }
        
    }
    override function create() {
		var titletext = new FlxText(0, 20, 0, "HEY!", 64);
		titletext.screenCenter(X);
		var paragraph = new FlxText(0, 120, FlxG.width / 1.5,
			'Charting is considered deprecated on 4.0.0, and may be removed. Any issues on github about the Charting state will be ignored and closed. Please consider using Funkin Vortex instead as it has more support. \n \n press space to continue',
			32);
        add(titletext);
        paragraph.screenCenter(X);
        add(paragraph);
    }
    override function update(elapsed:Float) {
        if (FlxG.keys.justPressed.SPACE) {
            FlxG.switchState(new ChartingState());
        }
    }
}