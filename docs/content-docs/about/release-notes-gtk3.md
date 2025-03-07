---
title: About Gtk3 Release Notes
nav_menu: default-nav
sidebar_menu: about-sidebar
layout: sidebar
---
# Release notes

#### 2021-03-18 0.36.4:
* Improve documentation of **Gnome::Gtk3::Widget** and  **Gnome::Gtk3::MenuButton**. Also methods are added and new tests.

#### 2021-03-02 0.36.3:
* Removed dependency on **Gnome::Glib::OptionContext**. All classes needed to process commandline arguments, like this one, are removed or not implemented until I am realy sure that it will add more functionality than we already have using `MAIN()`, `USAGE()` and `@*ARGS`. Besides that, a lot of option processing modules are available. Take for example **Getopt::***, there are _**11**_ modules!.

#### 2021-03-02 0.36.2:
Please note that in this version a few API modifications are made to some of the methods, e.g. in **Gnome::Gtk3::ColorChooser**. In the future more of this kind of changes will take place because of the implementation of real methods as opposed to the search methods starting in a FALLBACK().
Implementation of methods alongside each native subroutine was started because it made the access to the native subroutines faster.
Because those methods are then implemented in the same module, it is also clear, most of the time, what type of object is returned. It is then also possible to return the Raku object instead of the native object.
Other changes are also applied. For instance, `gboolean` values become truly `Bool` instead of the `Int` returned from the native sub. Also enumerated values can be correctly returned through the use of the method.

For example originally the call to `gtk_color_chooser_get_rgba()` defined in **Gnome::Gtk3::ColorChooser**, you had to do;
```
my Gnome::Gdk3::RGBA $r .= new(:native-object($ccd.get-rgba));
```
while now you can
```
my Gnome::Gdk3::RGBA $r = $ccd.get-rgba;
```
My sincere apologies for breaking code 😐. It is however not possible, to my knowledge, to create multi's based on return types. For the moment, the calls to any of the routines `gtk_color_chooser_get_rgba()` and `get_rgba()`still work, though not documented anymore. At a later date, a deprecation warning will be given and after some while later, all the undocumented routines are removed.

#### 2021-02-17 0.36.1:
* Adjusted **Gnome::Gtk3::Application**. It inherits from **Gnome::Gio::Application** so it was not necessary to implement the role **Gnome::Gio::ActionMap** because **Gnome::Gio::Application** already does that.
* Remove calls to `_orientable_interface()` and method in **Gnome::Gtk3::Orientable**.
* Updated docs and tests of **Gnome::Gtk3::Buildable** and **Gnome::Gtk3::Main**.
* Initializing **Gnome::Gtk3::Main** is now without calling `.init-check()`, option `:check` to `.new()` has no function anymore. Call `.init-check()` explicitly if need be. Most of the time working with any class inheriting from **Gnome::GObject::Object** has this part covered.
* Added new interface **Gnome::Gtk3::Actionable**.
* Updated docs and tests of **Gnome::Gtk3::ColorChooser**. Also found bugs in modules using ColorChooser. Those modules did not correctly found the signal `color-activated` from the interface.

* There are some changes `Gnome::Gio`;
  * Added and improved are Action, SimpleAction, ActionGroup and SimpleActionGroup.
  * The MenuModel is split up in MenuModel, MenuAttributeIter and MenuLinkIter.
  * Add new module **Gnome::Gio::Menu**. Directly split into Menu and MenuIter.

* Also Some changes in `Gnome::GObject`;
  * Added a new named argument to the call to a signal handler. Besides `:$_widget` and `:_handlder-id` the argument `:_native-object` is added. Usable when the value in `$_widget` is invalid.

#### 2021-01-21 0.36.0:
* New role **Gnome::Gtk3::RecentChooser**. This module is now used in an older module **Gnome::Gtk3::RecentChooserMenu**.
* Building up the rest of the recently used files modules with **Gnome::Gtk3::RecentManager**, **Gnome::Gtk3::RecentInfo**, **Gnome::Gtk3::RecentFilter**, **Gnome::Gtk3::RecentChooserWidget** and **Gnome::Gtk3::RecentChooserDialog**.

