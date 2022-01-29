//
//  NewsListPresenter.swift
//  KeywordNews
//
//  Created by 이현영 on 2022/01/29.
//

import UIKit

protocol NewsListProtocol:AnyObject{
    func setupNavigationBar()
    func setupLayout()
    func endRefreshing()
    func moveToNewsWebViewController()
}

final class NewsListPresenter: NSObject {
    private weak var viewController: NewsListProtocol?
    
    init(viewContorller: NewListViewController){
        self.viewController = viewContorller
    }
    func viewDidLoad() {
        viewController?.setupNavigationBar()
        viewController?.setupLayout()
    }
    
    func didCalledRefresh() {
        viewController?.endRefreshing()
        
    }
}


extension NewsListPresenter: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewController?.moveToNewsWebViewController()
    }
}

extension NewsListPresenter: UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                    let cell = tableView.dequeueReusableCell(withIdentifier: NewsListTableViewCell.identifier, for: indexPath)as? NewsListTableViewCell
            
            cell?.setup()
            //cell?.selectionStyle = .none
            
            return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: NewsListTableViewHeaderView.identifier) as? NewsListTableViewHeaderView
        header?.setup()
        
        return header
    }
    
    
}

