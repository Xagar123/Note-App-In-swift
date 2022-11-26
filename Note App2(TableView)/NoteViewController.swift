//
//  NoteViewController.swift
//  Note App2(TableView)
//
//  Created by Admin on 25/11/22.
//

import UIKit
protocol passDataBack{
    func updateRow(updatedTitle:String,updatedNote:String)
}

class NoteViewController: UIViewController {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var textViewField: UITextView!
    
    var dataPass:String?
    var notePass:String?
    var delegate:PortDelegate!
    
    public var completion: ((String,String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.text = dataPass!
        textViewField.text = notePass!
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(didTapSave))
       
    }
    
    @objc func didTapSave(){
        let newItem = titleField.text!
        let noteItem = textViewField.text!
      //  delegate.updateRow(updatedTitle: newItem, updatedNote: noteItem)
        
        if let text = titleField.text, !textViewField.text.isEmpty {
            
            completion!(text, textViewField.text)
        }
       // navigationController?.popToRootViewController(animated: true)
        
    }


}
