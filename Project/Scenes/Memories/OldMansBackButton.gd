extends CloneableButton

func _ready():
	if (GlobalOptions.localization == GlobalOptions.Localization.Gibberish):
		text = "Back"
	super()
	
