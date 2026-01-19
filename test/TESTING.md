# Testing Instructions for Scene 0 - Narrative Mechanics Update

## Prerequisites
- Godot 4.2 or later installed on Windows
- This project cloned/downloaded to your local machine
- A mouse for first-person camera controls

## Overview of New Mechanics
This update adds narrative-driven mechanics including:
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
- Fog effects should not significantly impact performance

## Next Steps After Testing
Once you've verified everything works:
1. Replace placeholder shapes with actual 3D models
2. Add animations for the cat (walk, idle, look back)
3. Implement sound effects (meowing, footsteps, ambient sounds)
4. Add particle effects for the cat's glow
5. Create more complex waypoint paths
6. Implement progression triggers at waypoints
7. Add UI elements (objectives, hints)

## Report Issues
If you encounter any issues:
1. Note the exact steps that caused the issue
2. Check the Godot console for error messages
3. Take a screenshot if possible
4. Verify all files are present:
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
