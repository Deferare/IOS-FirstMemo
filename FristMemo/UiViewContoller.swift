//
//  UiViewContoller.swift
//  FristMemo
//
//  Created by Ubinyou on 2021/03/26.
//

import UIKit

extension UIViewController {
    func alert (title : String = "알림", message : String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "확인", style: .default, handler: nil)        
        alert.addAction(okayAction)
        present(alert, animated:true, completion:nil)
    }
}
