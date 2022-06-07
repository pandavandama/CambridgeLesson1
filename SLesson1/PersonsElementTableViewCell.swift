//
//  PersonsElementTableViewCell.swift
//  SLesson1
//
//  Created by Константин Кифа on 06.06.2022.
//

import UIKit

class PersonsElementTableViewCell: UITableViewCell {
    
    static let ID = "PersonsElementTableViewCell"
    static func nib() -> UINib{
        return UINib(nibName: ID, bundle: nil)
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var hairColorLabel: UILabel!
    
    @IBOutlet weak var personImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
