//
//  PrincipalPageViewController.swift
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

class PrincipalPageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var menuItems:[MenuItem] = [MenuItem(DisplayName: "Home", Icon: UIImage(named: "icono_home")),
    MenuItem(DisplayName: "Chat", Icon: UIImage(named: "icono_chat")),
    MenuItem(DisplayName: "Notificaciones", Icon: UIImage(named: "icono_notificaciones")),
    MenuItem(DisplayName: "Gestion de CBU", Icon: UIImage(named: "icono_gestion_cbu")),
    MenuItem(DisplayName: "Credencial", Icon: UIImage(named: "icono_credenciales")),
    MenuItem(DisplayName: "Turnos y traslados", Icon: UIImage(named: "icono_turnos")),
    MenuItem(DisplayName: "MiPerfil", Icon: UIImage(named: "icono_miperfil"))]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Obtengo la medida para las columnas de la collection view
        let width = (collectionView.frame.size.width - 30) / 3
        let height = (collectionView.frame.size.height - 30) / 3
        //Obtengo el layout de mi collection view
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        layout.itemSize = CGSize(width: width, height: height)
        
//        var imgLogoProvincia = UIImage(named: "provincia_logo")
//        
//        var navController = navigationController!
//        
//        var navWidth = navController.navigationBar.frame.size.width
//        var navHeight = navController.navigationBar.frame.size.height
//        
//        var navX = navWidth / 2
//        var navY = navHeight / 2
//        
//        var logoProvincia = UIImageView(image: imgLogoProvincia)
//        var frame = CGRect(x: navX, y: navY, width: 10, height: 10)
//        logoProvincia.frame = frame
//        logoProvincia.contentMode = .scaleAspectFit
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: logoProvincia)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let menuCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PrincipalMenuCell", for: indexPath) as! PrincipalMenuCollectionViewCell
            menuCell.tittleMenu.text = menuItems[indexPath.item].DisplayName
            menuCell.imageMenu.image = menuItems[indexPath.item].Icon
            menuCell.layer.borderColor = UIColor.white.cgColor
            menuCell.layer.borderWidth = 1
            return menuCell
        }


}
