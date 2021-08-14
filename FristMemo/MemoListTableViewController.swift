//
//  MemoListTableViewController.swift
//  FristMemo
//
//  Created by Ubinyou on 2021/03/26.
//

import UIKit

class MemoListTableViewController: UITableViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DataManager.shared.fetchMemo()
        tableView.reloadData()
        print("viewWillAppear")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(forName: Notification.Name(rawValue: "newMemoDidInsert"), object: nil, queue: OperationQueue.main) {
            [weak self] (noti) in
            self?.tableView.reloadData()
        }
        print("viewDidLoad")
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.memo = DataManager.shared.memoList[indexPath.row]
            }
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataManager.shared.memoList.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCell", for: indexPath)
        let target = DataManager.shared.memoList[indexPath.row]
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formetedDate.string(for: target.insertDate)
        return cell
    }    
    
    //MARK: - Option
    let formetedDate:DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = DateFormatter.Style.long
        f.timeStyle = .short
        return f
    }()
    
    var token:NSObjectProtocol!
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
        print("deinit Call")
    }
}