#### 2021-01-18 0.35.1:
* New module **Gnome::Gtk3::CheckMenuItem**, **Gnome::Gtk3::SeparatorMenuItem** and **Gnome::Gtk3::RadioMenuItem**.
* Document fixes of MessageDialog module.

#### 2021-01-11 0.35.0:
* Grid and Orientable speedup with new methods. Tests and benchmarking added and docs improved.
* New module **Gnome::Gtk3::Fixed**

#### 2021-01-11 0.34.9:
* Test cut off by check of `raku_test_all` env variable to shorten total test time.

#### 2021-01-07 0.34.8:
* Document fixes of Scale module and add UML diagram.

#### 2021-01-06 0.34.7:
* Scale speedup with new methods. Tests and benchmarking added and docs improved.

#### 2021-01-03 0.34.6:
* Label speedup with new methods. Tests and benchmarking added and docs improved.
* Bugfix in TreeModel. Caused by changes in helper function `_f()` in **Gnome::N::TopLevelClassSuppert**.

#### 2020-12-29 0.34.5:
* Bugfixes in **Gnome::Gtk3::AboutDialog**.

#### 2020-12-21 0.34.4:
* Speeding up **Gnome::Gtk3::Assistant** and modify documents. Also make Assistant inheritable.

#### 2020-12-21 0.34.3:
* **Gnome::Gtk3::AboutDialog** speedup by adding methods for many native subroutines. Speedup is about 8 times faster. Documentation is modified to show the most useful call. Also **Gnome::Gtk3::Widget** has a few methods added which gives a speedup of about 2.5 times.
* Testing of some modules is shortened. The idea is to do it with all test scripts. Setting an environment variable `raku_test_all` will then run through all tests. This will make the testing phase shorter. However, installing will still take much time.

#### 2020-11-24 0.34.2:
* Bugfixes in tests

#### 2020-11-24 0.34.1:
* Doc changes;
  - using **Gnome::N::GlibToRakuTypes**, types are replaced with types from that module giving a benefit of central coordination of glib types while keeping the native subs as closely as they are described.
* AboutDialog; changed some native subs to get rid of the use of CArray[] looking from the users side.
* Bug fix in TreeModel. `.gtk_tree_model_get_column_type()` should return uint32 instead of int32 because returned type is unsigned. This will be replaced by GType from GlibToRakuTypes mentioned above.

#### 2020-11-15 0.34.0:
* Add module **Gnome::Gtk3::Tooltip**.
* Bugfixes in the TreeView set of modules.
* Also added methods and docs added with tests.
* Bugfixes in **Gnome::GObject::Object** and **Gnome::GObject::Signal**. The return value of a signal handler set using `.register-signal()` was processed wrong and was always thrown away.

#### 2020-11-15 0.33.0:
* Add module **Gnome::Gtk3::SpinButton**.
* Some bugs removed from **Gnome::Gtk3::Adjustment**. Also completed testing and documenting.
* Removed deprecations due since version 0.30.0
* Added init options :png and :icon-name to `.new()` of **Gnome::Gtk3::Image**. Also added tests. Needed to extend **Gnome::Cairo::ImageSurface** with new options.
* Changed gtk_image_get_storage_type in Image to return GtkImageType type as the documentation says
* Added and tested a few other methods to Image.

#### 2020-10-24 0.32.0:
* Add module **Gnome::Gtk3::FileChooserButton**.
* A warning: In the coming versions many obsoleted implementations are due to be removed.

#### 2020-10-15 0.31.0:
* Add module **Gnome::Gtk3::StatusBar**.

#### 2020-10-04 0.30.1:
* Made Label inheritable.

#### 2020-10-04 0.30.0:
* Add modules Gnome::Gtk3::IconTheme and Gnome::Gtk3::IconView.
* Made UML diagrams more consistent with other diagrams from other modules.

#### 2020-09-22 0.29.3:
* Completed documentation and tests for Gnome::Gtk3::Stack

#### 2020-08-27 0.29.2:
* Add class Revealer to Gnome::Gtk3

