#libraries
from solid import *
from solid.utils import *

#3d design
d = cube(15)

#render
scad_render_to_file(d, 'model.scad')
