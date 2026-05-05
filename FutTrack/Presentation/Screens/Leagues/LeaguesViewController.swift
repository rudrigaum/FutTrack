//
//  LeaguesViewController.swift
//  FutTrack
//
//  Created by Rodrigo Cerqueira Reis on 24/04/26.
//

import Foundation
import UIKit
import Combine

final class LeaguesViewController: UIViewController {
    private let contentView = LeaguesView()
    private let viewModel: LeaguesViewModel
    private var cancellables = Set<AnyCancellable>()

    init(viewModel: LeaguesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Leagues"
        setupTableView()
        bindViewModel()
        loadData()
    }
}

private extension LeaguesViewController {
    func setupTableView() {
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
        contentView.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "LeagueCell")
    }

    func bindViewModel() {
        viewModel.$isLoading
            .combineLatest(viewModel.$leagues)
            .receive(on: RunLoop.main)
            .sink { [weak self] isLoading, leagues in
                guard let self else { return }
                self.contentView.render(isLoading: isLoading, hasData: !leagues.isEmpty)
                self.contentView.tableView.reloadData()
            }
            .store(in: &cancellables)
    }

    func loadData() {
        Task { [weak self] in
            await self?.viewModel.load()
        }
    }
}

extension LeaguesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.leagues.count
    }

    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath)
        let league = viewModel.leagues[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = league.name
        content.secondaryText = league.country
        cell.contentConfiguration = content
        cell.selectionStyle = .none

        return cell
    }
}

extension LeaguesViewController: UITableViewDelegate {}
