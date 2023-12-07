using Gtk;
using Gdk;

class NotepadHeader {
  public HeaderBar headerBar() {
    var headerBar = new HeaderBar();

    headerBar.set_show_close_button(true);
    headerBar.set_title("Notepad");

    var menuButton = new Button.from_icon_name("open-menu-symbolic", IconSize.BUTTON);
    var mainMenu = new mainMenu();

    menuButton.clicked.connect(() => {
      mainMenu.menu().popup_at_widget(menuButton, Gravity.SOUTH, Gravity.NORTH, null);
    });

    headerBar.pack_start(menuButton);

    return headerBar;
  }
}
