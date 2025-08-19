//
//  ViewController.swift
//  MyApp
//
//  Created by Матвей Симонов on 18.08.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var addFile: UIButton!
    @IBOutlet weak var availabilityFile: UIButton!
    @IBOutlet weak var removeFile: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        removeFile.layer.cornerRadius = 25
        
    }
    
    let fileManager = FileManager.default
    lazy var documentsURL: URL = {
        fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
    }()
    lazy var myFile: URL = documentsURL.appendingPathComponent("example.txt")
    
    
    @IBAction func removeFile(_ sender: Any) {
        if fileManager.fileExists(atPath: myFile.path) {
            try? fileManager.removeItem(at: myFile)
            appendLog(to: textField, "-deleted the file")
        } else {
            appendLog(to: textField, "-The file does not exist")
        }
    }
    
    @IBAction func availabilityFile(_ sender: Any) {
        if fileManager.fileExists(atPath: myFile.path) {
            appendLog(to: textField, "-the file is available")
            appendLog(to: textField, "-true")
        } else {
            appendLog(to: textField, "-the file is not available")
            appendLog(to: textField, "-false")
        }
    }
    
    @IBAction func addFile(_ sender: Any) {
        if fileManager.fileExists(atPath: myFile.path) {
            appendLog(to: textField,"-the file already exists")
        } else {
            fileManager.createFile(atPath: myFile.path, contents: nil)
           appendLog(to: textField, "-file created")
        }
    }
}
    


