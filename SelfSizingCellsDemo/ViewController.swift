//
//  ViewController.swift
//  SelfSizingCellsDemo
//
//  Created by Alexis Gallagher on 2014-08-13.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

/*
NOTE TO APPLE (1/2): 

This line of text is split into words. Each word goes in its own label. Each cell contains one label.

The cells correctly self-size based on the size of the label, using iOS8's support for self-sizing collection view cells.

This is exactly as per Olivier Gutknecht's demonstration app in WWDC 2014, session 226, What's New in
Table and Collection Views.
*/
let smallitems = "The UICollectionViewFlowLayout class is a concrete layout object that organizes items into a grid with optional header and footer views for each section. The items in the collection view flow from one row or column (depending on the scrolling direction) to the next, with each row comprising as many cells as will fit. Cells can be the same sizes or different sizes. A flow layout works with the collection view’s delegate object to determine the size of items, headers, and footers in each section and grid. That delegate object must conform to the UICollectionViewDelegateFlowLayout protocol. Use of the delegate allows you to adjust layout information dynamically. For example, you would need to use a delegate object to specify different sizes for items in the grid. If you do not provide a delegate, the flow layout uses the default values you set using the properties of this class. Flow layouts lay out their content using a fixed distance in one direction and a scrollable distance in the other. For example, in a vertically scrolling grid, the width of the grid content is constrained to the width of the corresponding collection view while the height of the content adjusts dynamically to match the number of sections and items in the grid. The layout is configured to scroll vertically by default but you can configure the scrolling direction using the scrollDirection property. Each section in a flow layout can have its own custom header and footer. To configure the header or footer for a view, you must configure the size of the header or footer to be non zero. You can do this by implementing the appropriate delegate methods or by assigning appropriate values to the headerReferenceSize and footerReferenceSize properties. If the header or footer size is 0, the corresponding view is not added to the collection view."


/*
NOTE TO APPLE (1/2): 

This long item contains a long string of text that needs to be word-wrapped to fit into
a label with an iPhone screen width of 320. As a result of wrapping onto multiple lines, this 
item produce a self-sizing cell that is taller than the other cells.

This item will be the last in the collection.

THE PROBLEM IS THAT: although UICollectionView correctly self-sizes the cells based on the
size of the required labels, it does not seem correctly to calculate the collectionViewContentSize 
based on the cell sizies. This last item in the collection does not display within the
scrollable region, but is visible if you manually scroll to see outside the bounds of the
scrollable region.

*/
let onelongitem="I am a long string containing spaces to see if text wraps within a label properly or if instead it produces undesired artefacts."

let items = smallitems.componentsSeparatedByString(" ") + [onelongitem]

class ViewController: UICollectionViewController, UICollectionViewDataSource {
  
  override func prefersStatusBarHidden() -> Bool { return true; }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // register the cell type
    self.collectionView!.registerClass(LabelHoldingCell.self, forCellWithReuseIdentifier: LabelHoldingCell.classReuseIdentifier)
    
    // tell the collection view layout object to let the cells self-size
    var flowLayout = self.collectionView!.collectionViewLayout as! UICollectionViewFlowLayout
    flowLayout.estimatedItemSize = CGSize(width: 30, height: 20)
  }

  // MARK: <UICollectionViewDatasource>
  
  override func collectionView(collectionView: UICollectionView,
    cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
  {
    var cell = collectionView.dequeueReusableCellWithReuseIdentifier(LabelHoldingCell.classReuseIdentifier, forIndexPath: indexPath) as! LabelHoldingCell
    cell.setText(items[indexPath.row])
    return cell
  }
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1;
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count;
  }
}
