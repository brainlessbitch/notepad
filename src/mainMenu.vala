using Gtk;

class mainMenu {
  public Gtk.Menu menu() {
    var menu = new Gtk.Menu();

    Gtk.MenuItem newMenuItem = new Gtk.MenuItem.with_label("New");
    //newMenuItem.activate.connect(() => .newFile());
    menu.add(newMenuItem);

    var openMenuItem = new Gtk.MenuItem.with_label("Open");
    //openMenuItem.activate.connect(onOpenClicked);
    menu.add(openMenuItem);

    var saveMenuItem = new Gtk.MenuItem.with_label("Save");
    //saveMenuItem.activate.connect(onSaveClicked);
    menu.add(saveMenuItem);

    var saveAsMenuItem = new Gtk.MenuItem.with_label("Save As");
    //saveAsMenuItem.activate.connect(onSaveAsClicked);
    menu.add(saveAsMenuItem);

    var quitMenuItem = new Gtk.MenuItem.with_label("Quit");
    //quitMenuItem.activate.connect(Gtk.main_quit);
    menu.add(quitMenuItem);

    menu.show_all();
    return menu;
  }
}
