WWDC2014 session 226, "What's new in Table and Collection Views",
talks about self-sizing cells. These are collection view cells that
are sized by their own declared intrinsicContentSize, rather than by a
size determined by the layout object or its delegate.

The speaker, Olivier, shows an example of collection view cells that
self-size based on their own Auto Layout constraints. This project
reproduces that example.

I also tried to get this working in Interface Builder but it does not
seem to work as of Xcode 6 beta 5.

But it works in code.
