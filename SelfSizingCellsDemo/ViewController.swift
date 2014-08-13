//
//  ViewController.swift
//  SelfSizingCellsDemo
//
//  Created by Alexis Gallagher on 2014-08-13.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

import UIKit

let longtext = "The UICollectionViewFlowLayout class is a concrete layout object that organizes items into a grid with optional header and footer views for each section. The items in the collection view flow from one row or column (depending on the scrolling direction) to the next, with each row comprising as many cells as will fit. Cells can be the same sizes or different sizes. A flow layout works with the collection view’s delegate object to determine the size of items, headers, and footers in each section and grid. That delegate object must conform to the UICollectionViewDelegateFlowLayout protocol. Use of the delegate allows you to adjust layout information dynamically. For example, you would need to use a delegate object to specify different sizes for items in the grid. If you do not provide a delegate, the flow layout uses the default values you set using the properties of this class. Flow layouts lay out their content using a fixed distance in one direction and a scrollable distance in the other. For example, in a vertically scrolling grid, the width of the grid content is constrained to the width of the corresponding collection view while the height of the content adjusts dynamically to match the number of sections and items in the grid. The layout is configured to scroll vertically by default but you can configure the scrolling direction using the scrollDirection property. Each section in a flow layout can have its own custom header and footer. To configure the header or footer for a view, you must configure the size of the header or footer to be non zero. You can do this by implementing the appropriate delegate methods or by assigning appropriate values to the headerReferenceSize and footerReferenceSize properties. If the header or footer size is 0, the corresponding view is not added to the collection view."

class ViewController: UICollectionViewController, UICollectionViewDataSource {
  
  let tokens = longtext.componentsSeparatedByString(" ") + ["I am a string containing spaces to see if text wraps within a label properly"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // register for cell type
    self.collectionView.registerClass(LabelHoldingCell.self, forCellWithReuseIdentifier: LabelHoldingCell.classReuseIdentifier)
    
    // tell CV to let the cell's self-size
    var flowLayout = self.collectionView.collectionViewLayout as UICollectionViewFlowLayout
    flowLayout.estimatedItemSize = CGSize(width: 30, height: 30)
  }
  
  // MARK: <UICollectionViewDatasource>
  
  override func collectionView(collectionView: UICollectionView!,
    cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell!
  {
    var cell = collectionView.dequeueReusableCellWithReuseIdentifier(LabelHoldingCell.classReuseIdentifier, forIndexPath: indexPath) as LabelHoldingCell
    
    cell.setText(tokens[indexPath.row])
    return cell
  }
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView!) -> Int {
    return 1;
  }
  
  override func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
    return tokens.count;
  }
}
