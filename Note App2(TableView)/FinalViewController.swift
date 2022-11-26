//
//  FinalViewController.swift
//  Note App2(TableView)
//
//  Created by Admin on 25/11/22.
//

import UIKit

class FinalViewController: UIViewController {

    @IBOutlet weak var titleUpdateField: UITextField!
    @IBOutlet weak var textViewUpdate: UITextView!
    
    public var noteTitle:String = ""
    public var note:String = ""
    
    public var completion: ((String,String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleUpdateField.text = noteTitle
        textViewUpdate.text = note
       
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(updateData))
    }
    
    @objc func updateData(){
        if let text = titleUpdateField.text, !textViewUpdate.text.isEmpty {
            
            completion!(text, textViewUpdate.text)
        }
        navigationController?.popToRootViewController(animated: true)
    }
    

}
