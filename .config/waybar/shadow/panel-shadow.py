#!/usr/bin/env python
import os
import gi
gi.require_version('Gtk', '3.0')
gi.require_version('GtkLayerShell', '0.1')
from gi.repository import Gtk, Gdk, GdkPixbuf, GtkLayerShell

dirname = os.path.dirname(__file__)
shadow_file = os.path.join(dirname, './shadow.png')

# Screen width for main monitor
monitor = Gdk.Display.get_default().get_monitor(0)
screen_width = monitor.get_geometry().width

pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(shadow_file,screen_width,-1,False)
shadow = Gtk.Image.new_from_pixbuf(pixbuf)

layer = Gtk.Window()
layer.add(shadow)
layer.set_app_paintable(True)

# Vertical offset
offset = -3

GtkLayerShell.init_for_window(layer)
GtkLayerShell.set_monitor(layer, monitor)
GtkLayerShell.set_layer(layer, GtkLayerShell.Layer.BOTTOM)
GtkLayerShell.set_margin(layer, GtkLayerShell.Edge.TOP, offset)
GtkLayerShell.set_anchor(layer, GtkLayerShell.Edge.TOP, 1)
GtkLayerShell.set_namespace(layer, 'panel-shadow')

layer.show_all()
layer.connect('destroy', Gtk.main_quit)
Gtk.main()
