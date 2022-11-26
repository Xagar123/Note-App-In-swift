//
//  SecondTableViewController.swift
//  Note App2(TableView)
//
//  Created by Admin on 25/11/22.
//

import UIKit

class HomeTableViewController: UITableViewController, passDataBack{
    
    var tableList:[(title:String, note:String)] = []
    
    var titleData:String = ""
    var bodyData:String = ""
    var rowNumber: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Note"
        
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let noteVC = storyboard?.instantiateViewController(withIdentifier: "NoteViewController") as! NoteViewController
        navigationController?.pushViewController(noteVC, animated: true)
        
       // noteVC.delegate = self
        noteVC.dataPass = titleData
        noteVC.notePass = bodyData
        
        noteVC.title = "New Note"
        noteVC.navigationItem.largeTitleDisplayMode = .never
        noteVC.completion = {noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.tableList.append((title:noteTitle, note:note))
           
            self.tableView.reloadData()
        }
        
    }
    
    func updateRow(updatedTitle: String, updatedNote: String) {
       // tableList[rowNumber] = updatedTitle
     //   tableList[rowNumber] = updatedNote
        tableView.reloadData()
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell?.textLabel?.text = tableList[indexPath.row].title
        cell?.detailTextLabel?.text = tableList[indexPath.row].note
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        titleData = tableList[indexPath.row].title
        bodyData = tableList[indexPath.row].note
        rowNumber = indexPath.row
        let vc = storyboard?.instantiateViewController(withIdentifier: "FinalViewController") as! FinalViewController
        navigationController?.pushViewController(vc, animated: true)
        
        let list = tableList[indexPath.row]
        vc.title = "LIST"
        vc.noteTitle = list.title
        vc.note = list.note
        
        vc.completion = {noteTitle, note in
            self.navigationController?.popToRootViewController(animated: true)
            self.tableList.append((title:noteTitle, note:note))
           
            self.tableView.reloadData()
        }
        
    }

}
