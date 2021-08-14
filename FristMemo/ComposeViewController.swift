//
//  ComposeViewController.swift
//  FristMemo
//
//  Created by Ubinyou on 2021/03/26.
//

import UIKit

class ComposeViewController: UIViewController {
    @IBOutlet weak var memoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }    
    //MARK: - Function
    @IBAction func cancelBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveBtn(_ sender: Any) {
        guard let memo = memoTextView.text, memo.count > 0 else {
            alert(message: "Please memo!")
            return
        }
        DataManager.shared.addNewMemo(memo)
        NotificationCenter.default.post(name : Notification.Name(rawValue: "newMemoDidInsert"), object: nil)
        dismiss(animated: true, completion: nil)
    }
}
