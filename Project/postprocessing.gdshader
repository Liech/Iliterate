shader_type canvas_item;

uniform float bright = 1;
// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {
        COLOR = textureLod(screen_texture, SCREEN_UV, 0.0);
		COLOR.r = COLOR.r*bright;
		COLOR.g = COLOR.g*bright;
		COLOR.b = COLOR.b*bright;
		
}