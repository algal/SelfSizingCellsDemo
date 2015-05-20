WWDC2014 session 226, "What's new in Table and Collection Views",
talks about self-sizing cells. These are collection view cells that
the collection view will correctly size based the cell's own
`intrinsicContentSize`, rather than by a size determined by the layout
object or its delegate. You trigger this behavior by setting an
`estimatedItemSize`.

The speaker, Olivier, shows an example of collection view cells that
self-size based on their own Auto Layout constraints.

This project reproduces that example.

This project also shows that as of Xcode 6.3.2 iOS SDK 8.3, there is a
bug in this feature. For certain values of `estimatedItemSize`, the
collection view will simply fail to present some items provided by the
data source.

In included sample project, toggle the boolean
`useMagicallyBrokenHeight`. When the height of the `estimatedItemSize`
is 20 or less, the collection view never renders the last item. 

