//
//  ErrorView.swift
//  EssentialFeediOS
//
//  Created by Wan Ahmad Lutfi on 06/03/2023.
//

import UIKit

public final class ErrorView: UIView {
    
    @IBOutlet private var label: UIButton!
    
    public var message: String? {
        get { return isVisible ? label.title(for: .normal) : nil}
        set { setMessageAnimated(newValue)}
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        label.setTitle(nil, for: .normal)
    }
    
    private var isVisible: Bool {
        return alpha > 0
    }
    
    private func setMessageAnimated(_ message: String?) {
        if let message = message {
            showAnimated(message)
        } else {
            hideMessageAnimated()
        }
    }

    private func showAnimated(_ message: String) {
        label.setTitle(message, for: .normal)
        
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
        }
    }
    
    private func hideMessageAnimated() {
        UIView.animate(
            withDuration: 0.25,
            animations: { self.alpha = 0 },
            completion: { completed in
                if completed { self.message = nil }
            })
    }
}
