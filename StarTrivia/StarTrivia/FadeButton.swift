//
//  FadeButton.swift
//  StarTrivia
//
//  Created by Owen Henley on 11/24/18.
//  Copyright © 2018 Owen Henley. All rights reserved.
//

import UIKit

class FadeButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            UIView.animate(withDuration: 0.2) {
                if self.isEnabled {
                    self.alpha = 1.0
                } else {
                    self.alpha = 0.5
                }
            }
        }
    }
}
