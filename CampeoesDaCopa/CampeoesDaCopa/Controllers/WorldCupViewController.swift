//
//  WorldCupViewController.swift
//  CampeoesDaCopa
//
//  Created by jplima on 10/10/22.
//

import UIKit

class WorldCupViewController: UIViewController {

    var worldCup: WorldCup!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Ano da copa selecionado: \(worldCup.year)")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
