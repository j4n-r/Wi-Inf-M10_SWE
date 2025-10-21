

### Start turtlebot demo
``` fish
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```

### Fix fish setup
Looks like this is not needed !!!

Add this file `devel/etc/catkin/profile.d` with this content:
``` fish
# generated from rosbash/env-hooks/15.rosbash.fish.em
if test -z "$CATKIN_ENV_HOOK_WORKSPACE"
    set -gx CATKIN_ENV_HOOK_WORKSPACE "/nix/store/vw707c1n2h936sswvh3w81gl3w1zdm2k-ros-noetic-rosbash-1.15.10-r1"
end
source "$CATKIN_ENV_HOOK_WORKSPACE/share/rosbash/rosfish"
```
 
You maybe have to set `set -gx CATKIN_SHELL fish` (should be already set in flake.nix)

