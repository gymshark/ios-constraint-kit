//
//  ViewController.swift
//  ConstraintKitExample
//
//  Created by Russell Warwick on 07/07/2021.
//

import UIKit
import ConstraintKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "This is a test"
        label.backgroundColor = .red
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(label)
        label.withSize(.init(w: 100, h: 120))
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
