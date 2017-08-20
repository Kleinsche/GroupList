//
//  HeadView.swift
//  SharedChat
//
//  Created by Kleinsche on 2017/7/15.
//  Copyright © 2017年 Kleinsche. All rights reserved.
//

import UIKit

@objc protocol HeadViewDelegate: class{
    
    @objc optional func clickView()
    
}

class HeadView: UITableViewHeaderFooterView {
    
    weak var delegate : HeadViewDelegate?
    var groupModel: ClassModel!
    var button: UIButton!
    var label: UILabel!
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.create()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func create() {
        let button = UIButton.init(type: .custom)
//        button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        button.setBackgroundImage(#imageLiteral(resourceName: "banned_tit_bj"), for: .normal)
        button.setBackgroundImage(#imageLiteral(resourceName: "highlight"), for: .highlighted);
        button.setImage(#imageLiteral(resourceName: "sanjiao"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        //内边距 上左下右
        button.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0)
        button.imageView?.contentMode = UIViewContentMode.center
        button.imageView?.clipsToBounds = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.button = button
        self.addSubview(self.button)
        
        //创建label,显示在线人数
        let labelRight = UILabel.init()
        labelRight.textAlignment = NSTextAlignment.center
        self.label = labelRight
        self.addSubview(self.label)
    }
    
    
    
    @objc func buttonAction() {
        self.groupModel.expend = !self.groupModel.expend
        delegate?.clickView!()
    }
    
    //
    override func didMoveToSuperview() {
        if self.groupModel.expend {
            self.button.imageView?.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI_2))
        }else{
            self.button.imageView?.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    //布局
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.button.frame = self.bounds
        self.label.frame = CGRect(x: self.frame.size.width - 70, y: 0, width: 60, height: self.frame.size.height)
    }
    
    
    //赋值
    func setGroupModel(groupModel: ClassModel) {
        self.groupModel = groupModel
        self.button.setTitle(self.groupModel?.className, for: .normal)
        if let num = self.groupModel?.students.count{
        self.label.text = "\(num)"
        }
    }
    
    
}
