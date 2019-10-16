//
//  ViewController.swift
//  expadTableCell
//
//  Created by humberto Lima on 16/10/19.
//  Copyright © 2019 humberto Lima. All rights reserved.
//

import UIKit

struct dadoTemp {
    var dado1 = String()
    var status = Bool()
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var tabelaTemp: UITableView!
    var arrayDados: [dadoTemp] = [
        dadoTemp(dado1: "dado 1", status: false),
        dadoTemp(dado1: "dado 2", status: false),
        dadoTemp(dado1: "dado 3", status: false),
        dadoTemp(dado1: "dado 4", status: false),
        dadoTemp(dado1: "dado 5", status: false),
        dadoTemp(dado1: "dado 6", status: false),
        dadoTemp(dado1: "dado 7", status: false),
        dadoTemp(dado1: "dado 8", status: false),
        dadoTemp(dado1: "dado 9", status: false),
        dadoTemp(dado1: "dado 10", status: false)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabelaTemp.delegate = self
        tabelaTemp.dataSource = self
        tabelaTemp.register(UINib(nibName: "CellTempTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayDados.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tabelaTemp.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellTempTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        arrayDados[indexPath.row].status = !arrayDados[indexPath.row].status
        tabelaTemp.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrayDados[indexPath.row].status {
            return 150
        }else {
            return 50
        }
    }

}

