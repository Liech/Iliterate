shader_type canvas_item;
//https://docs.godotengine.org/en/stable/tutorials/shaders/custom_postprocessing.html
uniform vec2 size = vec2(4.0, 4.0);
uniform bool disabled = false;
// If you intend to read from mipmaps with `textureLod()` LOD values greater than `0.0`,
// use `filter_nearest_mipmap` instead. This shader doesn't require it.
uniform sampler2D screen_texture : hint_screen_texture, repeat_disable, filter_nearest;

void fragment() {

		if (disabled)
		{
			COLOR = texture(TEXTURE, UV);
		}	
		else{	
				vec2 norm_size = size * vec2((1.0 / 1920.0),(1.0 / 1080.0));
				bool half = mod(SCREEN_UV.y / 2.0, norm_size.y) / norm_size.y < 0.5;
				vec2 uv = UV + vec2(norm_size.x * 0.5 * float(half), 0.0);
				vec2 center_uv = floor(uv / norm_size) * norm_size;
				vec2 norm_uv = mod(uv, norm_size) / norm_size;
				center_uv += mix(vec2(0.0, 0.0),
								mix(mix(vec2(norm_size.x, -norm_size.y),
										vec2(0.0, -norm_size.y),
										float(norm_uv.x < 0.5)),
									mix(vec2(0.0, -norm_size.y),
										vec2(-norm_size.x, -norm_size.y),
										float(norm_uv.x < 0.5)),
									float(half)),
								float(norm_uv.y < 0.3333333) * float(norm_uv.y / 0.3333333 < (abs(norm_uv.x - 0.5) * 2.0)));
		
				COLOR = textureLod(TEXTURE, center_uv, 0.0);
		}
}