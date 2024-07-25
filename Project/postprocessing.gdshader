shader_type canvas_item;

uniform float vsyncAmount = 0.0;
uniform float vsyncpos = 500;
uniform float bright = 1;
// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
		vec2 pos = SCREEN_UV;
		if (pos.y < vsyncpos/ 1080.0){pos.x = pos.x-vsyncAmount;}
        COLOR = textureLod(screen_texture, pos, 0.0);
		COLOR.r = COLOR.r*bright;
		COLOR.g = COLOR.g*bright;
		COLOR.b = COLOR.b*bright;
}