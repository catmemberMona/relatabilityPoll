//
//  typingAnimation.swift
//  plusOne
//
//  Created by mona zheng on 6/11/21.
//

import UIKit

func plusOneAnimation(label: UILabel, text: String){
    label.text = ""
    var charIndex = 1.0
    for char in text {
        Timer.scheduledTimer(withTimeInterval: 0.5 * charIndex, repeats: false) {
            (timer) in
            label.text?.append(char)
        }
        charIndex+=1
    }
}
