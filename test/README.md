# Scene 0 - First-Person Spirit Experience

This is Scene 0 of a Godot 4 game project featuring a first-person perspective where you play as the spirit of a clown, guided by a mysterious black cat through an eerie environment.

## Features

### Environment
- **Ground Plane**: A 20x20 unit ground plane for exploration
- **Atmospheric Fog**: Dense fog that limits visibility and creates an eerie atmosphere
- **Dim Lighting**: Reduced ambient lighting for mystery and tension
- **Forest Placeholders**: Four placeholder box shapes representing trees/forest elements

### First-Person Perspective
- **Immersive Camera**: Play from the eyes of the spirit
- **Mouse Look Controls**: Look around freely with mouse movement
- **Smooth Movement**: WASD or arrow keys for navigation
- **Jump Capability**: Space bar for jumping (optional for future 3D navigation)

### Characters

#### 1. Spirit of the Clown (Player)
- **Type**: First-person controllable character
- **Shape**: Capsule mesh (placeholder)
- **Script**: `spirit_movement.gd`
- **Controls**: 
  - WASD or Arrow Keys to move
  - Mouse to look around
  - Space bar to jump
  - ESC to toggle mouse capture
  - Speed: 5 units/second

#### 2. Black Cat (Guide)
- **Type**: AI-controlled guide
- **Shape**: Box mesh with glowing effect (placeholder)
- **Script**: `cat_guide.gd`
- **Behavior**: 
  - Leads the player through pathfinding waypoints
  - Stops and waits when player is too far behind (>3 units)
  - Turns back to look at player periodically
  - Occasionally "meows" to catch attention (placeholder for sound)
  - Emits a subtle glow/shimmer to stand out in the fog

#### 3. Clown's Dead Body
- **Type**: Stationary object
- **Shape**: Rotated capsule mesh (laying down)
- **Purpose**: Environmental storytelling element

## File Structure

```
test/
├── scene_0.tscn              # Main scene with waypoints and atmosphere
├── spirit.tscn               # First-person player character scene
├── black_cat.tscn            # Guide character scene with glow effect
├── clown_body.tscn           # Stationary body scene
├── spirit_movement.gd        # First-person movement and camera script
├── cat_guide.gd              # AI guide behavior script
├── follower.gd               # (Legacy - replaced by cat_guide.gd)
├── project.godot             # Godot project configuration
└── icon.svg                  # Default Godot icon
```

## How to Run

1. Open the project in Godot 4.2 or later
2. The main scene (`scene_0.tscn`) should load automatically
3. Press F5 or click the "Play" button to run the scene
4. Click in the game window to capture the mouse
5. Use WASD/Arrow Keys to move and mouse to look around
6. Follow the glowing black cat through the foggy environment!

## Controls

- **W / Up Arrow**: Move forward
- **S / Down Arrow**: Move backward
- **A / Left Arrow**: Strafe left
- **D / Right Arrow**: Strafe right
- **Mouse Movement**: Look around (first-person camera)
- **Space Bar**: Jump
- **ESC**: Toggle mouse capture/release

## Gameplay

The black cat serves as your guide through the mysterious environment:
- Follow the glowing cat as it moves between waypoints
- The cat will wait for you if you fall too far behind
- Watch for the cat looking back at you - it's making sure you're following
- The fog limits your visibility, so stay close to your guide

## Future Improvements

The following enhancements are planned for future development:

- Replace placeholder shapes with actual 3D models and animations
- Add sound cues (meowing, footsteps, ambient sounds)
- Implement progression triggers (e.g., unlocking memories at waypoints)
- Add more interactive environment elements
- Create additional levels and expand the narrative
- Implement particle effects for the cat's glow
- Add UI elements (objectives, hints, atmospheric indicators)
- Enhance the pathfinding with more complex routes

## Technical Details

- **Engine**: Godot 4.2 or later
- **Rendering**: Forward Plus with fog and atmospheric effects
- **Physics**: Built-in 3D physics with CharacterBody3D nodes
- **Camera**: First-person camera with mouse look
- **AI**: Custom waypoint-based pathfinding for the guide character

## Learning Resources

This project demonstrates advanced Godot concepts:

1. **First-Person Controller**: Mouse capture, camera rotation, and WASD movement
2. **AI Pathfinding**: Custom waypoint navigation with waiting behavior
3. **Atmospheric Effects**: Fog, lighting adjustments, and environment settings
4. **Visual Effects**: Emission materials for glowing objects
5. **State Management**: AI behavior states (moving, waiting, looking)

## Credits

Created as a narrative-driven game development project for Godot 4.
