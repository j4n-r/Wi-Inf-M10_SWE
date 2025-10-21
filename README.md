
### Start turtlebot demo
``` fish
roslaunch turtlebot3_gazebo turtlebot3_world.launch
```
 
### ROS Commands

```fish
catkin_make             # in dir with src/ else empty -> creates new workspace
catkin_make             # in dir with src/CMakeLists.txt -> Builds project
roscore                 # main application for the infra 
ros_console             # see all the messages from pubs and subs
source devel/setup.fish # setup env vars etc.
```

##### From Claude
### Essential ROS 1 Commands

**Workspace & Building:**
```fish
catkin_make                              # Build workspace (run from workspace root)
catkin_create_pkg pkg_name dependencies  # Create new package
source devel/setup.bash                  # Source workspace after building
```

**Core Operations:**
```fish
roscore                                  # Start ROS master (required first)
rosrun package_name node_name            # Run a single node
roslaunch package_name launch_file       # Launch multiple nodes from .launch file
```

**Nodes:**
```fish
rosnode list                             # List active nodes
rosnode info /node_name                  # Get info about a specific node
rosnode kill /node_name                  # Kill a running node
```

**Topics:**
```fish
rostopic list                            # List all active topics
rostopic echo /topic_name                # Display messages published to a topic
rostopic info /topic_name                # Show topic type and publishers/subscribers
rostopic hz /topic_name                  # Show publishing rate
rostopic pub /topic_name type data       # Publish message to a topic
```

**Messages & Services:**
```fish
rosmsg list                              # List all message types
rosmsg show message_type                 # Show message definition
rossrv list                              # List all service types
rossrv show service_type                 # Show service definition
rosservice list                          # List available services
rosservice call /service_name args       # Call a service
```

**Parameters:**
```fish
rosparam list                            # List parameters
rosparam get /param_name                 # Get parameter value
rosparam set /param_name value           # Set parameter value
```

**Packages & Navigation:**
```fish
rospack list                             # List all packages
rospack find package_name                # Find package location
roscd package_name                       # Navigate to package directory
```

**Recording & Playback:**
```fish
rosbag record -a                         # Record all topics
rosbag record /topic1 /topic2            # Record specific topics
rosbag play bagfile.bag                  # Play back recorded data
rosbag info bagfile.bag                  # Get info about bag file
```

**Transforms (TF):**
```fish
rosrun tf view_frames                    # Generate PDF of TF tree
rosrun tf tf_echo /frame1 /frame2        # Show transform between frames
```

**Diagnostics & Visualization:**
```fish
roswtf                                   # Diagnose ROS setup issues
rqt_graph                                # Visualize node/topic graph
rqt_console                              # GUI for log messages
```

**Environment:**
```fish
echo $ROS_PACKAGE_PATH                   # Check package path
printenv | grep ROS                      # See all ROS environment variables
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

