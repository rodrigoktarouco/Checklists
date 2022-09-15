//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Rodrigo Kroef Tarouco on 14/09/22.
//

import UIKit

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
      navigationItem.largeTitleDisplayMode = .never
      
  }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      textField.becomeFirstResponder()
    }

    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func done(_ sender: Any) {
        print("Contents of the text field: \(textField.text!)")
        navigationController?.popViewController(animated: true)
        
    }
    
    @IBAction func cancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
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


