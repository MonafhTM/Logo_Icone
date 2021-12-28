//
//  SideMenuVC.swift
//  LogoIcone
//
//  Created by Monafh on 22/05/1443 AH.
//

import UIKit

protocol SideMenuViewControllerDelegate {
    func selectedCell(_ row: Int)
}

class SideMenuViewController: UIViewController {


    
    @IBOutlet weak var headerImageView: UIImageView!
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    @IBOutlet weak var footerLabel: UILabel!
    
    var delegate: SideMenuViewControllerDelegate?

    var defaultHighlightedCell: Int = 0

    var menu: [SideMenuModel] = [
        SideMenuModel(icon: UIImage(systemName: "magnifyingglass.circle.fill")!, title: "Search Icon"),
        SideMenuModel(icon: UIImage(systemName: "theatermasks.fill")!, title: "LOGO"),
        SideMenuModel(icon: UIImage(systemName: "playpause.fill")!, title: "Video"),
        SideMenuModel(icon: UIImage(systemName: "house.fill")!, title: "Home"),

        SideMenuModel(icon: UIImage(systemName: "person.fill")!, title: "Profile")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // TableView
        self.sideMenuTableView.delegate = self
        self.sideMenuTableView.dataSource = self
        self.sideMenuTableView.backgroundColor = #colorLiteral(red: 0.4482110143, green: 0.3058736622, blue: 0.7481071353, alpha: 1)
        self.sideMenuTableView.separatorStyle = .none

        // Set Highlighted Cell
        DispatchQueue.main.async {
            let defaultRow = IndexPath(row: self.defaultHighlightedCell, section: 0)
            self.sideMenuTableView.selectRow(at: defaultRow, animated: false, scrollPosition: .none)
        }

        // Footer
        self.footerLabel.textColor = UIColor.white
        self.footerLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        self.footerLabel.text = "F"

        // Register TableView Cell
        self.sideMenuTableView.register(SideMenuCell.nib, forCellReuseIdentifier: SideMenuCell.identifier)

        // Update TableView with the data
        self.sideMenuTableView.reloadData()
    }
}

// MARK: - UITableViewDelegate

extension SideMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

// MARK: - UITableViewDataSource

extension SideMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menu.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SideMenuCell.identifier, for: indexPath) as? SideMenuCell else { fatalError("xib doesn't exist") }

        cell.iconImageView.image = self.menu[indexPath.row].icon
        cell.titleLabel.text = self.menu[indexPath.row].title

        // Highlighted color
        let myCustomSelectionColorView = UIView()
        myCustomSelectionColorView.backgroundColor = #colorLiteral(red: 0.4482110143, green: 0.3058736622, blue: 0.7481071353, alpha: 1)
        cell.selectedBackgroundView = myCustomSelectionColorView
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedCell(indexPath.row)
        // Remove highlighted color when you press the 'P' and 'Like us on f' cell
        if indexPath.row == 4 || indexPath.row == 6 {
            tableView.deselectRow(at: indexPath, animated: true)
        }
    }
}
