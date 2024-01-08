//
//  ContentView.swift
//  SearchBar_Sample
//
//  Created by 奥村亮 on 2024/01/08.
//

import SwiftUI

struct ContentView: View {
    // 状態変数 検索バーに入力される文字列
    @State private var inputText: String = ""
    // フォーカスによってキーボードの表示/非表示を管理するプロパティ
    @FocusState private var isKeybordOn: Bool
    
    var body: some View {
        VStack {
            HStack {
                HStack { // 検索バー
                Image(systemName: "magnifyingglass") // 左に虫眼鏡のアイコン
                TextField("キーワードを入力してください", text: $inputText, prompt: Text("キーワードを入力してください"))
                    .onSubmit { // 検索バーに入力が確定されると実行される
                    }
                    .textInputAutocapitalization(.none) // 自動で大文字にしない
                    .submitLabel(.search) // キーボードの表示を「改行」から「検索」に変更
                    .focused($isKeybordOn) // TextFieldをフォーカスの対象にする
                // 入力文字を消去するバツボタン
                ZStack(alignment: .trailing) {
                    if !inputText.isEmpty {// 文字が入力されると表示する
                        Image(systemName: "xmark.circle.fill")
                            .onTapGesture {
                                isKeybordOn = true //　入力文字の消去後にすぐ入力できるようにTextFieldにフォーカスを入れる
                                self.inputText = "" // 入力文字の消去
                            }
                            .padding(.trailing, 3) // 右に予約
                    }
                }
            } // HStack 検索バー
                // 上下左右に空白を空ける
                .padding()
                .background(Color(.systemGray5))
                .cornerRadius(5.5)
                .padding()
                // キャンセルボタン
                if isKeybordOn { // 検索窓にフォーカスある、または検索結果リストの場合に表示される
                    Button( action: {
                        inputText = "" // 文字が残っていたら消す
                        isKeybordOn = false // 検索窓のフォーカスを外すとキーボードが閉じる
                    }) {
                        Text("キャンセル").foregroundColor(.red)
                    }
                    .padding(.trailing, 10) // 右側に余白
                }
            }// HStack
            Spacer() // 上寄せ
        }// VStack
    }// body
}

#Preview {
    ContentView()
}
