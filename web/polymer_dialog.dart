import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('polymer-dialog')
class PolymerDialog extends PolymerElement {

  @published bool active = false;

  var escapeKeySub;

  PolymerDialog.created() : super.created() {
  }

  @override
  void enteredView() {
    super.enteredView();
    querySelector('button[close]').onClick.listen((_) => close());
    // get outside element
    document.querySelector('button[polymer-dialog-show]')
      .onClick.listen((_) => show());
    this.escapeKeySub = escapeKeyHandler();
  }

  void show() {
    this.active = true;
  }

  void close() {
    this.active = false;
  }

  // can observe the active attribute
  void activeChanged() {
    if (this.active == true) {
      this.classes.add('opened');
    } else {
      this.classes.remove('opened');
    }
  }

  escapeKeyHandler() {
    return window.onKeyUp.listen((KeyboardEvent e) {
      if (e.keyCode == KeyCode.ESC) this.close();
    });
  }
}
