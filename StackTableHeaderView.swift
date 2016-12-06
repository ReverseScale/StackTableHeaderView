//
//  StackTableHeaderView.swift
//  DajiaZhongyi
//
//  Created by yunchou on 16/9/1.
//  Copyright © 2016年 dajiazhongyi. All rights reserved.
//

import UIKit

protocol StackTableHeaderProtocol{
    func preferHeaderHeight() -> CGFloat
    func displayAbleView() -> UIView
}
extension StackTableHeaderProtocol where Self:UIView{
    func displayAbleView() -> UIView{
        return self
    }
}
class StackTableHeaderView: UIView {
    weak var tableView:UITableView!
    var views:[StackTableHeaderProtocol] = [] {
        didSet{
            self.updateViews()
        }
    }
    
    private func updateViews(){
        self.removeAllSubViews()
        let vs = self.views.map{ $0.displayAbleView() }
        self.addsubViews(vs)
        let height = self.views.reduce(0) { (old, s) in
            return old + s.preferHeaderHeight()
        }
        self.frame = CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: height + CGFloat.min)
        self.tableView.tableHeaderView = self
        self.layoutSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        var offset = CGFloat(0)
        for i in  0 ..< self.views.count {
            let v = self.views[i]
            let h = v.preferHeaderHeight()
            let view = v.displayAbleView()
            view.frame = CGRect(x: 0, y: offset, width: self.frame.width, height: h)
            offset += h
            self.bringSubviewToFront(view)
        }
    }
    convenience init(tableView: UITableView) {
        self.init(frame:CGRect(x: 0, y: 0, width: 0, height: CGFloat.min))
        self.tableView = tableView
        self.updateViews()
    }
    private override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
