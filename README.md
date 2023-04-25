# adaptive-audio-player
Adaptive 3D Spatial Audio for Godot 4

**Installation**

1. Extract the files to your project
2. Set aaplayout.tres to be your default bus layout
3. Create and autoload for player_autoload.gd and name it PlayerAutoload
4. Set PlayerAutoload.player to your player node
5. Add an AdaptiveAudioPlayer node and give it a sound file
6. Play the sound using play_sfx()

**Continuous Adapt**

Enabling ContinuousAdapt will make sure adaptation happens everyframe if not enabled it will only adapt once. If your audio source is dynamic make sure to enable ContinuousAdapt

![image](https://user-images.githubusercontent.com/47716519/234263183-af5a40a6-9674-4aec-8f49-7ae2c0b4da92.png)

**Thresholds**

You can adjust thresholds for each preset to your liking. Although I recommend leaving it as is since I find this settings to work best for most situations.
