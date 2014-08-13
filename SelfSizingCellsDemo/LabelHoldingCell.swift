//
//  LabelHoldingCell.swift
//  SelfSizingCellsDemo
//
//  Created by Alexis Gallagher on 2014-08-13.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

import UIKit

class LabelHoldingCell: UICollectionViewCell {
  weak var labelView: UILabel!
  
  required init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
    // not implemented
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    let label = UILabel(frame: CGRectZero)
    label.setTranslatesAutoresizingMaskIntoConstraints(false)
    label.backgroundColor = UIColor.lightGrayColor()
    label.numberOfLines = 0

    /* this next line is needed to allow word
    wrap within the label. It is ugly, since we'd 
    want to dynamically constrained the 
    preferredMaxLayoutWidth width to the width of 
    the containing view, which is the LabelHoldingCell.contentView */
    
    label.preferredMaxLayoutWidth = 320
    
    self.contentView.addSubview(label)
    if true {
      let viewBindings = ["label":label]
      self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: nil, metrics: nil, views: viewBindings))
      self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: nil, metrics: nil, views: viewBindings))
    }
    self.labelView = label
  }
  
  override class func requiresConstraintBasedLayout() -> Bool { return true; }
  
  func setText(text:String) {
    self.labelView.text = text;
  }
  
  class var classReuseIdentifier: String { return "cellIdentifier" }
}
