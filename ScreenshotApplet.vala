using Budgie;
using Gtk;
using GLib;

public class ScreenshotApplet : Budgie.Applet {

    private const string SCREENSHOT_BIN = "org.buddiesofbudgie.BudgieScreenshot";

    public ScreenshotApplet(string uuid) {
        Object();

        var event_box = new Gtk.EventBox();
        event_box.add_events(Gdk.EventMask.BUTTON_PRESS_MASK);

        var icon = new Gtk.Label("");
        icon.set_markup("<span size='9000'>📷</span>");

        event_box.add(icon);
        this.add(event_box);
        this.set_tooltip_text("Screenshot\nLPM: interaktywny\nŚrodkowy: obszar\nPPM: menu");
        this.show_all();

        event_box.button_press_event.connect(on_button_press);
    }

    private bool on_button_press(Gdk.EventButton event) {
        if (event.button == 1) {
            run_screenshot("-i");
        } else if (event.button == 2) {
            run_screenshot("-a");
        } else if (event.button == 3) {
            show_context_menu(event);
        }
        return true;
    }

    private void run_screenshot(string? flag = null) {
        string cmd;
        if (flag != null) {
            cmd = SCREENSHOT_BIN + " " + flag;
        } else {
            cmd = SCREENSHOT_BIN;
        }
        try {
            Process.spawn_command_line_async(cmd);
        } catch (Error e) {
            warning("Błąd uruchamiania screenshota: %s", e.message);
        }
    }

    private void show_context_menu(Gdk.EventButton event) {
        var menu = new Gtk.Menu();

        var item_full = new Gtk.MenuItem.with_label("Cały ekran");
        item_full.activate.connect(() => run_screenshot(null));
        menu.append(item_full);

        var item_area = new Gtk.MenuItem.with_label("Zaznacz obszar");
        item_area.activate.connect(() => run_screenshot("-a"));
        menu.append(item_area);

        var item_interactive = new Gtk.MenuItem.with_label("Interaktywny...");
        item_interactive.activate.connect(() => run_screenshot("-i"));
        menu.append(item_interactive);

        menu.show_all();
        menu.popup_at_pointer(event);
    }
}

public class SimpleScreenshotPlugin : GLib.Object, Budgie.Plugin {

    public Budgie.Applet get_panel_widget(string uuid) {
        return new ScreenshotApplet(uuid);
    }
}

[ModuleInit]
public void peas_register_types(TypeModule module) {
    var objmodule = module as Peas.ObjectModule;
    objmodule.register_extension_type(typeof(Budgie.Plugin), typeof(SimpleScreenshotPlugin));
}
