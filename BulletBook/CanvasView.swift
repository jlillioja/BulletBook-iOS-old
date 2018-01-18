//
//  CanvasView.swift
//  BulletBook
//
//  Created by Jacob Lillioja on 1/17/18.
//  Copyright © 2018 Jacob Lillioja. All rights reserved.
//

import Foundation
import UIKit

class CanvasView : CustomView {
    
    var position : Position?
    {
        willSet {
            position?.deactivate()
        }
        didSet {
            position?.activate()
        }
    }
    
    override init() {
        super.init()
        
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func positioned(in superview: UIView) -> CanvasView {
        superview.addSubview(self)
        
        position = Position(
            centerX: self.centerXAnchor.constraint(equalTo: superview.centerXAnchor),
            centerY: self.centerYAnchor.constraint(equalTo: superview.centerYAnchor)
        )
        position?.activate()
        widthAnchor.constraint(equalTo: superview.widthAnchor).activate()
        heightAnchor.constraint(equalTo: superview.heightAnchor).activate()
        
        return self
    }
    
    func position(in superview: UIView) {
        let _ = positioned(in: superview)
    }
    
    func offset(by offset: CGPoint) {
        position?.offset(by: offset)
        layoutIfNeeded()
    }
}

class Position {
    var x: NSLayoutConstraint
    var y: NSLayoutConstraint
    
    var s: [NSLayoutConstraint] {
        return [x,y]
    }
    
    init(centerX: NSLayoutConstraint, centerY: NSLayoutConstraint) {
        x = centerX
        y = centerY
    }
    
    func deactivate() {
        NSLayoutConstraint.deactivate(s)
    }
    
    func activate() {
        NSLayoutConstraint.activate(s)
    }
    
    func offset(by position: CGPoint) {
        x.constant += position.x
        y.constant += position.y
    }
}

fileprivate extension NSLayoutConstraint {
    func activate() {
        NSLayoutConstraint.activate([self])
    }
}