#### 2020-07-09 0.29.1:
* Extending window tutorial.
* Added Signal tutorial.
* Repaired an accidently removed navigation file from the doc site.
* Changes in Gnome::Gtk3::Widget;
* Dropped .gtk_widget_init_template(), .gtk_widget_get_template_child() and several other template methods
* Modified the structure types of `GdkEvent*` into `N-GdkEvent*` in Gnome::Gdk3::Events. The older types are deprecated and are removed in version 0.20.0 of the Gnome::Gdk3 package.

#### 2020-07-09 0.29.0:
* Changes in Gnome::Gtk3::Widget;
* Add .destroy(), .show(), .hide(), .draw()  methods to minimize function name size. E.g. draw() calls gtk_widget_draw() which could only be shortened to widget_draw().
* Add .gtk_widget_set_no_show_all(), .gtk_widget_get_no_show_all() subs.
* Dropped .gtk_widget_queue_resize(), .gtk_widget_queue_resize_no_redraw() .gtk_widget_queue_allocate(), .gtk_widget_event(), .gtk_widget_send_focus_change(), .gtk_widget_set_has_window(), .gtk_widget_set_realized(), .gtk_widget_set_mapped(), .gtk_widget_set_parent(), .gtk_widget_set_parent_window(), .gtk_widget_set_child_visible(), .gtk_widget_get_child_visible(), .gtk_widget_set_allocation(), .gtk_widget_set_clip()
* Renamed GtkAllocation to N-GtkAllocation.
* Tests are added for subs and properties.
* Cleaning up documentation.

#### 2020-06-09 0.28.7:
* Gnome::Gtk3::Widget module work;
* Documentation improved
* Add more tests
* Dropped methods gtk_widget_destroyed, gtk_widget_unparent

#### 2020-06-09 0.28.6:
* Add Gnome::Gtk3::DrawingArea. First experiments to use Cairo.
* It is a pitty that I cannot use the Raku Cairo package of Timo because I cannot fit it into the calls of the existing Gnome packages. An entire new project is created called Gnome::Cairo. Need to mention that Cairo is not a Gnome product but named here this way because the way to access the classes and methods are about the same as with the other Gnome projects of mine.
* Added gtk_widget_draw() to Gnome::Gtk3::Widget and tested the draw signal.
* Added gdk_window_create_similar_surface() and gdk_window_create_similar_image_surface() to Gnome::Gdk3::Window.
* Modified convert-to-natives() in Gnome::N::TopLevelClassSupport that it checks for destination argument type. When it detects num32 or num64 all source values are coerced using .Num(). This means that next examples are now valid for Num arguments; 10, 1/2, 0e2, '2.3' (these are Int, Rat, Num and Str resp).

#### 2020-05-21 0.28.5:
* 'Changes for issue #11'

#### 2020-05-15 0.28.4:
* Several parts in Gnome::GObject and Gnome::N are improved.
* Started to cleanup documentation of Gnome::Gtk3::Window.

#### 2020-05-04 0.28.3:
* Modules using interfaces are rewritten in such a way that the interface is only mixed in the top most class where the interface is used.

#### 2020-04-28 0.28.2:
* Some improvements to start-thread() in Gnome::GObject::Object.
* Method register-signal() now returns an integer instead of a boolean. This integer is a handler-id which can be used to disconnect the signal with g_signal_handler_disconnect(). When handler is 0, the registration failed. The other method to connect a signal is g_signal_connect_object() which will also return a handler id.
* Added .new(:icon-name) to Gnome::Gtk3::Button and made the class inheritable.
* Added a Uml diagram to AboutDialog and Button.

#### 2020-04-17 0.28.1:
* Made Gnome::Gtk3::CheckButton, Gnome::Gtk3::Scale, Gnome::Gtk3::Image, Gnome::Gtk3::Entry and Gnome::Gtk3::RadioButton inheritable.
* Added a few multi to submethod BUILD to create an image from pixbufs and resources.

