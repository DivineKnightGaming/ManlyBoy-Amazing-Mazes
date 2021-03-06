
import flixel.util.FlxSave;

class SaveScores
{
	public static var _gameSave:FlxSave;
	static function main()
	{
	}
	
	public static function empty():Void
	{
		Reg.bestTimes = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
						[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]];
		_gameSave.data.fullScreen = false;
		SaveScores.save();
	}
	
	public static function save():Void
	{
		_gameSave = new FlxSave();
		_gameSave.bind("SaveAmazingMAzes");
		_gameSave.data.bestTimes = Reg.bestTimes;
		_gameSave.data.fullScreen = Reg.fullScreen;
		_gameSave.data.controls = Reg.controls;
		_gameSave.flush();
	}
	
	public static function load():Void
	{
		
		_gameSave = new FlxSave();
		_gameSave.bind("SaveAmazingMAzes");
		
		if (_gameSave.data.bestTimes == null)
		{
			Reg.bestTimes = [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], 
							[0, 0, 0, 0, 0, 0, 0, 0, 0, 0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0]];
		}
		else 
		{
			Reg.bestTimes = _gameSave.data.bestTimes;
		}
		
		if (_gameSave.data.fullScreen == null)
		{
			Reg.fullScreen = false;
		}
		else 
		{
			Reg.fullScreen = _gameSave.data.fullScreen;
		}
		
		if (_gameSave.data.controls == null)
		{
			Reg.controls = "Keyboard";
		}
		else if (Reg.usegamepad == false || _gameSave.data.controls == "Keyboard")
		{
			Reg.controls = _gameSave.data.controls;
			Reg.dpad="Arrows";
			Reg.buttonO="Space";
			Reg.buttonU="Q";
			Reg.buttonY="G";
			Reg.buttonA="Z";
		}
		else if(_gameSave.data.controls == "PS3")
		{
			Reg.controls = _gameSave.data.controls;
			Reg.dpad="DPad";
			Reg.buttonO="X";
			Reg.buttonU="Squr";
			Reg.buttonY="Start";
			Reg.buttonA="Cir";
		}
		else
		{
			
			Reg.controls = _gameSave.data.controls;
			Reg.dpad="DPad";
			Reg.buttonO="A";
			Reg.buttonU="X";
			Reg.buttonY="Start";
			Reg.buttonA="B";
		}
	}
}
