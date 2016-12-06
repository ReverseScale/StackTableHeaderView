# StackTableHeaderView

代理方法:
```swift
extension PatientsReportsHeaderView:StackTableHeaderProtocol{
    func preferHeaderHeight() -> CGFloat{
        return 96
    }
}
```

-----
```swift
override func awakeFromNib() {
        super.awakeFromNib()
        // gridsView 需要的view
        self.PatientsReportsView.addSubview(self.gridsView)
        self.gridsView.snp_makeConstraints(closure: { (make) in
            make.top.right.left.equalTo(0)
        })
    }
```
