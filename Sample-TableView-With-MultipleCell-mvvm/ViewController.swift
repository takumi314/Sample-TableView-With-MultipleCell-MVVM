//
//  ViewController.swift
//  Sample-TableView-With-MultipleCell-mvvm
//
//  Created by NishiokaKohei on 2017/06/08.
//  Copyright © 2017年 Kohey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var profileTableView: UITableView!

    // MARK: - Public Properties


    // MARK: - Private properties

    fileprivate let viewModel = ProfileViewModel()


    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.reloadSections = { [weak self] (section: Int) in
            self?.profileTableView.beginUpdates()
            self?.profileTableView.reloadSections([section], with: .fade)
            self?.profileTableView.endUpdates()
        }

        setUpTableView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Private methods

    func setUpTableView() {
        profileTableView?.estimatedRowHeight = 100
        profileTableView?.rowHeight = UITableViewAutomaticDimension
        profileTableView?.sectionHeaderHeight = 70
        profileTableView?.separatorStyle = .none

        profileTableView?.dataSource = viewModel
        profileTableView?.delegate = viewModel

        profileTableView?.register(NamePhotoCell.nib, forCellReuseIdentifier: NamePhotoCell.identifier)
        profileTableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.identifier)
        profileTableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.identifier)
        profileTableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.identifier)
        profileTableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.identifier)
        profileTableView?.register(ProfileHeaderView.nib, forCellReuseIdentifier: ProfileHeaderView.identifier)
    }


}

