using Gtk;

class mainMenu {
  public Gtk.Menu menu() {
    var menu = new Gtk.Menu();

    var menuActions = new mainMenuActions();

    Gtk.MenuItem newMenuItem = new Gtk.MenuItem.with_label("New");
    newMenuItem.activate.connect(() => menuActions.newFile(newMenuItem));
    menu.add(newMenuItem);

    var openMenuItem = new Gtk.MenuItem.with_label("Open");
    openMenuItem.activate.connect(() => menuActions.openFile(openMenuItem));
    menu.add(openMenuItem);

    var saveMenuItem = new Gtk.MenuItem.with_label("Save");
    saveMenuItem.activate.connect(() => menuActions.saveFile(saveMenuItem));
    menu.add(saveMenuItem);

    var saveAsMenuItem = new Gtk.MenuItem.with_label("Save As");
    saveAsMenuItem.activate.connect(() => menuActions.saveFileAs(saveAsMenuItem));
    menu.add(saveAsMenuItem);

    var quitMenuItem = new Gtk.MenuItem.with_label("Quit");
    quitMenuItem.activate.connect(() => Gtk.main_quit());
    menu.add(quitMenuItem);

    menu.show_all();
    return menu;
  }
}
