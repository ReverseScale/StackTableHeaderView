# StackTableHeaderView

![](http://og1yl0w9z.bkt.clouddn.com/17-11-10/33065562.jpg)

代理方法:
```swift
extension PatientsReportsHeaderView:StackTableHeaderProtocol{
    func preferHeaderHeight() -> CGFloat{
        return 96
    }
}
```

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
