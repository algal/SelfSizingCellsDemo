//
//  LabelHoldingCell.swift
//  SelfSizingCellsDemo
//
//  Created by Alexis Gallagher on 2014-08-13.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

// APPLE: Please see comments in ViewController.swift for an explanation of this bug.

/*
This UICollectionViewCell contains a UILabel and hugs it with AL constraints.

The label.preferredMaxLayoutWidth=320, so the cell can display the
entirety of text which would not fit on a portrait iPhone screen.
*/
class LabelHoldingCell: UICollectionViewCell {
  weak var labelView: UILabel!

  override class func requiresConstraintBasedLayout() -> Bool { return true; }
  class var classReuseIdentifier: String { return "cellIdentifier" }

  required init(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    // not implemented
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    let label = UILabel(frame: self.bounds)
    label.setTranslatesAutoresizingMaskIntoConstraints(false)
    label.backgroundColor = UIColor.lightGrayColor()
    label.numberOfLines = 0
    /*
    
    This next line is needed to force the label to wrap words
    at the width of an iphone screen.
    
    Hardcoding this width is ugly. We'd prefer it if the
    label's preferredMaxLayoutWidth was dynamically set to the 
    width of the view, which expanded to the width available to it, 
    after all preceding items were layed out. 
    
    This is a battle for another day.
    
    */
    label.preferredMaxLayoutWidth = 320
    
    self.contentView.addSubview(label)

    // use constraints to configure the cell to hug the label.
    // since AL constraints have no causal directionality
    // (unlike autoresizing masks), this means the label's
    // intrinsic content size will determine the cell's size.
    self.setTranslatesAutoresizingMaskIntoConstraints(false)
    let viewBindings = ["label":label]
    self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: nil, metrics: nil, views: viewBindings))
    self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: nil, metrics: nil, views: viewBindings))

    self.labelView = label
  }

  func setText(text:String) {
    self.labelView.text = text;
  }
}
