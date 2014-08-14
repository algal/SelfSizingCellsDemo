// Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

let box = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
box.backgroundColor = UIColor.grayColor()

let insetFrame = CGRectInset(box.bounds, 10, 10)

let label = UILabel(frame: insetFrame)
label.backgroundColor = UIColor.orangeColor()
label.text = "Hello, world"
box.addSubview(label)

let TRY_AUTOLAYOUT = false

if TRY_AUTOLAYOUT {
  let bindings = ["label":label]
  box.addConstraints(
    NSLayoutConstraint.constraintsWithVisualFormat("V:|[label]", options: nil, metrics: nil, views: bindings))
  box.addConstraints(
    NSLayoutConstraint.constraintsWithVisualFormat("H:|[label]", options: nil, metrics: nil, views: bindings))

  box.layoutSubviews()
}
box