#### 2020-04-17 0.28.0:
* Added modules Gnome::Gtk3::TreeSelection, Gnome::Gtk3::Popover, Gnome::Gtk3::PopoverMenu and Gnome::Gtk3::Separator.
* Add 'CATCH { default { .message.note; .backtrace.concise.note } }' to callback code in modules Gnome::GObject::Object and Container, ListBox, TextTagTable and TreeModel in Gnome::Gtk3. This prevents the situation that a moarvm panic occurs without a stackdump to follow. This improves the search for errors and typos very much.
* Enabled gtk_tree_view_expand_to_path(), gtk_tree_view_row_expanded(), gtk_tree_view_expand_row() and gtk_tree_view_collapse_row() in Gnome::Gtk3::TreeView.
* $str.chars() changed into $str.encode.bytes in a few places. This is the correct lenght, thanks Alain Barbason.

#### 2020-04-11 0.27.5:
* Enabled method gtk_tree_view_get_cell_area(), gtk_tree_view_get_selection() in Gnome::Gtk3::TreeView
* Enabled method gtk_menu_popup-at-widget(), gtk_menu_popup_at_rect() in Gnome::Gtk3::Menu.
* Cleanup and some modifications in Gnome::Gtk3::TreeStore.
* Added `gdk_pixbuf_get_type()` in Gnome::Gdk3::Pixbuf to support a missing type GDK_TYPE_PIXBUF. This cannot be encoded because it is not a fundamental type like G_TYPE_INT.
* Made classes ApplicationWindow, Application, Dialog, AboutDialog, MessageDialog, Grid, RecentChooserMenu, Notebook, TreeView and TreeStore in Gnome::Gtk3 inheritable.

#### 2020-04-06 0.27.4:
* Enabled method gtk_label_set_markup() in Gnome::Gtk3::Label.
* Enabled method gtk_builder_connect_signals_full in Gnome::Gtk3::Builder.
* Modified gtk_builder_new_from_string( $text, $text.chars), so that the length can be left out and the argument is now deprecated.

#### 2020-04-06 0.27.3:
* Enabled method g_type_name_from_instance() to Gnom::GObject::Type.

#### 2020-04-05 0.27.2:
* Removed a level of exception handling to get a stackdump when an error is encountered. Somehow this stack dump is unavailable in some situations.

#### 2020-04-04 0.27.1:
* Many changes in example programs for deprecated code.

#### 2020-03-24 0.27.0:
* Add modules Adjustment, ScrolledWindow, PlacesSidebar, RecentChooserMenu, and ScrolledWindow in Gnome::Gtk3.
* Gnome::N::TopLevelClassSupport is implemented in Gnome::Glib and Gnome::GObject. Gnome::Gio must still be checked.

#### 2020-03-23 0.26.3:
* Provide gtk_css_provider_to_string() method to the CssProvider class.

#### 2020-03-15 0.26.2:
* Developed a top level support class Gnome::N::TopLevelClassSupport to be used by all Gnome classes living at the top of the foodchain. Example classes which will use this class are Gnome::GObject::Object, Gnome::Glib::Error, etc. These changes should be invisible to the user.

#### 2020-03-09 0.26.1:
* bugfixes in tests. Tests are skipped because of dependencies on language and other implementation details of GTK+.

#### 2020-03-08 0.26.0:
* Add modules GAction, GSimpleAction to Gnome::Gio
* Add modules GVariantType, GVariant to Gnome::Glib
* Many changes and bugfixes under the hood in all packages

#### 2020-02-29 0.25.3:
* Add gtk_builder_new_from_resource(), gtk_builder_add_from_resource() and .new(:resource) to Gnome::Gtk::Builder.

#### 2020-02-25 0.25.2:
* Bugfixes in the Application module in Gio and Gtk.

#### 2020-02-25 0.25.1:
* add-gui() from Gnome::Gtk3::Builder is removed in favor of gtk_builder_add_from_file() and gtk_builder_add_from_string().
* Old version of gtk_builder_add_from_file() and gtk_builder_add_from_string() is removed.
* Removed .new(:label) in favor of .new(:text) in Gnome::Gtk3::Label.
* Bugfixed in ApplicationWindow module

#### 2020-02-25 0.25.0:
* Add Assistant module in Gnome::Gtk3.
* Bugfixes and document updates.
* Many deprecated parts in Gnome::Gtk3 would be removed at version 0.24.0 but will be postponed until 0.30.0.

