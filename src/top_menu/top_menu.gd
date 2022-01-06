extends Panel

enum FileMenuId { NEW, OPEN, SAVE, SAVE_AS, LOAD_PALLETE}
enum HelpMenuId { REFERENCE, ABOUT }

onready var file_menu_popup = $HBoxContainer/FileMenuButton.get_popup()


func _ready():
	file_menu_popup.add_item("New")
	file_menu_popup.add_item("Open")
	file_menu_popup.add_item("Save")
	file_menu_popup.add_item("Save As")
	file_menu_popup.add_item("Load pallete")
	
	$HBoxContainer/HelpMenuButton.get_popup().add_item("Reference")
	$HBoxContainer/HelpMenuButton.get_popup().add_item("About")
	$HBoxContainer/FileMenuButton.get_popup().connect("id_pressed", self, "on_file_menu_id_pressed")
	$HBoxContainer/HelpMenuButton.get_popup().connect("id_pressed", self, "on_help_menu_id_pressed")


func on_file_menu_id_pressed(id):
	match id:
		FileMenuId.NEW:
			Global.new_file_panel.visible = true
		FileMenuId.OPEN:
			Global.open_file_dialog.visible = true
		FileMenuId.SAVE:
			if Global.current_file == null:
				Global.save_file_dialog.visible = true
			else:
				Global.save_img()
		FileMenuId.SAVE_AS:
			Global.save_file_dialog.visible = true
		FileMenuId.LOAD_PALLETE:
			Global.load_pallete_file_dialog.visible = true

func on_help_menu_id_pressed(id):
	match id:
		HelpMenuId.REFERENCE:
			Global.reference.visible = true
		HelpMenuId.ABOUT:
			Global.about_panel.visible = true
