struct VertexOutput{
	@builtin(position) clip_position: vec4<f32>,
	@location(0) uv: vec2<f32>
}


struct VertexInput{
	@location(0) position: vec3<f32>,
	@location(1) uv: vec2<f32>,
}

@group(0) @binding(0)
var texture : texture_2d<f32>;

@group(0) @binding(1)
var tex_sampler : sampler;

@vertex
fn vertex(
	model : VertexInput,
) -> VertexOutput{
	var out: VertexOutput;

	out.uv = model.uv;
	out.clip_position = vec4<f32>(model.position, 1.);

	return out;
}


@fragment
fn frag(
	in : VertexOutput
) -> @location(0) vec4<f32>{
	// return white
	return textureSample(texture, tex_sampler, in.uv);
	//return vec4<f32>(in.uv, 0., 1.);
}
