#include <gtk/gtk.h>
#include <gtk-layer-shell/gtk-layer-shell.h>
#include <cairo.h>

static gboolean on_draw(GtkWidget *widget, cairo_t *cr, gpointer data) {
    int width = gtk_widget_get_allocated_width(widget);
    int height = gtk_widget_get_allocated_height(widget);

    cairo_pattern_t *gradient = cairo_pattern_create_linear(0, 0, 0, height);

    cairo_pattern_add_color_stop_rgba(gradient, 0.0, 0, 0, 0, 0.85);
    cairo_pattern_add_color_stop_rgba(gradient, 0.5, 0, 0, 0, 0.35);
    cairo_pattern_add_color_stop_rgba(gradient, 1.0, 0, 0, 0, 0.0);

    cairo_set_source(cr, gradient);
    cairo_rectangle(cr, 0, 0, width, height);
    cairo_fill(cr);

    cairo_pattern_destroy(gradient);

    return FALSE;
}

static void shutdown_handler(int signum) {
    gtk_main_quit();
}

int main(int argc, char **argv) {
    gtk_init(&argc, &argv);

    GtkWidget *window = gtk_window_new(GTK_WINDOW_TOPLEVEL);

    GdkDisplay *display = gdk_display_get_default();
    GdkMonitor *monitor = gdk_display_get_monitor(display, 0);

    gtk_layer_init_for_window(GTK_WINDOW(window));
    gtk_layer_set_monitor(GTK_WINDOW(window), monitor);

    gtk_layer_set_layer(GTK_WINDOW(window), GTK_LAYER_SHELL_LAYER_BOTTOM);

    gtk_layer_set_anchor(GTK_WINDOW(window), GTK_LAYER_SHELL_EDGE_TOP, TRUE);
    gtk_layer_set_anchor(GTK_WINDOW(window), GTK_LAYER_SHELL_EDGE_LEFT, TRUE);
    gtk_layer_set_anchor(GTK_WINDOW(window), GTK_LAYER_SHELL_EDGE_RIGHT, TRUE);

    gtk_layer_set_margin(GTK_WINDOW(window), GTK_LAYER_SHELL_EDGE_TOP, -2);

    gtk_widget_set_app_paintable(window, TRUE);
    gtk_widget_set_size_request(window, -1, 10);

    g_signal_connect(window, "draw", G_CALLBACK(on_draw), NULL);

    signal(SIGTERM, shutdown_handler);
    signal(SIGINT, shutdown_handler);

    gtk_widget_show_all(window);

    gtk_main();
    return 0;
}
