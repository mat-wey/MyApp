//
//  appendLog.swift
//  MyApp
//
//  Created by Матвей Симонов on 19.08.2025.
//

import UIKit
import UIKit

func appendLog(to textView: UITextView?, _ text: String) {
    guard let textView else { return }
    textView.text += text + "\n"
    let range = NSRange(location: textView.text.count - 1, length: 1)
    textView.scrollRangeToVisible(range)
}
