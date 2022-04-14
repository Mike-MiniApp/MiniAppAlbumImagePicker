//
//  CheckPermission.swift
//  MiniAppAlbum
//
//  Created by 近藤米功 on 2022/04/14.
//

import Foundation
import Photos

class CheckPermission{

    // ユーザに許可を促す
    func checkCamera(){
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status){
            case .authorized:
                print("許可")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restriceted")
            case .denied:
                print("denied")
            case .limited:
                print("limited")
            @unknown default:
                break
            }
        }
    }
}
