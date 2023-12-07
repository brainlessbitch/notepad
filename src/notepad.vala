using Gtk;

class Notepad : Window {
  TextBuffer textBuffer;
  TextView textView;
  string fileName;

  construct {
    title = "Notepad";

    var headerBar = new NotepadHeader();
    set_titlebar(headerBar.headerBar());
    set_default_size(400, 300);

    textBuffer = new TextBuffer(null);
    textView = new TextView.with_buffer(textBuffer);
        
    textView.set_wrap_mode(WrapMode.WORD);

    var scrolledWindow = new ScrolledWindow(null, null);
    scrolledWindow.add(textView);

    scrolledWindow.set_margin_top(12);
    scrolledWindow.set_margin_end(12);
    scrolledWindow.set_margin_bottom(12);
    scrolledWindow.set_margin_start(12);

    var vbox = new Box(Gtk.Orientation.VERTICAL, 0);
    vbox.pack_start(scrolledWindow, true, true, 0);

    add(vbox);

    delete_event.connect(() => {
      Gtk.main_quit();
      return false;
    });
  }
}

int main(string[] args) {
    Gtk.init(ref args);

    var app = new Notepad();
    app.show_all();

    Gtk.main();

    return 0;
}
