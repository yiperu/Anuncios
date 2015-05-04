//
//  ViewController.swift
//  PryiAdBannerVCSwift
//
//  Created by Henry AT on 5/4/15.
//  Copyright (c) 2015 Apps4s. All rights reserved.
//


// En la parte superios tendremos el Anuncio con 

// En la parte inferior tenemos de tipo programmatically.


import UIKit

import iAd


class ViewController: UIViewController, ADBannerViewDelegate {  // Declaramos un Delegado
  
  // Creamos la variable del Banner (devil)
  weak var bannerView: ADBannerView!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    // Invocamos el Metodo
    loadBannerView()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  // Sobre Escribimos el Metodo UpdateViewConstraint
  override func updateViewConstraints() {
    super.updateViewConstraints()
    loadBannerViewConstraints()
    
  }
  
  // MARK: - Implementamos el metodo de carga del Banner programmatically:
  
  func loadBannerView() {
    
    let banner = ADBannerView(adType: ADAdType.Banner)
    bannerView = banner
    bannerView.delegate = self  // Muy importante, definir que este sera su delegate
    view.addSubview(banner)
  }
  
  // MARK: - Manejo de los Constrait para el Anuncio
  
  func loadBannerViewConstraints() {
    
    bannerView.setTranslatesAutoresizingMaskIntoConstraints(false)
    let horizontal = NSLayoutConstraint(item: bannerView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
    
    let vertical = NSLayoutConstraint(item: bannerView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
    
    view.addConstraint(horizontal)
    view.addConstraint(vertical)

  }


  // MARK: - Implementamos las funciones del Delegado para administrar los Errores:
  // Si ha ocurrido un Error
  func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
    println("--  --  --  --  --  --")
    println(error)
    println("--  --  --  --  --  --")
  }
  
  func bannerViewWillLoadAd(banner: ADBannerView!) {
    println("bannerViewWill LoadAd")
  }
  func bannerViewDidLoadAd(banner: ADBannerView!) {
    println("bannerViewDid LoadAd")
  }
  
  // Indica si deberia o no iniciar una accion dentro de nuestro banner
  func bannerViewActionShouldBegin(banner: ADBannerView!, willLeaveApplication willLeave: Bool) -> Bool {
    return true
  }
  
  // Define que ya se ah acabado al interaccion del Usuario con el Anuncio.
  func bannerViewActionDidFinish(banner: ADBannerView!) {
        println("bannerViewAction DidFinish: Volvio despues de su interacion con el Anuncio")
  }
  
  
} // Fin de la Clase






