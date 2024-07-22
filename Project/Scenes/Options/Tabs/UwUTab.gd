extends UwUDialog

func startup():
	if (get_parent().tabname() == gamestate.currentTab):
		setTextBlock($AlreadyThere)
	

func choiceMade(choice):
	if (choice == "Enter"):
		get_parent()._on_pressed()
		closeDialog();
	else:
		closeDialog();
