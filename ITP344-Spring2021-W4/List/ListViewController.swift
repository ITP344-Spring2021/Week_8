//
//  ListViewController.swift
//  ITP344-Spring2021-W4
//
//  Created by Jack Xu on 3/11/21.
//

import UIKit

class ListViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    let tableView: UITableView = {
        let tv = UITableView(frame: .zero, style: .grouped)
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "builtin")
        return tv
    }()
    
    private func initUI() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }

}

extension ListViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 50
        }
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Appetizer"
        } else {
            return "Entree"
        }
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let header = UIView()
//        let label = UILabel()
//        label.text = "SADADADD"
//        header.addSubview(label)
//        label.snp.makeConstraints { (make) in
//            make.center.equalToSuperview()
//        }
//        return header
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "builtin", for: indexPath)
        
        if indexPath.section == 0 {
            cell.textLabel?.text = "Viktor \(indexPath.row)!"
            cell.imageView?.image = #imageLiteral(resourceName: "Viktor")
        } else {
            cell.textLabel?.text = "Jeff \(indexPath.row)!"
            cell.imageView?.image = #imageLiteral(resourceName: "Jeff")
        }
        
        return cell
    }
    
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("User selected row \(indexPath.row)")
    }
    
}
