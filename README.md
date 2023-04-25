# adaptive-audio-player
Adaptive 3D Spatial Audio for Godot 4

**Installation**

1. Extract the files to your project
2. Set aaplayout.tres to be your default bus layout
3. Create and autoload for player_autoload.gd and name it PlayerAutoload
4. Set PlayerAutoload.player to your player node
5. Add an AdaptiveAudioPlayer node and give it a sound file
6. Play the sound using play_sfx()

![image](https://user-images.githubusercontent.com/47716519/234263669-83da348d-4278-4838-8da4-0bb273280832.png)

**Adaption Range**

This is basically the length of the raycasts. 25 seems to be an okay value but you might need to increase it for your own project.

**AAP AutoPlay*

Use this instead of default Autoplay if you want the audio to adapt it's surroundings.

**Debug**

This will print info about the room size and current preset. You might need it to adjust the threshold values. 

**Continuous Adapt**

Enabling ContinuousAdapt will make sure adaptation happens everyframe if not enabled it will only adapt once. If your audio source is dynamic make sure to enable ContinuousAdapt

**Thresholds**

You can adjust thresholds for each preset to your liking. Although I recommend leaving it as is since I find this settings to work best for most situations.

