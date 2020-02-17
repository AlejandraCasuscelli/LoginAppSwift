//
//  PrincipalViewController.swift
//  LoginAppS
//
//  Created by Alejandra Casuscelli on 17/02/2020.
//  Copyright © 2020 Alejandra Casuscelli. All rights reserved.
//

import UIKit

class MenuItem{
    init(DisplayName:String, Icon:UIImage?) {
        self.DisplayName = DisplayName
        self.Icon = Icon
    }
    var DisplayName:String
    var Icon:UIImage?
}

class PrincipalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    var menuItems:[MenuItem] = []
       var burges = ["Home","Chat","Notificaciones","MiPerfil"]
       var burgerImages = [UIImage(named: "icono_home")!,
                           UIImage(named: "icono_chat")!,
                           UIImage(named: "icono_notificaciones")!,
                           UIImage(named: "icono_miperfil")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = [MenuItem(DisplayName: "Home", Icon: UIImage(named: "icono_home")),
                     MenuItem(DisplayName: "Chat", Icon: UIImage(named: "icono_chat")),
                     MenuItem(DisplayName: "Notificaciones", Icon: UIImage(named: "icono_notificaciones")),
                     MenuItem(DisplayName: "MiPerfil", Icon: UIImage(named: "icono_miperfil"))
        ]
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return burges.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! PrincipalMenuCollectionViewCell
        menuCell.labelTest.text = burges[indexPath.item]
        return menuCell
    }

}