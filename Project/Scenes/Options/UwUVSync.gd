extends UwUDialog

func startup():
	if (not get_parent().button_pressed):
		setTextBlock($Absent)
	pass

func choiceMade(choice):
	closeDialog();
