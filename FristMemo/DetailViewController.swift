//
//  DetailViewController.swift
//  FristMemo
//
//  Created by Ubinyou on 2021/03/30.
//

import UIKit

class DetailViewController: UIViewController {
    var memo:Memo?    
    let formatedDate:DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .long
        f.timeStyle = .short
        return f
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DetailViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "memoCell", for: indexPath)
            cell.textLabel?.text = memo?.content
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
            cell.textLabel?.text = formatedDate.string(for: memo?.insertDate)
            return cell
        default:
            fatalError()
        }
    }
}
