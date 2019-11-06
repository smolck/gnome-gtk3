use v6;
use NativeCall;
use Test;

use Gnome::Gtk3::TreePath;
ok 1, 'loads ok';

#use Gnome::N::X;
#Gnome::N::debug(:on);

#-------------------------------------------------------------------------------
my Gnome::Gtk3::TreePath $tp;
#-------------------------------------------------------------------------------
subtest 'ISA test', {
  $tp .= new(:empty);
  isa-ok $tp, Gnome::Gtk3::TreePath, '.new(:empty)';
}

#-------------------------------------------------------------------------------
subtest 'Manipulations', {

  my Gnome::Gtk3::TreePath $tp-copy .= new(:tree-path($tp.gtk-tree-path-copy));
  isa-ok $tp-copy.get-native-gboxed, N-GtkTreePath, '.gtk-tree-path-copy()';
  ok $tp-copy.tree-path-is-valid, '.tree-path-is-valid()';
  $tp-copy.clear-tree-path;
  nok $tp-copy.tree-path-is-valid, '.clear-tree-path()';

  $tp .= new(:first);
  isa-ok $tp-copy.get-native-gboxed, N-GtkTreePath, '.new(:first)';
  is $tp.to-string, '0', '.to-string()';
  $tp.append-index(10);
  is $tp.to-string, '0:10', '.append-index()';
  $tp.prepend-index(2);
  is $tp.to-string, '2:0:10', '.prepend-index()';
  is $tp.get-depth, '3', '.get-depth()';
  is-deeply [ 2, 0, 10], $tp.get-indices, '.get-indices()';
  is-deeply ( 3, [ 2, 0, 10]), $tp.get-indices-with-depth,
      '.get-indices-with-depth()';

  my Gnome::Gtk3::TreePath $tp2 .= new(:string('1:3'));
  is $tp2.to-string, '1:3', '.new(:string)';

  my Gnome::Gtk3::TreePath $tp3 .= new(:indices(1, 3));
  is $tp3.to-string, '1:3', '.new(:indices)';
  is $tp3.gtk-tree-path-compare($tp2), 0, '.gtk-tree-path-compare() equal';
  $tp2 .= new(:string('0:3'));
  is $tp3.gtk-tree-path-compare($tp2), 1, '.gtk-tree-path-compare() before';
  $tp2 .= new(:string('1:3:1'));
  is $tp3.gtk-tree-path-compare($tp2), -1, '.gtk-tree-path-compare() after';
}

#`{{

#-------------------------------------------------------------------------------
subtest 'Inherit ...', {
}

#-------------------------------------------------------------------------------
subtest 'Interface ...', {
}

#-------------------------------------------------------------------------------
subtest 'Properties ...', {
}

#-------------------------------------------------------------------------------
subtest 'Themes ...', {
}

#-------------------------------------------------------------------------------
subtest 'Signals ...', {
}
}}

#-------------------------------------------------------------------------------
done-testing;
