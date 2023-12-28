//
//  RMSearchViewController.swift
//  RickAndMorty
//
//  Created by Yunus Emre Berdibek on 14.12.2023.
//

import UIKit

// Dynamic search option view
// Render results
// Render no results zero state
// Searching / API CALL

/// Configurable controller to search.
final class RMSearchViewController: UIViewController {
    /// Configuration for search session
    struct Config {
        enum `Type` {
            case character // name | status | gender
            case episode // name
            case location //  name | type

            var title: String {
                switch self {
                case .character:
                    "Search Characters"
                case .episode:
                    "Search Episodes"
                case .location:
                    "Search Locations"
                }
            }
        }

        let type: `Type`
    }

    // MARK: -  Components

    private let searchView: RMSearchView

    // MARK: - Properties

    private let viewModel: RMSearchViewModel

    // MARK: - Init

    init(config: Config) {
        let viewModel = RMSearchViewModel(config: config)
        self.viewModel = viewModel
        self.searchView = RMSearchView(frame: .zero, viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.config.type.title
        view.backgroundColor = .systemBackground
        view.addSubviews(searchView)
        addConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Search",
                                                            style: .done,
                                                            target: self, action: #selector(didTapExecuteSearch))
    }

    @objc
    private func didTapExecuteSearch() {
        // viewModel.executeSearch()
    }
}

extension RMSearchViewController {
    private func addConstraints() {
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            searchView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            searchView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            searchView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
