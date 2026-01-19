# Scene 0 - Game Foundation

This is the foundational setup for Scene 0 of a Godot 4 game project. It includes basic movement mechanics, character placeholders, and a simple test environment.

## Features

### Environment
- **Ground Plane**: A 20x20 unit ground plane for the characters to walk on
- **Forest Placeholders**: Four placeholder box shapes representing trees/forest elements in an eerie setting
- **Directional Lighting**: Basic lighting with shadows enabled for depth

### Characters

#### 1. Spirit of the Clown (Player)
- **Type**: Controllable player character
- **Shape**: Capsule mesh (placeholder)
- **Script**: `spirit_movement.gd`
- **Controls**: 
  - Arrow Keys or WASD to move
  - Speed: 5 units/second

#### 2. Black Cat (Follower)
- **Type**: AI-controlled follower
- **Shape**: Box mesh (placeholder)
- **Script**: `follower.gd`
- **Behavior**: 
  - Follows the player when beyond 2 units distance
  - Moves at 3 units/second
  - Stops when close to the player

#### 3. Clown's Dead Body
- **Type**: Stationary object
- **Shape**: Rotated capsule mesh (laying down)
- **Purpose**: Environmental storytelling element

## File Structure

```
test/
├── scene_0.tscn              # Main scene
├── spirit.tscn               # Player character scene
├── black_cat.tscn            # Follower character scene
├── clown_body.tscn           # Stationary body scene
├── spirit_movement.gd        # Player movement script
├── follower.gd               # Follower AI script
├── project.godot             # Godot project configuration
└── icon.svg                  # Default Godot icon
```

## How to Run

1. Open the project in Godot 4.2 or later
2. The main scene (`scene_0.tscn`) should load automatically
3. Press F5 or click the "Play" button to run the scene
4. Use WASD or Arrow Keys to move the spirit around
5. Watch the black cat follow you!

## Controls

- **W / Up Arrow**: Move forward
- **S / Down Arrow**: Move backward
- **A / Left Arrow**: Move left
- **D / Right Arrow**: Move right

## Future Improvements

The following enhancements are planned for future development:

- Replace placeholder shapes with actual 2D/3D sprites or models
- Add character animations (idle, walk, etc.)
- Implement more dynamic environment (particles, effects, ambient sounds)
- Add more forest elements and environmental details
- Create additional levels and game logic
- Implement a more sophisticated camera system
- Add UI elements (health, inventory, etc.)

## Technical Details

- **Engine**: Godot 4.2
- **Rendering**: Forward Plus
- **Physics**: Built-in 3D physics with CharacterBody3D nodes
- **Camera**: Third-person camera attached to the player, positioned at an angle

## Learning Resources

This project is designed for learning Godot step-by-step. Key concepts demonstrated:

1. **CharacterBody3D**: Used for player and follower movement
2. **Input Handling**: Getting keyboard input for player control
3. **Physics Movement**: Using `move_and_slide()` for smooth physics-based movement
4. **Node References**: Follower references the player using NodePath
5. **Scene Instancing**: Reusable character scenes instantiated in the main scene

## Credits

Created as a learning project for Godot 4 game development.
