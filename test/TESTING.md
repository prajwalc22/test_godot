# Testing Instructions for Scene 0 - First-Person Update

## Prerequisites
- Godot 4.2 or later installed on Windows
- This project cloned/downloaded to your local machine
- A mouse for first-person camera controls

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

### 5. Test Cat Guide AI
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

### 6. Test Atmospheric Elements
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

### 7. Verify Scene Elements
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

### 8. Test Complete Gameplay Loop
Follow the cat through a complete sequence:
1. Start the game and capture the mouse
2. Follow the glowing cat as it moves
3. Observe the cat stopping when you fall behind
4. Watch the cat looking back at you
5. Continue following until the cat reaches all waypoints

**Expected Behavior:**
- Cat provides clear visual guidance
- Waiting behavior prevents losing the guide
- Looking back behavior adds character to the AI
- Complete sequence feels like a guided tour

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
   - spirit_movement.gd
   - cat_guide.gd
   - project.godot
