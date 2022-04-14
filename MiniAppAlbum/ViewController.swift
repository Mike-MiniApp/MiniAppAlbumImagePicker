//
//  ViewController.swift
//  MiniAppAlbum
//
//  Created by 近藤米功 on 2022/04/14.
//

import UIKit
import Photos

class ViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    @IBOutlet weak var backImageView: UIImageView!
    var checkPermission = CheckPermission()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkPermission.checkCamera()
    }

    @IBAction func tappedAlbumButton(_ sender: Any) {
        let sourceType: UIImagePickerController.SourceType = .photoLibrary
        createImagePicker(sourceType: sourceType)
    }

    func createImagePicker(sourceType: UIImagePickerController.SourceType){
        let albumImagePicker = UIImagePickerController()
        albumImagePicker.sourceType = sourceType
        albumImagePicker.delegate = self
        albumImagePicker.allowsEditing = true
        self.present(albumImagePicker, animated: true, completion: nil)
    }

    // アルバムのキャンセルボタンがタップされた時に呼ばれるデリゲートメソッド
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // アルバムを閉じる処理
        picker.dismiss(animated: true, completion: nil)
    }

    // アルバムで画像を選択した時に呼ばれるデリゲートメソッド
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // 選択した画像情報がinfo[.editedImage] as? UIImageに入る
        if let pickerImage = info[.editedImage] as? UIImage{
            backImageView.image = pickerImage
            // アルバムを閉じる処理
            picker.dismiss(animated: true, completion: nil)
        }
    }

}

