WWDC2014 session 226, "What's new in Table and Collection Views",
talks about self-sizing cells. These are collection view cells that
the collection view will correctly size based the cell's own
intrinsicContentSize, rather than by a size determined by the layout
object or its delegate.

The speaker, Olivier, shows an example of collection view cells that
self-size based on their own Auto Layout constraints.

This project reproduces that example.

This project also shows that as of Xcode6Beta6, there seems to be
a bug where the collection view does not calculate the overall
contentSize of the scrollable region correctly.

