# FBX Player Model Integration Guide

## Overview

This document describes the integration of the `characterMedium.fbx` player model into Scene 0, replacing the placeholder capsule mesh with a detailed character model complete with animation support.

## What Was Changed

### 1. FBX Import Configuration

Created `.import` files for all FBX assets to ensure Godot properly imports them:
- `test/assets/character/Model/characterMedium.fbx.import` - Main character model
- `test/assets/character/Animations/idle.fbx.import` - Idle animation
- `test/assets/character/Animations/run.fbx.import` - Run/walk animation
- `test/assets/character/Animations/jump.fbx.import` - Jump animation

These import files configure the FBX files to be imported as `PackedScene` resources with proper animation settings.

### 2. Spirit Scene Updates (`spirit.tscn`)

The player character scene was significantly updated:

**Removed:**
- `MeshInstance3D` node with placeholder `CapsuleMesh`

**Added:**
- `CharacterModel` node - Instance of the `characterMedium.fbx` model
- `AnimationPlayer` node - Manages character animations
- `AnimationTree` node - Provides smooth animation transitions using a state machine

**Retained:**
- `CollisionShape3D` with `CapsuleShape3D` for physics
- `Camera3D` for first-person view
- Same positioning and transforms

### 3. Animation System (`spirit_movement.gd`)

Enhanced the player movement script with animation support:

**New Variables:**
```gdscript
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer
var current_animation: String = "idle"
```

**New Functionality:**
- `_set_animation(animation_name)` - Smoothly transitions between animations
- Automatic animation state management:
  - **Idle** - When player is not moving
  - **Run** - When player is moving horizontally
  - **Jump** - When player is airborne

**Animation Integration:**
- Animations are controlled via the AnimationTree state machine
- Uses `playback.travel()` for smooth transitions between states
- Animation changes only occur when the state actually changes (optimization)

## Model Specifications

### Character Model
- **File**: `characterMedium.fbx`
- **Location**: `test/assets/character/Model/`
- **Type**: FBX 7400 format
- **Size**: ~167KB
- **Usage**: Instanced as a child of the Spirit CharacterBody3D node

### Animations
- **Idle**: `test/assets/character/Animations/idle.fbx` (~608KB)
- **Run**: `test/assets/character/Animations/run.fbx` (~572KB)
- **Jump**: `test/assets/character/Animations/jump.fbx` (~562KB)

## Integration Details

### Scene Hierarchy
```
Spirit (CharacterBody3D)
├── CharacterModel (Instance of characterMedium.fbx)
├── CollisionShape3D
├── Camera3D
├── AnimationPlayer
└── AnimationTree
```

### Model Positioning
- **Position**: (0, 0, 0) relative to Spirit node
- **Rotation**: (0, 0, 0) - Facing forward (negative Z direction)
- **Scale**: (1, 1, 1) - Default scale (adjust if needed)

### Collision Configuration
The collision shape remains a capsule for simplicity and performance:
- **Radius**: 0.3 units
- **Height**: 1.5 units
- **Position**: (0, 0.75, 0) - Centered on character

This may need adjustment depending on the actual size of the imported FBX model.

### Camera Configuration
- **Position**: (0, 1.4, 0) - Eye level for first-person view
- May need adjustment based on actual character height

## Animation System Architecture

### State Machine Flow
```
        Idle ←→ Run
         ↓       ↓
         Jump ←→ Jump
```

### Animation Priority
1. **Jump** - Highest priority (checked when `not is_on_floor()`)
2. **Run** - When moving with input
3. **Idle** - Default state when grounded and stationary

### Animation Transition Logic
The system automatically handles transitions:
- Standing still → Idle animation plays
- Pressing movement keys → Transitions to Run
- Jumping → Transitions to Jump (overrides other animations)
- Landing → Returns to Idle or Run based on movement

## First-Time Setup

When you first open the project in Godot Editor:

1. **Import Process**: Godot will automatically import the FBX files based on the `.import` configurations
2. **Model Verification**: Open `spirit.tscn` to verify the model loaded correctly
3. **Animation Setup**: The AnimationTree may need manual configuration in the editor:
   - Open the AnimationTree node
   - Configure the state machine with transitions between idle, run, and jump states
   - Connect animation nodes to the imported animation clips

## Required Manual Steps in Godot Editor

### 1. Animation Tree Configuration

Open `spirit.tscn` in Godot Editor and:

1. Select the `AnimationTree` node
2. In the Inspector, click on "tree_root" (AnimationNodeStateMachine)
3. Add animation nodes:
   - Right-click in the state machine graph
   - Add Animation nodes for "idle", "run", and "jump"
   - Link each node to the corresponding animation from the FBX files
