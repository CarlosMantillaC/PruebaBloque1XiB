//
//  TableViewCell.swift
//  PruebaBloque1XiB
//
//  Created by Gopenux on 6/06/25.
//

import UIKit


protocol AccionesBotones: AnyObject {
    func reproducirAccion(cell: TableViewCell)
    func pausarAccion(cell: TableViewCell)
}

class TableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var botonReproducir: UIButton!
    @IBOutlet weak var botonPausar: UIButton!
    
    
    weak var accionesBotones: AccionesBotones?

    func configure(model: Cancion) {
           nameLabel.text = model.title
    }
}
