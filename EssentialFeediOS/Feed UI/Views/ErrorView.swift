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
        get { return label.title(for: .normal) }
        set { label.setTitle(newValue, for: .normal)}
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        
        label.setTitle(nil, for: .normal)
    }
}
