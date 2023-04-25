# adaptive-audio-player
Adaptive 3D Spatial Audio for Godot 4

**Installation 

1. Extract the files to your project.
2. Create and autoload for player_autoload.gd and name it PlayerAutoload
3. Set PlayerAutoload.player to your player node
4. Add an AdaptiveAudioPlayer node and give it a sound file
5. Play the sound using play_sfx()

**ContinousAdapt vs Adapt Once

Enabling ContinousAdapt will make sure adaptation happens everyframe if not enabled it will only adapt once. If your audio source is dynamic make sure to enable ContinousAdapt


