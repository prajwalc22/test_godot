# Scene 0 - Narrative Ghost Experience

This is Scene 0 of a Godot 4 game project featuring a first-person narrative experience where you play as the spirit of a clown, discovering your fate and guided by a mysterious black cat through an eerie environment.

## Narrative Features

### Story Setup
- You awaken as the ghost of a clown near a cliffside on a cold, moonlit night
- Experience confusion and realization through interactive narrative elements
- Follow a mysterious cat that appears after your moment of realization
- Explore the scene with basic gameplay mechanics tied to story progression

### Interactive Narrative Mechanics

#### 1. Initial Monologue
- **Trigger**: First movement by the player
- **Text**: "I woke up… but not really."
- **Purpose**: Establishes the player's confused state
- Automatically appears on screen for 3 seconds when you first move

#### 2. Clown's Body Interaction
- **Location**: Near position (5, 0, 0) - laying capsule shape
- **Proximity Trigger**: When within ~2 units, displays: "That's… me."
- **Dialogue Choices** (all lead to the same realization):
  - "Am I dead?"
  - "Why can't I feel anything?"
  - "What happened?"
- **Realization**: After choosing any option: "I don't remember."
- **Consequence**: Triggers environment change (faint wind) and cat spawning

#### 3. Cat Spawning Event
- **Timing**: Cat appears ~1 second after completing body interaction
- **Visual**: Cat becomes visible with glowing effect
- **Audio**: Placeholder for small spawn sound effect
- **Objective**: "Follow the cat." appears on screen

#### 4. HUD Objective System
- **Display**: Top-center of screen
- **Current Objective**: "Follow the cat."
- **Purpose**: Guides player on what to do next
- Updates dynamically based on story progression

## Features

### Environment
- **Ground Plane**: A 20x20 unit ground plane for exploration
- **Collision Boundaries**: Invisible walls at map edges prevent falling off the cliff
- **Atmospheric Fog**: Dense fog that limits visibility and creates an eerie atmosphere
- **Dim Lighting**: Reduced ambient lighting for mystery and tension
- **Forest Placeholders**: Four placeholder box shapes representing trees/forest elements
- **Environment Changes**: Subtle effects (like faint wind) triggered by story events

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
- **Spawning**: Appears after player completes clown body interaction
- **Initial State**: Hidden and disabled until story event triggers
- **Behavior**: 
  - Leads the player through pathfinding waypoints
  - Stops and waits when player is too far behind (>3 units)
  - Turns back to look at player periodically
  - Occasionally "meows" to catch attention (placeholder for sound)
  - Emits a subtle glow/shimmer to stand out in the fog

#### 3. Clown's Dead Body (Interactive)
- **Type**: Stationary object with interaction area
- **Shape**: Rotated capsule mesh (laying down)
- **Scripts**: `clown_body_interaction.gd`
- **Purpose**: Key narrative trigger point
- **Interaction**: Proximity-based dialogue system
- **Range**: ~2 units proximity detection

## File Structure

```
test/
├── scene_0.tscn              # Main scene with all narrative mechanics
├── spirit.tscn               # First-person player character scene
├── black_cat.tscn            # Guide character scene with glow effect
├── clown_body.tscn           # Interactive body scene with Area3D
├── hud.tscn                  # UI scene with dialogue and objectives
├── spirit_movement.gd        # First-person movement, camera, and monologue
├── cat_guide.gd              # AI guide behavior script
├── clown_body_interaction.gd # Proximity detection and dialogue system
├── game_manager.gd           # Coordinates narrative events and mechanics
├── hud.gd                    # UI system for dialogue and objectives
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

## Gameplay Flow

The narrative unfolds in the following sequence:

1. **Game starts** - Player awakens as a ghost, cat is hidden
2. **First movement** - Initial monologue appears: "I woke up… but not really."
3. **Explore environment** - Player can freely move within boundaries
4. **Approach clown's body** - Proximity message: "That's… me."
5. **Dialogue interaction** - Choose from three dialogue options
6. **Realization moment** - "I don't remember." appears
7. **Environment change** - Subtle effects (faint wind placeholder)
8. **Cat spawns** - Black cat becomes visible with glow
9. **Objective appears** - "Follow the cat." shown on HUD
10. **Follow the guide** - Cat leads through waypoints
11. **Cat behavior** - Waits if player falls behind, looks back periodically

## Gameplay

The black cat serves as your guide through the mysterious environment:
- The cat is hidden until you discover your fate at the clown's body
- After your realization, the cat appears as your guide
- Follow the glowing cat as it moves between waypoints
- The cat will wait for you if you fall too far behind
- Watch for the cat looking back at you - it's making sure you're following
- The fog limits your visibility, so stay close to your guide
- Complete the interaction with the clown's body to begin your journey

## Future Improvements

The following enhancements are planned for future development:

- Replace placeholder shapes with actual 3D models and animations
- Add sound effects for narrative events:
  - Wind sound when realization occurs
  - Cat spawn sound effect
  - Ambient environmental sounds
  - Footsteps and movement sounds
- Implement meowing sound for the cat's attention-getting behavior
- Add particle effects for the cat's glow (shimmer, sparkles)
- Implement progression triggers at waypoints (memories, additional dialogue)
- Add more interactive environment elements
- Create additional levels and expand the narrative
- Implement more complex dialogue trees
- Add UI elements (inventory, character status, atmospheric indicators)
- Enhance the pathfinding with more complex routes
- Add voice acting for key dialogue moments
- Implement save/load system for narrative progress

## Technical Details

- **Engine**: Godot 4.2 or later
- **Rendering**: Forward Plus with fog and atmospheric effects
- **Physics**: Built-in 3D physics with CharacterBody3D nodes
- **Camera**: First-person camera with mouse look
- **AI**: Custom waypoint-based pathfinding for the guide character
- **UI System**: CanvasLayer-based HUD with dialogue and objective display
- **Interaction**: Area3D-based proximity detection for narrative triggers
- **Event System**: Signal-based communication between game manager and mechanics
- **Collision**: StaticBody3D boundaries to constrain playable area

## Learning Resources

This project demonstrates advanced Godot concepts:

1. **First-Person Controller**: Mouse capture, camera rotation, and WASD movement
2. **Narrative Systems**: Event-driven storytelling with dialogue and choices
3. **Proximity Detection**: Area3D for interaction triggers
4. **UI Programming**: Dynamic dialogue system with button generation
5. **AI Pathfinding**: Custom waypoint navigation with waiting behavior
6. **Event-Driven Architecture**: Signal-based game manager coordinating mechanics
7. **Atmospheric Effects**: Fog, lighting adjustments, and environment settings
8. **Visual Effects**: Emission materials for glowing objects
9. **State Management**: AI behavior states (moving, waiting, looking) and interaction states

## Credits

Created as a narrative-driven game development project for Godot 4.
