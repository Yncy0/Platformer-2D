class_name LoadingScreen extends Control


@onready var progress_bar: ProgressBar = %ProgressBar


var scene_path: String 
var progress: Array[float]
var loading_status: int


func _ready() -> void:
	scene_path = SceneManager.next_scene
	ResourceLoader.load_threaded_request(scene_path)

func _process(_delta: float) -> void:
	loading_status = ResourceLoader.load_threaded_get_status(scene_path, progress)
	
	match loading_status:
		ResourceLoader.THREAD_LOAD_INVALID_RESOURCE:
			printerr("The loaded scene was invalid")
		ResourceLoader.THREAD_LOAD_IN_PROGRESS:
			progress_bar.value = progress[0] * 100
		ResourceLoader.THREAD_LOAD_FAILED:
			printerr("Load failed: Try to report this bug")
		ResourceLoader.THREAD_LOAD_LOADED:
			get_tree().change_scene_to_packed(ResourceLoader.load_threaded_get(scene_path))