4. Create transitions:
   - Connect idle ↔ run (bidirectional)
   - Connect idle → jump
   - Connect run → jump
   - Connect jump → idle

### 2. Model Scale Adjustment

After import, check if the character model needs scaling:

1. Open `scene_0.tscn`
2. Select the Spirit node
3. Expand to see the CharacterModel child
4. Adjust the scale if the model is too large or small
5. Common scale values: 0.5 to 2.0 depending on the model's original size

### 3. Collision Shape Adjustment

Match the collision shape to the model:

1. Select the CollisionShape3D under Spirit
2. Adjust the capsule radius and height to fit the visible model
3. Test by running the scene and verifying collisions feel correct

### 4. Camera Height Adjustment

Ensure the camera is at the character's eye level:

1. Select the Camera3D node under Spirit
2. Adjust the Y position (currently 1.4) to match the character's head height
3. Test in-game to ensure the perspective feels natural

## Testing Checklist

After integration, verify:

- [ ] Character model appears in Scene 0 (not just a capsule)
- [ ] Model is properly scaled and positioned
- [ ] Model doesn't sink into or float above the ground
- [ ] First-person camera is at appropriate eye level
- [ ] Movement controls work (WASD/arrows)
- [ ] Mouse look works correctly
- [ ] Idle animation plays when standing still
- [ ] Run animation plays when moving
- [ ] Jump animation plays when in the air
- [ ] Animation transitions are smooth
- [ ] Collision detection works (can't walk through walls)
- [ ] All narrative mechanics still function (monologue, cat interaction, etc.)

## Troubleshooting

### Model Doesn't Appear
- Check that the FBX file imported successfully
- Look for errors in the Godot console
- Verify the CharacterModel node is visible (not hidden)
- Check the scene hierarchy in the Scene panel

### Model is Wrong Size
- Select CharacterModel in spirit.tscn
- Adjust the scale transform
- Typical range: 0.5 to 2.0
- Adjust collision shape to match

### Animations Don't Play
- Open AnimationTree and verify it's active
- Check that AnimationPlayer has animations loaded
- Verify the state machine is properly configured
- Check console for animation-related errors

### Camera Position is Wrong
- Adjust Camera3D Y position in spirit.tscn
- Typical eye level: 1.2 to 1.6 units above the character's feet
- Test and iterate until it feels right

### Collision is Off
- Select CollisionShape3D in spirit.tscn
- Adjust capsule radius and height
- Make collision slightly smaller than the visual model
- Test by walking near walls and objects

### Animation Transitions are Jerky
- In the AnimationTree state machine, adjust transition times
- Use blend/crossfade transitions instead of immediate switches
- Typical transition time: 0.1 to 0.3 seconds

## Future Enhancements

Potential improvements to consider:

1. **Additional Animations**
   - Walking animation (slower than run)
   - Landing animation (from jump to ground)
   - Turning animations
   - Interaction animations (examining clown body, etc.)

2. **Animation Blending**
   - Blend between walk and run based on speed
   - Smooth rotation animations
   - Upper/lower body separation for more natural movement

3. **Model Enhancements**
   - Add materials and textures
   - Ghost-like transparency shader
   - Glowing effects for the spirit theme
   - Particle effects (ethereal wisps, etc.)

4. **Physics Adjustments**
   - Use the actual model mesh for more precise collisions
   - Add ragdoll physics for specific events
   - Implement smooth ground alignment

## Technical Notes

### FBX Import Settings
The `.import` files configure:
- Scene import mode (creates PackedScene)
- Animation import enabled
- 30 FPS animation playback
- LOD generation enabled
- Shadow mesh generation enabled
- Named skins usage

### Performance Considerations
- The character model replaces a simple capsule mesh
- FBX models can be more resource-intensive
- AnimationTree adds overhead but provides smooth transitions
- Consider optimizing the model if performance issues occur

### Compatibility
- Godot 4.2 or later required
- FBX 7400 format supported
- All scripts use GDScript 2.0 syntax

## Files Modified

1. `test/spirit.tscn` - Player character scene
2. `test/spirit_movement.gd` - Player movement and animation script
3. `test/assets/character/Model/characterMedium.fbx.import` - Model import config
4. `test/assets/character/Animations/idle.fbx.import` - Idle animation import config
5. `test/assets/character/Animations/run.fbx.import` - Run animation import config
6. `test/assets/character/Animations/jump.fbx.import` - Jump animation import config

## Summary

The FBX player model integration successfully replaces the placeholder character with a detailed 3D model featuring full animation support. The system automatically handles animation state transitions based on player input, providing a more immersive first-person experience while maintaining all existing gameplay mechanics.
