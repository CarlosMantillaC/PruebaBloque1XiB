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
    
    
    private var isReproduciendo: Bool = false {
        didSet {
            nameLabel.textColor = isReproduciendo ? .systemBlue : .label
        }
    }
    
    weak var accionesBotones: AccionesBotones?

    
    @IBAction func reproducirAccionBoton(_ sender: Any) {
        accionesBotones?.reproducirAccion(cell: self)
    }
    
    @IBAction func pausarAccionBoton(_ sender: Any) {
        accionesBotones?.pausarAccion(cell: self)
    }
    
    
    func configure(model: Cancion, isReproduciendo: Bool) {
        nameLabel.text = model.title
        self.isReproduciendo = isReproduciendo
    }
}
