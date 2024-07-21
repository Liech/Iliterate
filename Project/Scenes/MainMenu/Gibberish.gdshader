shader_type canvas_item;

vec2 random(vec2 uv){
    uv = vec2( dot(uv, vec2(127.1,311.7) ),
               dot(uv, vec2(269.5,183.3) ) );
    return -1.0 + 2.0 * fract(sin(uv) * 43758.5453123);
}
//https://github.com/godotengine/godot-docs/issues/4385
void vertex() {
  VERTEX.y += cos(TIME*2.0)*2.0;
  VERTEX.x += sin(TIME*2.0)*2.0;
}
uniform sampler2D gradient;

void fragment(){
	vec4 col = texture(gradient,SCREEN_UV.yx);
	COLOR = texture(TEXTURE,UV) * COLOR ;
	COLOR.a = random(SCREEN_UV.yx).x *0.3 +  texture(TEXTURE,UV).a*0.7;
}