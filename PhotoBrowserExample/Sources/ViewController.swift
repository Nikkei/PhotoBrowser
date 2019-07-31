//
//  ViewController.swift
//  PhotoBrowserExample
//
//  Created by tamanyan on 4/6/17.
//

import UIKit
import PhotoBrowser

class ViewController: UIViewController {
    lazy var showButton: UIButton = { [unowned self] in
        let button = UIButton()
        button.addTarget(self, action: #selector(showLightbox), for: .touchUpInside)
        button.setTitle("Launch the PhotoBrowser", for: UIControl.State())
        button.setTitleColor(UIColor(red: 3/255, green: 125/255, blue: 233/255, alpha: 1), for: UIControl.State())
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.frame = UIScreen.main.bounds
        button.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]

        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Example"
        self.view.backgroundColor = .white
        self.view.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleRightMargin, .flexibleBottomMargin]
        self.view.addSubview(self.showButton)
    }

    @objc func showLightbox() {
        let images = [
            PhotoImage(imageURL: URL(string: "https://cdn.arstechnica.net/2011/10/05/iphone4s_sample_apple-4e8c706-intro.jpg")!),
            PhotoImage(
                image: UIImage(named: "photo1")!,
                text: "Some very long lorem ipsum text. Some very long lorem ipsum text."
            ),
            PhotoImage(
                image: UIImage(named: "photo2")!,
                text: "",
                videoURL: URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            ),
            PhotoImage(
                image: UIImage(named: "photo3")!,
                text: "Some very long lorem ipsum text."
            )
        ]

        let browser = PhotoBrowser(images: images)
        browser.dynamicBackground = true

        present(browser, animated: true, completion: nil)
    }
}
