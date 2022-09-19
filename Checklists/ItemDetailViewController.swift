//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Rodrigo Kroef Tarouco on 14/09/22.
//

import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    
    func ItemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    var itemToEdit: ChecklistItem?
    
    weak var delegate: ItemDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let itemToEdit = itemToEdit {
            title = "Edit item"
            textField.text = itemToEdit.text
            doneBarButton.isEnabled = true
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func done(_ sender: Any) {
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.ItemDetailViewController(
              self,
              didFinishEditing: item)
          } else {
            let item = ChecklistItem()
            item.text = textField.text!
            delegate?.ItemDetailViewController(self, didFinishAdding: item)
          }
    }
    
    @IBAction func cancel(_ sender: Any) {
        delegate?.ItemDetailViewControllerDidCancel(self)
    }
    
    // MARK: - Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String
    ) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(
            in: stringRange,
            with: string)
        doneBarButton.isEnabled = !newText.isEmpty
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
    
    
    
    
}


