# Testing Instructions for Scene 0

## Prerequisites
- Godot 4.2 or later installed on Windows
- This project cloned/downloaded to your local machine

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

### 3. Test Player Movement
Test the Spirit (player) movement:
- Press **W** or **↑** (Up Arrow) - Spirit should move forward
- Press **S** or **↓** (Down Arrow) - Spirit should move backward
- Press **A** or **←** (Left Arrow) - Spirit should move left
- Press **D** or **→** (Right Arrow) - Spirit should move right
- Try diagonal movement by pressing two keys at once (e.g., W+A)

**Expected Behavior:**
- The Spirit should move smoothly across the ground plane
- The camera should follow the Spirit from a third-person perspective
- Movement should be responsive and immediate

### 4. Test Follower AI
Test the Black Cat follower behavior:
1. Move the Spirit around the scene
2. Observe the Black Cat (box-shaped placeholder to the left of spawn)

**Expected Behavior:**
- When the Spirit is far away (>2 units), the Black Cat should follow
- When the Spirit is close (<2 units), the Black Cat should stop
- The Black Cat should move at a slower speed than the Spirit
- The Black Cat should maintain a reasonable distance

### 5. Verify Scene Elements
Look around the scene to verify all elements are present:

**Environment:**
- ✓ Ground plane (20x20 gray surface)
- ✓ Four forest placeholders (tall boxes at corners)
- ✓ Directional lighting with shadows

**Characters:**
- ✓ Spirit of the Clown (white capsule at center)
- ✓ Black Cat (small box, starts to the left)
- ✓ Clown's Dead Body (laying capsule, to the right)

### 6. Test Camera
- The camera should be positioned behind and above the Spirit
- The camera should follow the Spirit's movement
- You should be able to see the entire scene clearly

## Troubleshooting

### Scene doesn't load
- Ensure you opened the correct `project.godot` file from the `test` folder
- Check that all `.tscn` files are present in the test folder

### Movement not working
- Make sure the game window has focus (click on it)
- Try using both arrow keys and WASD
- Check that no error messages appear in the Godot console

### Black Cat not following
- Make sure you moved far enough away (>2 units)
- Check the Godot console for any error messages
- The follower target is set to `../Spirit` in the scene

### No shadows or lighting
- This might be a graphics driver issue
- Check Godot's rendering settings (Project > Project Settings > Rendering)

## Expected Performance
- Smooth 60 FPS on modern hardware
- No stuttering or lag
- Instant response to input

## Next Steps After Testing
Once you've verified everything works:
1. Replace placeholder shapes with actual sprites/models
2. Add animations for character movement
3. Enhance the environment with more details
4. Add UI elements (health, inventory, etc.)
5. Implement game logic and objectives

## Report Issues
If you encounter any issues:
1. Note the exact steps that caused the issue
2. Check the Godot console for error messages
3. Take a screenshot if possible
4. Verify all files are present and not corrupted
