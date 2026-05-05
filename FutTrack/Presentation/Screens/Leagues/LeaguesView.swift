//
//  LeaguesView.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation
import UIKit

final class LeaguesView: UIView {
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = UIView()
        return tableView
    }()

    let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .large)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        return indicator
    }()

    let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "No leagues available"
        label.textAlignment = .center
        label.textColor = .secondaryLabel
        label.numberOfLines = 0
        label.isHidden = true
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render(isLoading: Bool, hasData: Bool) {
        if isLoading {
            loadingIndicator.startAnimating()
        } else {
            loadingIndicator.stopAnimating()
        }

        tableView.isHidden = isLoading || !hasData
        emptyStateLabel.isHidden = isLoading || hasData
    }
}

private extension LeaguesView {
    func setupView() {
        backgroundColor = .systemBackground

        addSubview(tableView)
        addSubview(loadingIndicator)
        addSubview(emptyStateLabel)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),

            loadingIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),

            emptyStateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            emptyStateLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 24),
            emptyStateLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -24)
        ])
    }
}