#### 2020-02-23 0.24.0:
* Add modules Application and ApplicationWindow in Gnome::Gtk3. This introduced the Gnome::Gio package with the modules Application, Enums and MenuModel.

#### 2020-02-17 0.23.3:
* Bug fixed in ColorButton. Missing implementation of an interface ColorChooser.
* TextView method `gtk_text_buffer_set_text()` is improved. The length of a string is no longer needed.

#### 2020-02-05 0.23.2:
* Add gtk_container_foreach to Container
* Add gtk_list_box_selected_foreach to ListBox
* Add gtk_text_tag_table_foreach to TextTagTable
* Modified gtk_tree_model_foreach in TreeModel

#### 2020-02-05 0.23.1:
* Adjust **Gnome::Gtk3::Widget** method `gtk_widget_get_allocation()`
* Add module ToolItem, ToolButon

#### 2020-02-01 0.23.0:
* Add module Stack, StackSwitcher, StackSidebar, Notebook in Gnome::Gtk3

#### 2020-01-22 0.22.0:
* Add module Frame, AspectFrame, Spinner, Switch, ProgressBar, MessageDialog in Gnome::Gtk3

#### 2020-01-18 0.21.3:
* renaming calls to `*native-gobject()` and `*native-gboxed()`.
* rename `:widget` to `:native-object`.
* remove `:empty` and use empty options hash instead

#### 2020-01-10 0.21.2:
* Repo renaming. All perl6-gnome-* packages renamed to 'gnome-*'.
* All texts Perl\s*6 or p6 is renamed to Raku or raku depending on use.
* Some image files wit perl6 in the name are renamed.
* Remaining tasks of renaming process comes at a later phase when v6.e or even v6.f.
  - Change of extensions
  - Change of methods '.perl()' and variables '$*PERL'

#### 2019-12-16 0.21.1:
* Bugfixes in gtk_list_store_remove() in ListStore and TreeStore.

#### 2019-12-07 0.21.0:
* Added new modules CellRendererCombo, CellRendererSpinner, CellRendererAccel, CellRendererSpin, CellRendererPixbuf
* Small changes in Gnome::Gtk3::TreeStore gtk_tree_store_set_value().

#### 2019-12-02 0.20.0:
* New modules CellRendererToggle, CellRendererProgress
* Method names can now be used in several ways. Please take a look at the design notes.

#### 2019-11-23 0.19.4:
* Changes in tests caused by Gnome::Glib
* New module TreeStore. Needs more tests

#### 2019-11-23 0.19.3:
* Bugfix: calling .get-text() on a Label could call get the sub from Entry if that one is used before. This is caused by the caching mechanism which did not save the sub address along with the module where it came from.
* Modified _fallback routines to change order of tests

#### 2019-11-06 0.19.2:
* Add modules ListStore, TreeView, TreeIter, TreePath, TreeViewColumn, TreeModel in Gnome::Gtk3

#### 2019-10-27 0.19.1:
* Rewrite of classes to handle interface roles differently. This caused some changes in the interface modules, the classes which use the interfaces and the Interface module from Gnome::GObject was removed.

#### 2019-10-21 0.19.0:
* New classes added in Gnome::Gtk3; Buildable.

#### 2019-08-08 0.18.5:
* The handler arguments list is changed when register-signal() from Gnome::GObject::Object is used. Some positional arguments, which were named arguments before, are oblegatory as well as their types. Most of them are unchanged because they did not receive extra data. For example the 'clicked' signal for a Button. Others like event processing are changed. E.g. 'button-press-event' on a window was returned on the :$event named argument. Now this has become the first positional argument with a type 'GdkEvent'.

* One can connect also directly using g_signal_connect_object() from Gnome::GObject::Signal. Also here, the handler must provide all arguments and types and some more.

* Added a method in Gnome::GObject::Object for interface using modules to query the interface modules for native subs. For example, the module Gnome::Gtk3::Button implements Gnome::Gtk3::Buildable. This means that subs defined there can be used by the Button module. Not all interfaces are implemented however, but the unimplemeted modules are silently ignored until a method is not found which will throw an exception.

* The new() method in module Label of Gnome::Gtk3 is modified. The named attribute :$label is renamed into :$text. :$label is deprecated.

