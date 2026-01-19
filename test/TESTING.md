# Testing Instructions for Scene 0 - FBX Model Integration & Narrative Mechanics

## Prerequisites
- Godot 4.2 or later installed on Windows
- This project cloned/downloaded to your local machine
- A mouse for first-person camera controls

## Overview of Recent Updates

### FBX Player Model Integration (Latest)
This update integrates the `characterMedium.fbx` player model with animation support:
- Replaced placeholder capsule mesh with detailed 3D character model
- Added animation system with idle, run, and jump animations
- Implemented AnimationTree for smooth animation transitions
- See `FBX_MODEL_INTEGRATION.md` for detailed integration documentation

### Narrative Mechanics
The game includes narrative-driven mechanics:
- Initial monologue when player starts moving
- Interactive clown's body with dialogue choices
- Event-driven cat spawning after player realization
- HUD system with objectives
- Collision boundaries to prevent falling off the map

## How to Test

### 1. Open the Project
1. Launch Godot 4
2. Click "Import" on the Godot Project Manager
3. Navigate to the `test` folder in this repository
4. Select the `project.godot` file
5. Click "Import & Edit"

**First-time Import Notes:**
- Godot will automatically import the FBX files (characterMedium.fbx and animations)
- The import process may take a few moments
- Check the Output console for any import errors
- If you see FBX import warnings, they are usually safe to ignore

### 1a. Verify FBX Model Import (NEW - First Time Only)
Before running the scene, verify the FBX files imported correctly:
1. In the FileSystem panel, navigate to `res://assets/character/Model/`
2. You should see `characterMedium.fbx` with a small scene icon
3. Navigate to `res://assets/character/Animations/`
4. You should see `idle.fbx`, `run.fbx`, and `jump.fbx` with scene icons
5. If any files show error icons, check the Output console for details

**If FBX files don't import:**
- Ensure the .import files are present next to each .fbx file
- Try reimporting by right-clicking the FBX file → Reimport
- Check that you're using Godot 4.2 or later
- See `FBX_MODEL_INTEGRATION.md` for detailed troubleshooting

### 1b. Configure Animation Tree (NEW - First Time Only)
The AnimationTree needs manual configuration in the editor:
1. Open `spirit.tscn` in the Scene panel
2. Select the `AnimationTree` node
3. In the Inspector, you'll see the AnimationNodeStateMachine
4. **Note**: The animations will need to be manually connected to the state machine nodes
5. For detailed instructions, see `FBX_MODEL_INTEGRATION.md` section "Required Manual Steps"

