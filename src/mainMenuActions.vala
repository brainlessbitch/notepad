using Gtk;

class mainMenuActions {
  Notepad notepad;

  public void newFile(Gtk.MenuItem source) {
    textBuffer.text = "";
  }

  public void openFile(Gtk.MenuItem source) {
    var fileChooser = new FileChooserDialog(
      "Open File", notepad, FileChooserAction.OPEN,
      "Cancel", ResponseType.CANCEL, 
      "Open", ResponseType.ACCEPT
    );
    var filter = new FileFilter();
    filter.add_pattern("*.txt");
    filter.set_name("Text files");
    fileChooser.add_filter(filter);

    if (fileChooser?.run() == ResponseType.ACCEPT) {
      var filename = fileChooser.get_filename();
        string fileContents;
          try {
            bool success = GLib.FileUtils.get_contents(filename, out fileContents);
            if (success) {
              textBuffer.text = fileContents;
            } else {
              print("Error reading file\n");
            }
          } catch (GLib.FileError e) {
            print("File error: %s\n", e.message);
          }
  
      fileChooser.destroy();
    }
  }

  public void saveFile(Gtk.MenuItem source) {
    if (fileName != null) {
      save(fileName);
    } else {
      saveFileAs(source);
    }
  }

  public void saveFileAs(Gtk.MenuItem source) {
    var fileChooser = new FileChooserDialog(
      "Save As", notepad, FileChooserAction.SAVE,
      "Cancel", ResponseType.CANCEL, 
      "Save", ResponseType.ACCEPT
    );
    var filter = new FileFilter();
    filter.add_pattern("*.txt");
    filter.set_name("Text files");
    fileChooser.add_filter(filter);

    if (fileChooser.run() == ResponseType.ACCEPT) {
      fileName = fileChooser.get_filename();
      save(fileName);
    }

    fileChooser.destroy();
  }

  public void save(string fileName) {
    try {
      string text = textBuffer.text;
      GLib.FileUtils.set_contents(fileName, text);
    } catch (GLib.FileError e) {
      print("File error: %s\n", e.message);
    }
  }  
}
