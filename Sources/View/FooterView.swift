//
//  FooterView.swift
//  PhotoBrowser
//
//  Created by tamanyan on 4/6/17.
//

import UIKit

public protocol FooterViewDelegate: class {
    func footerView(_ footerView: FooterView, didExpand expanded: Bool)
}

open class FooterView: UIView {
    open fileprivate(set) lazy var infoLabel: InfoLabel = { [unowned self] in
        let label = InfoLabel(text: "")
        label.isHidden = !PhotoConfig.InfoLabel.enabled
        label.textColor = PhotoConfig.InfoLabel.textColor

        return label
    }()

    open weak var delegate: FooterViewDelegate?

    // MARK: - Initializers

    public init() {
        super.init(frame: CGRect.zero)

        backgroundColor = UIColor.clear

        [infoLabel].forEach { addSubview($0) }
    }

    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Helpers

    func expand(_ expand: Bool) {
    }

    func updatePage(_ page: Int, _ numberOfPages: Int) {
    }

    func updateText(_ text: String) {
        infoLabel.fullText = text
    }

    // MARK: - Layout

    fileprivate func resetFrames() {
        frame.size.height = infoLabel.frame.height
    }
}

// MARK: - LayoutConfigurable

extension FooterView: LayoutConfigurable {
    public func configureLayout() {
        infoLabel.frame = CGRect(x: 17, y: 0, width: frame.width - 17 * 2, height: 35)
        infoLabel.configureLayout()
    }
}
