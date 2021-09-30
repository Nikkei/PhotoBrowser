//
//  LoadingIndicator.swift
//  PhotoBrowser
//
//  Created by tamanyan on 4/6/17.
//

import UIKit

class LoadingIndicator: UIView {
    var indicator: UIActivityIndicatorView!

    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 22, height: 22))

        clipsToBounds = true
        alpha = 0

        indicator = UIActivityIndicatorView()
        indicator.style = .white
        indicator.startAnimating()

        addSubview(indicator)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        indicator.center = CGPoint(x: bounds.size.width/2, y: bounds.size.height/2)
    }
}
