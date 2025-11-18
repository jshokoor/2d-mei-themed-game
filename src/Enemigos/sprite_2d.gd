extends Sprite2D

func _ready():
	var img = Image.create(64, 64, false, Image.FORMAT_RGBA8)
	img.fill(Color.GREEN_YELLOW)
	
	var tex = ImageTexture.create_from_image(img)
	texture = tex
