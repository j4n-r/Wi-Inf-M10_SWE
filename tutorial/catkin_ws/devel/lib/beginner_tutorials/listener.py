#!/nix/store/dg4lcw82h6qxy6pq95a48yimn17k8ckw-ros-env/bin/python3
# -*- coding: utf-8 -*-
# generated from catkin/cmake/template/script.py.in
# creates a relay to a python script source file, acting as that file.
# The purpose is that of a symlink
python_script = '/home/j4n-r/dev/uni/Wi-Inf-M10_SWE/tutorial/catkin_ws/src/beginner_tutorials/scripts/listener.py'
with open(python_script, 'r') as fh:
    context = {
        '__builtins__': __builtins__,
        '__doc__': None,
        '__file__': python_script,
        '__name__': __name__,
        '__package__': None,
    }
    exec(compile(fh.read(), python_script, 'exec'), context)
