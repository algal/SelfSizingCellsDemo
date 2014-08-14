//
//  LabelHoldingCell.swift
//  SelfSizingCellsDemo
//
//  Created by Alexis Gallagher on 2014-08-13.
//  Copyright (c) 2014 AlexisGallagher. All rights reserved.
//

import UIKit

class LabelHoldingCell: UICollectionViewCell {
  weak var labelView: UILabel!

  override class func requiresConstraintBasedLayout() -> Bool { return true; }
  class var classReuseIdentifier: String { return "cellIdentifier" }

  required init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
    // not implemented
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setTranslatesAutoresizingMaskIntoConstraints(false)
    
    let label = UILabel(frame: self.bounds)
    label.setTranslatesAutoresizingMaskIntoConstraints(false)
    label.backgroundColor = UIColor.lightGrayColor()
    label.numberOfLines = 0
    /* this next line is needed to allow word
    wrap within the label. It is ugly, since we'd 
    prefer to dynamically constrain the
    label's preferredMaxLayoutWidth to the width of
    the containing view, which is the 
    LabelHoldingCell.contentView */
    label.preferredMaxLayoutWidth = 320
    
    self.contentView.addSubview(label)
    let viewBindings = ["label":label]
    self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]|", options: nil, metrics: nil, views: viewBindings))
    self.contentView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]|", options: nil, metrics: nil, views: viewBindings))

    self.labelView = label
  }
  
  func setText(text:String) {
    self.labelView.text = text;
  }
}
