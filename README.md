# ![aap](https://user-images.githubusercontent.com/47716519/234524450-b446aec0-6ad6-4919-b9e1-b75e6710016a.svg) adaptive-audio-player
Adaptive 3D Spatial Audio for Godot 4
* Fully dynamic 3d audio with 13 presets

Adaptive audio is an audio player that will adapt to it's surroundings. It will apply effects accordingly to make the sounds more immersive. Like if it's played in an open area it will apply an echo or if it's played in a room it will apply a reverb. It also approximately calculates the room size to determine the reverberation size. It will also dampens the audio if it's blocked. 

The addon is free to use for all purposes. I would appreciate proper credit!

## ✨Installation

1. Move adaptive-audio-player-main into your project files
2. Set aaplayout.tres to be your default bus layout
3. Create an autoload for player_autoload.gd and name it PlayerAutoload*
4. Set PlayerAutoload.player to your player node*
5. Reload your project
6. Add an AdaptiveAudioPlayer node and give it a sound file
7. Play the sound using play_sfx()*

![image](https://user-images.githubusercontent.com/47716519/234263669-83da348d-4278-4838-8da4-0bb273280832.png)

**Adaption Range**

This is basically the length of the raycasts. 25 seems to be an okay value but you might need to increase it for your own project.

**AAP AutoPlay**

Use this instead of default Autoplay if you want the audio to adapt it's surroundings.

**Debug**

This will print info about the room size and current preset. You might need it to adjust the threshold values. 

**Continuous Adapt**

Enabling ContinuousAdapt will make sure adaptation happens everyframe if not enabled it will only adapt once. If your audio source is dynamic make sure to enable ContinuousAdapt

**Thresholds**

You can adjust thresholds for each preset to your liking. Although I recommend leaving it as is since I find this settings to work best for most situations.

## Bus Layout

![image](https://user-images.githubusercontent.com/47716519/234528528-cc2be19f-bf96-413d-b687-aacd1ced839a.png)

You can edit each preset to your liking as well.

## ✨Demo

![image](https://user-images.githubusercontent.com/47716519/234267702-1e24c9ae-0c61-4c3e-bc03-bb1a83ab5cd6.png)

Check out the demo here:
https://berryberryniceu.itch.io/adaptive-audio-for-godot-demo

## Video Tutorial

https://youtu.be/5Gm767RLKRg

#### Notes:
**Using play() will play the audio but won't adapt so use play_sfx() instead*

**Steps 3 and 4 is optional but recommended*