#### 2019-08-29 0.18.4:
* Experimenting with variable argument list in module FileChooserDialog to get buttons on the dialog.
* Extended, documented and tested FileChooserDialog.

#### 2019-08-27 0.18.3:
* Extend FileChooser in Gnome::Gtk3. Added also some tests and pod doc.
* Extend Type in Gnome::GObject and added doc and tests.

#### 2019-08-04 0.18.2:
* Removed an accidentaly created module `ImageMenuItem` which was deprecated by Gtk since version 3.10.
* Gnome::GObject::Object modified to better check for undefined values before casting.
* Added module Gnome::GObject::Param to handle N-GParamSpec native objects.
* fallback() methods renamed to _fallback()

#### 2019-08-04 0.18.1:
* Completed doc and tests of ColorChooser in Gnome::Gtk3.

#### 2019-08-04 0.18.0:
* Extended, tested and documented CssProvider and StyleContext in Gnome::Gtk3.
* Added StyleProvider to Gnome::Gtk3, altough it is a very empty shell :-\.
* Added GtkBorder and GtkWidgetPath to Gnome::Gtk3.
* Small change in TextIter in Gnome::Gtk3. It needs :empty named argument now when creating.

#### 2019-08-04 0.17.12:
* Builder pod doc
* Builder tests using Gnome::Glib::Error

#### 2019-08-04 0.17.11:
* Modified Builder in Gnome::Gtk3 to handle returned errors properly.

#### 2019-07-29 0.17.10:
* Extended, tested and documented Container in Gnome::Gtk3.
* Extended Error in Gnome::Glib
* Added Quark in Gnome::Glib

#### 2019-07-29 0.17.9:
* Extended, tested and documented TextTagTable in Gnome::Gtk3.
* Added class TextTag to Gnome::Gtk3.

#### 2019-07-28 0.17.8:
* Meta file bugfix

#### 2019-07-28 0.17.7:
* Bug fixed in TextIter. Many N-GObject types converted to N-GTextIter.
* Extended, tested and documented ListBox.
* Added ListBoxRow.

#### 2019-07-25 0.17.6:
* Extended, tested and documented TextBuffer, TextIter in Gnome::Gtk3.

#### 2019-07-24 0.17.5:
* Declaration of event signal sub moved from Gnome::GObject::Signal to Gnome::Gtk3::Widget to remove dependency of Gnome::GObject on Gnome::Gdk3.

#### 2019-07-22 0.17.4:
* Extended, tested and documented ColorChooserWidget, ComboBox, ComboBoxText

#### 2019-07-20 0.17.3:
* Documented Gnome::Gtk3::CheckButton and add test.
* Extended, tested and documented Button, ColorButton, ColorChooser, ColorChooserDialog in Gnome::Gtk3.

#### 2019-07-20 0.17.2:
* Extended Gnome::Gtk3::Builder.
* Added pod doc and tests.

#### 2019-07-05 0.17.1:
* Extended Gnome::Gtk3::Window, Gnome::Gtk3::Widget.
* Added pod doc and tests.

#### 2019-07-04 0.17.0:
* Add MenuButton, Menu, MenuShell, MenuBar to Gnome::Gtk3.
* Regenerated and adapted Gnome::Gdk3::Window.

#### 2019-06-09 0.16.1:
* Created a website at https://martimm.github.io/perl6-gnome-gtk3/. Long from finished.

#### 2019-06-08 0.16.0:
* Added new enums GtkAlign

#### 2019-06-07 0.15.0:
* Added Gnome::Gtk3::ColorChooserDialog, Gnome::Gtk3::ColorChooser, Gnome::Gtk3::ColorChooserWidget, Gnome::Gtk3::Box.
* Added new enums GtkBaselinePosition, GtkPackType

#### 2019-06-06 0.14.0:
* Added Gnome::Gtk3::ColorButton

#### 2019-05-28 0.13.2:
* Updating docs

#### 2019-05-29 0.13.1:
* Refactored from project GTK::V3 at version 0.13.1
* Modified class names by removing the first 'G' from the name. E.g. GBoxed becomes Boxed.
