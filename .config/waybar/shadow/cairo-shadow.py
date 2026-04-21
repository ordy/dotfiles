#!/usr/bin/env python3
import gi
import cairo
import signal

gi.require_version("Gtk", "3.0")
gi.require_version("GtkLayerShell", "0.1")
from gi.repository import Gtk, Gdk, GtkLayerShell

class ShadowBar(Gtk.Window):
    def __init__(self):
        super().__init__()

        monitor = Gdk.Display.get_default().get_monitor(0)

        GtkLayerShell.init_for_window(self)
        GtkLayerShell.set_monitor(self, monitor)

        GtkLayerShell.set_layer(self, GtkLayerShell.Layer.BOTTOM)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.TOP, True)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.LEFT, True)
        GtkLayerShell.set_anchor(self, GtkLayerShell.Edge.RIGHT, True)
        # vertical offset
        GtkLayerShell.set_margin(self, GtkLayerShell.Edge.TOP, -2)

        self.set_app_paintable(True)
        # size of the shadow (width,height) -1: ignore
        self.set_size_request(-1,10)
        self.connect("draw", self.on_draw)

    def on_draw(self, widget, cr):
        width = self.get_allocated_width()
        height = self.get_allocated_height()

        gradient = cairo.LinearGradient(0, 0, 0, height)
        gradient.add_color_stop_rgba(0.0, 0, 0, 0, 0.85)
        gradient.add_color_stop_rgba(0.5, 0, 0, 0, 0.35)
        gradient.add_color_stop_rgba(1.0, 0, 0, 0, 0.00)

        cr.set_source(gradient)
        cr.rectangle(0, 0, width, height)
        cr.fill()
        return False

    def shutdown(self, sig, frame):
        Gtk.main_quit()

win = ShadowBar()
signal.signal(signal.SIGTERM, win.shutdown)
signal.signal(signal.SIGINT, win.shutdown)
win.show_all()

Gtk.main()
