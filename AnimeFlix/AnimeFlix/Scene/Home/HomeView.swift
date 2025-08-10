//
//  HomeView.swift
//  AnimeFlix
//
//  Created by Rodrigo on 29/07/25.
//

import UIKit
import SnapKit

class HomeView: UIView {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .singleLine
        tableView.backgroundColor = .white
        return tableView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Os Cavaleiros do Zodiaco"
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .systemBackground
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGreen
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        addSubview(titleLabel)
        addSubview(tableView)
        
        titleLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
