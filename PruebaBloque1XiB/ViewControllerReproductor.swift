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
        let isReproduciendo = model.title == cancionActual
        cell.configure(model: model, isReproduciendo: isReproduciendo)
        cell.accionesBotones = self
        
        return cell
    }
}

extension ViewControllerReproductor: AccionesBotones {
    
    
    func reproducirAccion(cell: TableViewCell) {
        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let cancion = canciones[indexPath.row]
        
        if cancion.title == cancionActual {
            if let reproductor = reproductor, !reproductor.isPlaying {
                reproductor.play()
                print("reanudando")
                return
            }
        }
        
        reproducir(nombre: cancion.title)
        tableView.reloadData()

    }
    
    func pausarAccion(cell: TableViewCell) {

        guard let indexPath = tableView.indexPath(for: cell) else {
            return
        }
        
        let cancion = canciones[indexPath.row]
        
        if cancion.title == cancionActual && reproductor?.isPlaying == true {
            reproductor?.pause()
            print("Pausando canción: \(cancion.title)")
            } else {
            print("La canción del botón no está sonando")
            }
    }
    
}


extension ViewControllerReproductor {
    
    func reproducir(nombre: String) {
        guard let url = Bundle.main.url(forResource: nombre, withExtension: "mp3") else {
            print("No se encontró el archivo \(nombre).mp3")
            return
        }
        do {
            reproductor = try AVAudioPlayer(contentsOf: url)
            reproductor?.play()
            cancionActual = nombre
            print("Reproduciendo: \(nombre)")
        } catch {
            print("Error al reproducir la canción: \(error)")
        }
    }
}

extension ViewControllerReproductor {
    
    
    private func random(n: Int = 0, divisor: Int = 2, acumulado: [String] = []) {
        
        if acumulado.count == 3 {
            let cancion = acumulado[acumulado.count-1]
            reproducir(nombre: cancion)
            tableView.reloadData()
            return
        }
        
        if n < 2 {
            random(n: n+1, acumulado: acumulado)
            return
        }
        
        if divisor*divisor > n {
            
            var nuevoAcumulado = acumulado
            nuevoAcumulado.append(canciones[n].title)
            random(n: n+1, divisor: 2, acumulado: nuevoAcumulado)
            return
        }
        
        if  n % divisor == 0 {
            random(n: n+1, acumulado: acumulado)
            return
        }
       
        return random(n: n, divisor: divisor+1, acumulado: acumulado)
        
    }
    
    
}
