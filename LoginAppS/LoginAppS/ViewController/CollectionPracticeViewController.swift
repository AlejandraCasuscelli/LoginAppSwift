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

class CollectionPracticeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuItems:[MenuItem] = [MenuItem(DisplayName: "Home", Icon: UIImage(named: "icono_home")),
    MenuItem(DisplayName: "Chat", Icon: UIImage(named: "icono_chat")),
    MenuItem(DisplayName: "Notificaciones", Icon: UIImage(named: "icono_notificaciones")),
    MenuItem(DisplayName: "MiPerfil", Icon: UIImage(named: "icono_miperfil"))]
    
//       var burges = ["Home","Chat","Notificaciones","MiPerfil"]
//       var burgerImages = [UIImage(named: "icono_home")!,
//                           UIImage(named: "icono_chat")!,
//                           UIImage(named: "icono_notificaciones")!,
//                           UIImage(named: "icono_miperfil")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Obtengo la medida para las columnas de la collection view
        let width = (view.frame.size.width - 10) / 2
        
        //Obtengo el layout de mi collection view
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: width, height: width)
        
//        menuItems = [MenuItem(DisplayName: "Home", Icon: UIImage(named: "icono_home")),
//                     MenuItem(DisplayName: "Chat", Icon: UIImage(named: "icono_chat")),
//                     MenuItem(DisplayName: "Notificaciones", Icon: UIImage(named: "icono_notificaciones")),
//                     MenuItem(DisplayName: "MiPerfil", Icon: UIImage(named: "icono_miperfil"))
//        ]
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! PrincipalMenuCollectionViewCell
//        menuCell.labelTest.text = burges[indexPath.item]
//        menuCell.imageTest.image = burgerImages[indexPath.item]
        menuCell.labelTest.text = menuItems[indexPath.item].DisplayName
        menuCell.imageTest.image = menuItems[indexPath.item].Icon
        return menuCell
    }

}
