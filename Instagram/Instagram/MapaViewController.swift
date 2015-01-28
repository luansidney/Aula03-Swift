//
//  MapaViewController.swift
//  Instagram
//
//  Created by DeviOS on 28/01/15.
//  Copyright (c) 2015 DeviOS. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapview: MKMapView!
    
    var listaDeFotos = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mapview.delegate = self
        
        self.mapview.showsUserLocation = true
        
        for foto in self.listaDeFotos{
            let localizacao = foto["localizacao"] as PFGeoPoint
            let coordenada = CLLocationCoordinate2DMake(localizacao.latitude, localizacao.longitude)
            
            let anotacao = AnotacaoMKPointAnnotation()
            anotacao.coordinate = coordenada
            anotacao.title = foto["descricao"] as String
            
            let imgSalva = foto["imagem"] as PFFile
            
            imgSalva.getDataInBackgroundWithBlock { (imagemDown: NSData!, error) -> Void in
                anotacao.imagem = UIImage(data: imagemDown)
                
                 self.mapview.addAnnotation(anotacao)
            }

            
            
            
           
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func mapView(mapView: MKMapView!, didUpdateUserLocation userLocation: MKUserLocation!) {
        //self.mapview.userLocation = userLocation
        
        let regiao = MKCoordinateRegionMake( userLocation.coordinate, MKCoordinateSpanMake(0.02, 0.02))
        
        self.mapview.setRegion(regiao, animated: true)
        self.mapview.mapType = MKMapType.Hybrid
    }
    
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        if annotation is AnotacaoMKPointAnnotation{
            
            var umaView = self.mapview.dequeueReusableAnnotationViewWithIdentifier("pinCustumizado")
            
            if umaView == nil{
                umaView = MKAnnotationView(annotation: annotation, reuseIdentifier: "pinCustumizado")
            }
            else{
                umaView.annotation = annotation
            }
            
            let meuPin = annotation as AnotacaoMKPointAnnotation
            umaView.image  = RBResizeImage(meuPin.imagem, targetSize: CGSizeMake(32, 32))
            return umaView
        }
        else{
            return nil
        }
    }
    
    
    func RBResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
