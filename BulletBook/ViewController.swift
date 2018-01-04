//
//  ViewController.swift
//  BulletBook
//
//  Created by Jacob Lillioja on 1/4/18.
//  Copyright © 2018 Jacob Lillioja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let noteStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        let addButton = UIButton()
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.setTitle("+", for: .normal)
        addButton.setTitleColor(.white, for: .normal)
        addButton.backgroundColor = .black
        addButton.addTarget(self, action: #selector(addNote), for: .touchUpInside)
        view.addSubview(addButton)
        let addButtonConstraints = [
            addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ]
        
        noteStack.translatesAutoresizingMaskIntoConstraints = false
        noteStack.axis = .vertical
        view.addSubview(noteStack)
        let noteStackConstraints = [
            noteStack.topAnchor.constraint(equalTo: addButton.bottomAnchor),
            noteStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            noteStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ]
        
        let firstNote = UITextField()
        firstNote.translatesAutoresizingMaskIntoConstraints = false
        firstNote.textColor = .black
        firstNote.text = "Your first note!"
        noteStack.addArrangedSubview(firstNote)
        
        NSLayoutConstraint.activate(noteStackConstraints + addButtonConstraints)
    }
    
    @objc private func addNote() {
        let newNote = UITextField()
        newNote.textColor = .black
        newNote.placeholder = "New Note"
        noteStack.addArrangedSubview(newNote)
    }
}