**Quick Setup (if animations don't work):**
- The animation system is prepared but may need editor configuration
- Basic movement will work even if animations don't play
- Full animation setup instructions are in `FBX_MODEL_INTEGRATION.md`

### 2. Run Scene 0
1. Once the project opens, the main scene (`scene_0.tscn`) should be loaded automatically
2. Press **F5** or click the **Play** button (▶) in the top-right corner
3. The scene should launch in a new window
4. Click in the game window to capture the mouse cursor

### 3. Test First-Person Camera Controls
Test the new first-person perspective:
- Move the **mouse** - The camera should look around smoothly
- Look up and down - Camera should be clamped to prevent flipping
- Press **ESC** - Mouse cursor should be released/captured
- The view should be from the spirit's eye level (no visible player body)

**Expected Behavior:**
- Smooth mouse look with no camera flipping
- Camera rotation feels responsive
- ESC toggles between captured mouse (for playing) and visible cursor (for UI)
- First-person view centered at eye level

### 3a. Verify Character Model Appearance (NEW - FBX Model)
Check that the player character model is displaying correctly:
1. Start the game (F5)
2. The game uses first-person perspective, so you won't see your own body
3. To verify the model loaded:
   - **Option A**: Look down - you might see parts of the character (hands, body)
   - **Option B**: In the editor, open Scene view while game is running and look at the Spirit node
   - **Option C**: Temporarily add a third-person camera to see the full model

**Expected Behavior:**
- Character model from `characterMedium.fbx` should be loaded (not a capsule)
- Model should be properly positioned at ground level
- No missing textures or distorted geometry
- Model scale should look appropriate for the environment

**If you see a capsule instead:**
- The FBX model may not have imported correctly
- Check the Output console for FBX import errors
- Verify the .import files exist for the FBX files
- Try reimporting the FBX files
- See `FBX_MODEL_INTEGRATION.md` for troubleshooting

### 3b. Test Character Animations (NEW - FBX Model)
Verify the animation system is working:

**Idle Animation:**
1. Start the game and don't press any keys
2. The character should play the idle animation
3. You won't see this from first-person view, but check the console for animation errors

**Run Animation:**
1. Press WASD keys to move in any direction
2. The character should transition to the run animation
3. Movement should feel smooth and natural

**Jump Animation:**
1. Press Space Bar to jump
2. While in the air, the jump animation should play
3. Upon landing, should transition back to idle or run

**Expected Behavior:**
- Smooth transitions between idle, run, and jump animations
- No animation stuttering or popping
- Animations loop correctly (idle and run)
- No console errors about missing animations

**If animations don't play:**
- Basic movement will still work, just without animations
- The AnimationTree may need manual configuration in the editor
- Check the Output console for animation-related errors
- See `FBX_MODEL_INTEGRATION.md` section "Required Manual Steps in Godot Editor"
- Verify AnimationPlayer has animations loaded in the Inspector

**Animation Debugging:**
- Open the AnimationPlayer node while game is running
- Check if animations are listed in the Animation dropdown
- Verify AnimationTree is Active in the Inspector
- Check that "parameters/playback" is set correctly

### 4. Test Player Movement
Test the Spirit (player) movement with first-person controls:
- Press **W** or **↑** (Up Arrow) - Move forward in the direction you're looking
- Press **S** or **↓** (Down Arrow) - Move backward
- Press **A** or **←** (Left Arrow) - Strafe left
- Press **D** or **→** (Right Arrow) - Strafe right
- Press **Space Bar** - Jump (optional feature)
- Try moving and looking at the same time

**Expected Behavior:**
- Movement is relative to where you're looking
- Smooth and responsive controls
- Can look around while moving
- Jump works when on the ground
- Movement feels immersive from first-person view

### 5. Test Initial Monologue (NEW!)
Test the initial internal monologue mechanic:
1. Start the game and capture the mouse
2. **Move for the first time** using WASD
3. Watch for dialogue text to appear: **"I woke up… but not really."**
4. The message should disappear after ~3 seconds

**Expected Behavior:**
- Monologue triggers only on first movement
- Text appears in the center of the screen
- Message is displayed for 3 seconds then disappears
- Subsequent movement does not retrigger the monologue

### 6. Test Clown Body Interaction (NEW!)
Test the proximity-based interaction with the clown's body:
1. Move toward the **laying capsule shape** (clown's body) at position (5, 0, 0)
2. When within ~2 units, dialogue should appear: **"That's… me."**
3. After 2 seconds, dialogue options should appear:
   - "Am I dead?"
   - "Why can't I feel anything?"
   - "What happened?"
4. **Click any dialogue option** (you may need to press ESC to show mouse cursor)
5. The realization text should appear: **"I don't remember."**
6. After 3 seconds, the text disappears
7. After 1 more second, the **cat should spawn** with a small delay

**Expected Behavior:**
- Proximity message appears when close to clown's body
- Message disappears if you move away before completing interaction
- Dialogue options are clickable buttons
- All options lead to the same realization
- Cat becomes visible after the interaction completes
- Environment change is logged (wind sound placeholder)

### 7. Test HUD Objective System (NEW!)
Test the objective display system:
1. Complete the clown body interaction (see above)
2. Wait for the cat to spawn
3. **Check the top center of the screen** for: **"Follow the cat."**
4. The objective should remain visible while following the cat

**Expected Behavior:**
- No objective shown at game start
- Objective "Follow the cat." appears after cat spawns
- Objective is clearly visible at top center of screen
- Text is large and easy to read

### 8. Test Collision Boundaries (NEW!)
Test that you cannot fall off the map:
1. Try to move to the **edges of the ground plane** (±10 units in X or Z)
2. You should be blocked by **invisible walls**
3. You cannot walk off the cliff/edge

**Expected Behavior:**
- Invisible walls prevent movement beyond map boundaries
- Walls are positioned at approximately ±10 units from center
- Player can move freely within the boundaries
- No visual indicators of walls (they're collision-only)

### 9. Test Cat Spawning Behavior (UPDATED!)
Test that the cat spawns correctly after interaction:
1. **Cat should be invisible at game start**
2. Complete the clown body interaction
3. **Cat becomes visible** ~1 second after realization dialogue ends
4. Cat should be **glowing** (emission material)
5. Cat should start **moving toward waypoints**

**Expected Behavior:**
- Cat is not visible or active at start
- Cat spawns only after clown body interaction completes
- Cat spawn message logged to console (placeholder)
- Cat immediately begins its guiding behavior

### 10. Test Cat Guide AI
Test the Black Cat's new guiding behavior:
1. Follow the glowing black cat
2. Observe it moving toward waypoints
3. Move away from the cat and watch it wait for you
4. Move close to the cat and watch it continue its path

**Expected Behavior:**
- Cat has a glowing/shimmering effect (emission material)
- Cat moves toward invisible waypoints in the scene
- Cat stops and waits if player is too far behind (>3 units)
- Cat occasionally turns to look back at the player
- Cat continues to next waypoint when player gets close
- Cat stands out visually even in the fog

### 11. Test Atmospheric Elements
Verify the new atmospheric enhancements:

**Fog:**
- Fog should limit visibility in the distance
- Fog creates an eerie, mysterious atmosphere
- Objects become harder to see as they get farther away

**Lighting:**
- Dimmed directional light for darker atmosphere
- Shadows still visible but softer
- Overall scene has darker, more mysterious tone

**Cat Visibility:**
- Cat's glow should be clearly visible through the fog
- Cat stands out as a guiding beacon

**Expected Behavior:**
- Dense fog that limits long-distance visibility
- Darker overall lighting creates tension
- Cat's glow makes it easy to track as your guide
- Atmospheric and immersive environment

### 12. Verify Scene Elements
Look around the scene to verify all elements are present:

**Environment:**
- ✓ Ground plane (20x20 gray surface)
- ✓ Four forest placeholders (tall boxes at corners)
- ✓ Fog limiting visibility
- ✓ Dimmed directional lighting with shadows

**Characters:**
- ✓ Spirit of the Clown (first-person - you won't see your own body)
- ✓ Black Cat (small glowing box, starts to the left)
- ✓ Clown's Dead Body (laying capsule, to the right)

**Waypoints:**
- ✓ Four invisible waypoint nodes that guide the cat's path

### 13. Test Complete Narrative Sequence (UPDATED!)
Follow the complete narrative flow from start to finish:
1. **Start the game** and capture the mouse
2. **Move for the first time** - see initial monologue: "I woke up… but not really."
3. **Approach the clown's body** - see proximity message: "That's… me."
4. **Select a dialogue option** - see realization: "I don't remember."
5. **Wait for cat to spawn** - cat becomes visible with glow effect
6. **See the objective** appear: "Follow the cat."
7. **Follow the glowing cat** as it moves through waypoints
8. **Observe cat behavior** - it waits when you fall behind, looks back at you
9. **Continue following** until the cat reaches all waypoints

**Expected Behavior:**
- Complete narrative flow executes in correct sequence
- Each trigger happens at the right time
- No triggers fire out of order or multiple times
- Smooth transitions between narrative events
- Cat spawning feels like a natural story progression
- Following the cat becomes the clear objective after the realization

### 14. Test Edge Cases
Test potential issues:

**Leaving Interaction Area:**
- Approach clown's body, see "That's… me."
- Move away before dialogue options appear
- Dialogue should hide
- Return to body - dialogue should reappear

**Multiple Interactions:**
- Try to interact with clown's body after completing interaction
- Should not trigger again (has_interacted flag should prevent)

**Boundary Testing:**
- Try to walk in all directions to edges
- Verify all four walls stop movement
- Check corners where walls meet

**Cat Visibility:**
- Confirm cat is completely invisible at start
- No glowing effect visible before spawn
- Cat immediately visible after spawn event

## Troubleshooting

### FBX Model Issues (NEW)

#### Model doesn't appear / still see capsule placeholder
- Check that FBX file imported successfully in FileSystem panel
- Look for `characterMedium.fbx` with a scene icon in `res://assets/character/Model/`
- Check Output console for FBX import errors
- Try reimporting: Right-click FBX file → Reimport
- Verify `.import` file exists next to the FBX file
- Open `spirit.tscn` and check if CharacterModel node exists
- Ensure CharacterModel is visible (not hidden in Scene panel)

#### Model is wrong size / floating / clipping through ground
- Open `spirit.tscn` in editor
- Select the CharacterModel node
- Adjust the scale (typical range: 0.5 to 2.0)
- Adjust the Y position to align with ground
- May need to adjust CollisionShape3D to match new size

#### Animations don't play / character frozen
- Open `spirit.tscn` and select AnimationTree node
- Verify AnimationTree is Active in Inspector
- Check that AnimationPlayer has animations in the Animation list
- Animations may need manual setup in AnimationTree state machine
- See `FBX_MODEL_INTEGRATION.md` for detailed animation setup
- Check Output console for animation-related errors
- Try opening AnimationPlayer while game is running to debug

#### Animation transitions are jerky / wrong animations play
- AnimationTree state machine may need configuration
- Check transition settings between animation states
- Verify state machine connections in AnimationTree
- Console may show errors about missing animation states

#### Character model has missing textures / appears white or pink
- FBX file may not include embedded textures
- Check Material overrides in MeshInstance3D
- Textures may need to be manually assigned
- This is expected if FBX doesn't include materials

#### Camera height is wrong / can't see properly
- Open `spirit.tscn` and select Camera3D node
- Adjust Y position (currently 1.4, typical range: 1.2 to 1.8)
- Height depends on actual character model size
- Test in-game after each adjustment

### Scene doesn't load
- Ensure you opened the correct `project.godot` file from the `test` folder
- Check that all `.tscn` and `.gd` files are present in the test folder

### Mouse look not working
- Make sure you clicked in the game window to capture the mouse
- Press ESC to toggle mouse capture
- Check that the game window has focus

### Movement feels wrong
- Movement is now relative to camera direction (where you're looking)
- This is normal for first-person controls
- Try moving and looking simultaneously for better control

### Can't see the cat
- Look around with the mouse - cat starts to the left
- The cat should have a blue/white glow
- If you still can't see it, it may have moved to the first waypoint

### Cat not moving
- Make sure you're not too close (cat waits when player is near)
- Try moving away from the cat
- Check the Godot console for any error messages

### Fog too dense or lighting too dark
- This is intentional for atmosphere
- The cat's glow should make it visible through the fog
- Lighting can be adjusted in the WorldEnvironment node if needed

### Can't click dialogue options
- Press ESC to release the mouse cursor
- Click on the dialogue option buttons
- If buttons don't appear, ensure you waited 2 seconds after proximity message

### Dialogue not appearing
- Make sure you're close enough to clown's body (~2 units)
- Check Godot console for error messages
- Verify InteractionArea exists in ClownBody node

### Cat doesn't spawn
- Ensure you completed the clown body interaction fully
- Wait for all dialogue to complete (including 3-second realization text)
- Check Godot console for spawn message
- Verify BlackCat node exists in scene

### Objective not showing
- Complete the full interaction sequence
- Cat must spawn before objective appears
- Check if HUD node is in the scene
- Look at top-center of screen

### Can walk off edges
- Boundary walls may not be configured correctly
- Check that BoundaryWalls node exists with 4 wall children
- Verify each wall has a CollisionShape3D

### Performance issues
- Scene now includes fog and emission effects
- Should still run at 60 FPS on modern hardware
- If performance is poor, check graphics settings

## Expected Performance
- Smooth 60 FPS on modern hardware
- No stuttering or lag
- Responsive input for both movement and camera
- Fog effects and character model should not significantly impact performance
- Animation system adds minimal overhead

## Next Steps After Testing
Once you've verified everything works:
1. ~~Replace placeholder shapes with actual 3D models~~ ✓ **COMPLETED**: Player now uses FBX model
2. Fine-tune character model scale and collision shape
3. Configure AnimationTree state machine for smooth transitions
4. Add more character animations (walking, landing, turning, interactions)
5. Add animations for the cat (walk, idle, look back)
6. Implement sound effects (meowing, footsteps, ambient sounds)
7. Add particle effects for the cat's glow
8. Apply materials and ghost-like shaders to player model
9. Create more complex waypoint paths
10. Implement progression triggers at waypoints
11. Add UI elements (objectives, hints)

## Report Issues
If you encounter any issues:
1. Note the exact steps that caused the issue
2. Check the Godot console for error messages
3. Take a screenshot if possible
4. Check `FBX_MODEL_INTEGRATION.md` for model-specific troubleshooting
5. Verify all files are present:
   - scene_0.tscn
   - spirit.tscn
   - black_cat.tscn
   - clown_body.tscn
   - spirit_movement.gd
   - cat_guide.gd
   - clown_body_interaction.gd
   - game_manager.gd
   - hud.gd
   - hud.tscn
   - project.godot
   - FBX_MODEL_INTEGRATION.md
   - assets/character/Model/characterMedium.fbx (+ .import)
   - assets/character/Animations/idle.fbx (+ .import)
   - assets/character/Animations/run.fbx (+ .import)
   - assets/character/Animations/jump.fbx (+ .import)
