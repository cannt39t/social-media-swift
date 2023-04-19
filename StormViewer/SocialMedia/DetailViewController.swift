//
//  DetailViewController.swift
//  StormViewer
//
//  Created by Илья Казначеев on 13.04.2023.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selected
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selected {
            image.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = image.image?.jpegData(compressionQuality: 0.8), let text = selected else {
            print("No image found")
            return
        }
        
        
        let vc = UIActivityViewController(activityItems: [text, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}
