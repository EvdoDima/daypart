//
//  TopAlignedLabel.swift
//  DayPart
//
//  Created by evdodima on 06/12/2016.
//  Copyright © 2016 Evdodima. All rights reserved.
//

import UIKit
@IBDesignable
class TopAlignedLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawText(in rect: CGRect) {
        let height = self.sizeThatFits(rect.size).height
        let y = rect.origin.y
        super.drawText(in: CGRect(x: rect.origin.x, y: y, width: rect.width, height: height))
    }


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
