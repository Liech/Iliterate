extends UwUDialog

func startup():
	#if (get_parent().tabname() == gamestate.currentTab):
	#	setTextBlock($AlreadyThere)
	pass

func choiceMade(choice):
	closeDialog();
