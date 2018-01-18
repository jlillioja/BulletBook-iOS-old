//
//  ViewController.swift
//  BulletBook
//
//  Created by Jacob Lillioja on 1/4/18.
//  Copyright © 2018 Jacob Lillioja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let canvasView = CanvasView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .gray
        
        addCanvas()
        addPanListener()
        
        addNote(at: canvasView.center)
    }
    
    private func addCanvas() {
        canvasView.position(in: view)
    }
    
    private func addPanListener() {
        let gestureRecognizer = UIPanGestureRecognizer(target: self, action: .pan)
        canvasView.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func pan(gesture: UIPanGestureRecognizer) {
        canvasView.offset(by: gesture.translation(in: view))
        gesture.setTranslation(.zero, in: view)
    }
    
    @objc private func addNote(at location: CGPoint) {
        let newNote = UITextField()
        newNote.translatesAutoresizingMaskIntoConstraints = false
        newNote.textColor = .black
        newNote.placeholder = "New Note"
        canvasView.addSubview(newNote)
        NSLayoutConstraint.activate([
            newNote.centerXAnchor.constraint(equalTo: canvasView.centerXAnchor, constant: location.x),
            newNote.centerYAnchor.constraint(equalTo: canvasView.centerYAnchor, constant: location.y),
        ])
    }
}

fileprivate extension Selector {
    static let pan = #selector(ViewController.pan(gesture:))
}
