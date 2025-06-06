//
//  ViewControllerReproductor.swift
//  PruebaBloque1XiB
//
//  Created by Gopenux on 5/06/25.
//

import UIKit
import AVFoundation

struct Cancion {
    let title: String
}

class ViewControllerReproductor: UIViewController {

    private var canciones: [Cancion] = [
           Cancion(title: "cancion1"),
           Cancion(title: "cancion2"),
           Cancion(title: "cancion3"),
           Cancion(title: "cancion4"),
           Cancion(title: "cancion5"),
           Cancion(title: "cancion6"),
       ]
    
    private var reproductor: AVAudioPlayer?
    private var cancionActual: String?
       
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = .systemBackground

        tableView.dataSource = self
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "TableViewCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }

}

extension ViewControllerReproductor: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        canciones.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        let model = canciones[indexPath.row]
        cell.configure(model: model)

        return cell
    }
}
