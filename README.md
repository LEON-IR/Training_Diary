# トレーニングダイアリー

## サイト概要
その日に行ったトレーニングメニューの記録を保存でき、仲間と共有し、コメントを残してもらったり<br>
評価をしてもらうECサイト

### サイトテーマ
トレーニングを題材としたSNS

### テーマを選んだ理由
前職がスイミングインストラクターということもあり、趣味がトレーニングなのですが、トレーニングをした日に<br>
どの部位のどの種目を何回やったかなどを記録しておけるサイトやアプリがあまりなくメモ帳などで<br>
記録していたため,自分のトレーニングメニューを保存・投稿でき仲間と共有できるEcサイトを作成しようと<br>
思い至った。

### ターゲットユーザ
日々トレーニングを行っているすべての人

### 主な利用シーン
トレーニング中やトレーニング終了後、後日やる予定のトレーニングメニューを投稿

## 設計書
トップページヘッダーにはホーム,アバウト,新規登録,ログインを設置<br>
トップページレイアウトには前面にトレーニング写真

〇会員<br>
●トップページ→ログイン→ユーザー情報→ユーザー投稿履歴に遷移する<br>
〇未入会<br>
●トップページ→ユーザー情報登録→ユーザー投稿履歴に遷移する<br>
〇ログイン後のヘッダー<br>
●ホーム,ユーザー一覧,筋トレメニュー,ログアウト<br>

ホームで個人ページに遷移、新規投稿機能・過去の投稿一覧設置、投稿した日時を記録<br>
選択項目などをチャレンジしたい<br>

ユーザー一覧に遷移・フォロー機能実装、Showで他ユーザー投稿の題名と本文を表示<br>

筋トレメニューで他ユーザーの写真とトレーニング種目・トレーーニング内容・いいね機能・フォロー機能実装<br>

ログアウトでトップページに遷移<br>


### 機能一覧
https://docs.google.com/spreadsheets/d/1hNVx6lLicCT8hYl0y47f9TYJWL3xJQt_GLyEkmBosYM/edit?usp=sharing

## 開発環境
- OS：Linux(CentOS)<br>
- 言語：HTML,CSS,JavaScript,Ruby,SQL<br>
- フレームワーク：Ruby on Rails<br>
- JSライブラリ：jQuery<br>
- 仮想環境：Vagrant,VirtualBox<br>
gem 'devise'<br>
gem 'bootstrap-sass, '~> 3.3.6'
gem rubocop<br>
gem 'jquery-rails'<br>
gem 'jp_prefecture'<br>
gem 'kaminari 1.2.1'<br>
gem "refile", require: "refile/rails", github: 'manfe/refile'<br>
gem "refile-mini_magick"<br>


## 使用素材
Bookers2<br>
pixabay<br>
筋トレ ブログ | Golden Biceps<br>
https://golden-biceps.com/category/workout_logs/<br>
「筋トレ日記」- サクサク入力できる<br>
https://apps.apple.com/jp/app/%E7%AD%8B%E3%83%88%E3%83%AC%E6%97%A5%E8%A8%98-%E3%82%B5%E3%82%AF%E3%82%B5%E3%82%AF%E5%85%A5%E5%8A%9B%E3%81%A7%E3%81%8D%E3%82%8B/id1367302766
