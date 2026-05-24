
// Feather ignore all
/// @desc Creates a sprite-type shadow. A shadow is where it says where light will be blocked.
/// IMPORTANT: To see sprite shadows, you need to change the "shadowShaderType" (from a light that cast shadows) to LIGHT_SHADOW_SHADER_SPRITE_SMOOTH, for example.
/// @param {Id.Instance,Struct} owner The instance to get default properties. Use noone if you want to use default properties (position, angle and depth: 0, scale: 1).
/// @param {Asset.GMSprite} sprite The sprite to be used as shadow.
/// @param {Real} frame The sprite subimg (frame).
/// @param {Enum.CRYSTAL_SHADOW} shadowType Shadow type enum. Example: CRYSTAL_SHADOW.STATIC.
function Crystal_ShadowSprite(_owner, _sprite, _frame, _shadowType) constructor {
	static defaultOwner = {depth : 0, x : 0, y : 0, image_angle : 0, image_xscale : 1, image_yscale : 1};
	// base
	__cull = false;
	__renderer = undefined;
	__destroyed = false;
	__applied = false;
	__type = _shadowType;
	__owner = defaultOwner;
	if (instance_exists(_owner)) {
		__owner = _owner;
	}
	// variables
	enabled = true;
	self.x = __owner.x;
	self.y = __owner.y;
	self.depth = __owner.depth;
	angle = __owner.image_angle;
	xScale = __owner.image_xscale;
	yScale = __owner.image_yscale;
	sprite = _sprite;
	frame = _frame;
	shadowLength = 1; // useful for vertex shadows
	followLightAngle = false;
	fixedBase = false;
	
	#region Public Methods
	/// @desc Remove this shadow caster from the lighting system. Use this when destroying objects that cast shadows.
	/// @method Destroy()
	static Destroy = function() {
		__destroyed = true;
		__applied = false;
		if (__type == CRYSTAL_SHADOW.STATIC && __renderer != undefined) {
			__renderer.__spriteShadowsStaticRebuild = true;
		}
	}
	
	/// @desc Apply shadow caster, adding it to a Crystal_Renderer(). If not specified, adds to the last created renderer (or set with crystal_set_renderer()).
	/// @param {Struct.Crystal_Renderer} renderer The renderer to add the shadow for rendering. If not specified, adds to the last created renderer (or set with crystal_set_renderer()).
	static Apply = function(_renderer=global.__CrystalCurrentRenderer) {
		// check
		if (__applied) return;
		if (_renderer == undefined) {
			__crystal_trace("Shadow not applied, renderer not found. (creation order?)", 1);
			return;
		}
		
		// add to renderer (once)
		__renderer = _renderer;
		_renderer.__addSpriteShadowCaster(self);
		__applied = true;
		__destroyed = false;
	}
	
	/// @desc This function synchronizes "transforms" (position, rotation, scale) and "depth" variables to the "owner" instance (if defined) - built-in variables.
	/// This should be called every frame.
	/// @method SyncToOwner()
	static SyncToOwner = function() {
		if (__owner == noone) return;
		self.depth = __owner.depth;
		self.x = __owner.x;
		self.y = __owner.y;
		angle = __owner.image_angle;
		xScale = __owner.image_xscale;
		yScale = __owner.image_yscale;
	}
	#endregion
}

// ===================================================

#region Shadow Vertex Builders

/// @ignore
function __cle_shadowSpriteBuild(_vBuff, _spriteInfo) {
	// get current sprite with subimg uvs
	var _spriteUVs = sprite_get_uvs(sprite, frame);
	var _uvX1 = _spriteUVs[0];
	var _uvY1 = _spriteUVs[1];
	var _uvX2 = _spriteUVs[2];
	var _uvY2 = _spriteUVs[3];
	
	// world-space coordinates
	var _spriteXoffset = _spriteInfo.xoffset - _spriteUVs[4]; // cropped left
	var _spriteYoffset = _spriteInfo.yoffset - _spriteUVs[5]; // cropped top
	var _spriteWidth = _spriteInfo.width * _spriteUVs[6]; // normalized cropped texture width
	var _spriteHeight = _spriteInfo.height * _spriteUVs[7]; // normalized cropped texture height
	var _x1 = xScale * (-_spriteXoffset);
	var _y1 = yScale * (-_spriteYoffset);
	var _x2 = xScale * (-_spriteXoffset + _spriteWidth);
	var _y2 = yScale * (-_spriteYoffset + _spriteHeight);
	
	var _angle = -degtorad(angle);
	var _fixedBase = fixedBase ? 0 : 1;
	
	// X, Y, Z (DEPTH), fixedBase  |  texCoordXY, localSizeXY  |  shadowLength, followLightAngle, angle, fixedBase2
	// Triangle 1
	vertex_float4(_vBuff, x, y, depth, 1);			vertex_float4(_vBuff, _uvX1, _uvY1, _x1, _y1); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // top left
	vertex_float4(_vBuff, x, y, depth, 1);			vertex_float4(_vBuff, _uvX2, _uvY1, _x2, _y1); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // top right
	vertex_float4(_vBuff, x, y, depth, _fixedBase);	vertex_float4(_vBuff, _uvX1, _uvY2, _x1, _y2); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // bottom left
	// Triangle 2
	vertex_float4(_vBuff, x, y, depth, _fixedBase);	vertex_float4(_vBuff, _uvX1, _uvY2, _x1, _y2); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // bottom left
	vertex_float4(_vBuff, x, y, depth, 1);			vertex_float4(_vBuff, _uvX2, _uvY1, _x2, _y1); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // top right
	vertex_float4(_vBuff, x, y, depth, _fixedBase);	vertex_float4(_vBuff, _uvX2, _uvY2, _x2, _y2); vertex_float4(_vBuff, shadowLength, followLightAngle, _angle, fixedBase); // bottom right
}

#endregion
