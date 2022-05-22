//
//  DetailViewController.swift
//  Challenge 1-3
//
//  Created by Denys Denysenko on 12.10.2021.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    var selectedItem : String?
    var navBarTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = navBarTitle?.uppercased()
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))

        
        
        imageView.image = UIImage(named: selectedItem!)
        imageView.backgroundColor = UIColor.opaqueSeparator
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

  @objc  func shareFlag() {
        
        let ac = UIActivityViewController(activityItems: [selectedItem, imageView.image!], applicationActivities: [])
        
        ac.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(ac, animated: true)
    }
}
