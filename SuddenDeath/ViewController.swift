//
//  ViewController.swift
//  SuddenDeath
//
//  Created by haruka on 2019/10/04.
//  Copyright © 2019 haruka. All rights reserved.
//
//＿人人人人人人＿
//＞　突然の死　＜
//￣Y^Y^Y^Y^Y^Y￣

import UIKit

class ViewController: UIViewController {
    
    // テキスト入れるところ
    @IBOutlet weak var inputField: UITextView!
    // 生成するボタン
    @IBOutlet weak var generationButton: UIButton!
    // 結果を表示するところ
    @IBOutlet weak var resultField: UITextView!
    
    // 上のテキスト
    let top:String = "人"
    var tops:String = ""
    // 左のテキスト
    let left:String = "＞　"
    var lefts:String = ""
    // 右のテキスト
    let right:String = "　＜"
    var rights:String = ""
    // 下のテキスト
    let under:String = "Y^"
    var unders:String = ""
    
    // 最終テキスト
    var resultText:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultField.isEditable = false
    }

    // ボタン押した時の動き
    @IBAction func generationStart(_ sender: UIButton) {
        
        var resultTextTop:String
        var resultTextUnder:String
        var centerText:String
        
        // 初期化
        tops = ""
        
        // キーボードを下ろす
        self.view.endEditing(true)
        
        // テキストフィールドの文字を読み込む
        resultText = inputField.text
        
        // 改行フラグ
        var returnFlg = false
        
        // 改行されていたら改行フラグをtrueにする
        if resultText.range(of: "\n") != nil {
            returnFlg = true
        }
//        if let searchStr = resultText.range(of: "\n") {
//            returnFlg = true
//        }
        
        // -----------------------------------
        // 上を生成する
        var countTop = resultText.count + 2
        while 0 < countTop {
            tops += top
            countTop -= 1
        }
        // 上の段を完成させる
        resultTextTop = "＿" + tops + "＿" + ("\n")
        // -----------------------------------
        // 下を生成する
        var countUnder = resultText.count + 2
        while 0 < countUnder {
            unders += under
            countUnder -= 1
        }
        // 1文字消す
        let undersStr = unders.prefix((resultText.count + 2) * 2 - 1)
        // 下の段を完成させる
        resultTextUnder = "￣" + undersStr + "￣"
        // -----------------------------------
        // 真ん中の段を完成させる
        centerText = left + resultText + right + ("\n")
        
        // 改行されていたらcenterTextの段数を増やす
        if returnFlg == true {
            
            // 行数を取得して配列に入れる
            var nTextLines = resultText.components(separatedBy: .newlines)
            
            // 何行あるか数える
            var lineCount = nTextLines.count
            
            // 一番文字数が多い配列をmaxStr[0]に設定
            var maxStr = nTextLines.max(by: {$1.count > $0.count})
            
            // 文字数が多い文字列プラス2が中心になる行数
            
            resultText = "調整中！"
            
        } else {
            // 全体を完成させる
            resultText = resultTextTop + centerText + resultTextUnder
        }
        
        // 特殊処理
        if inputField.text == "ホモ" {
            resultText = "┌(┌^o^)┐ホモォ..."
        }
        
        if inputField.text == "卍" {
            resultText = "三└(┐卍^o^)卍ﾄﾞｩﾙﾙﾙ"
        }
        
        // 結果に表示する
        resultField.text = resultText
    }
    
    // コピーボタンの処理
    @IBAction func textCopyAction(_ sender: UIButton) {
        // 初期化
        let board = UIPasteboard.general
        // テキストをコピーする
        board.string = resultText
        // 確認ダイアログ
        let alert = UIAlertController(title: "確認", message: "コピー完了！", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    // 画面をタッチしたときキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

