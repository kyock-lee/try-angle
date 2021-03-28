# TRY-ANGLE
### TRY-ANGLEとは、体重・食事・トレーニングの３つの観点からトレーニーをサポートするアプリケーション

![トップページ](https://i.gyazo.com/c75352073992a109d4669077fb5b39cf.jpg)


# アプリケーションの概要
・体重の管理          →  入力データを折線グラフ化し、体重推移を確認ができる<br>
・食事の管理          →  入力データを一覧表示し、過去の食事を振り返る事ができる<br>
・トレーニングの管理  →  入力データを一覧表示し、過去のトレーニングを振り返る事ができる

# 機能一覧
| 機能           | 概要                                    　　　　　　　　　  | 
|:--------------|:---------------------------------------------------------|
|ユーザー管理機能　|新規登録・ログイン・ログアウトが可能　　　　　　　　　　　　　　　　　　　 | 
|体重管理機能     |ログインしたユーザーは、体重と日付の入力後、グラフで体重推移を確認可能    | 
|食事管理機能     |ログインしたユーザーは、食事の画像、日付、内容を投稿後、一覧表示で確認可能 | 
|トレーニング管理機能|ログインしたユーザーは、トレーニング内容、日付を入力後、一覧表示で確認可能 | 
|投稿内容編集機能　|ログインしたユーザーは、食事内容・トレーニング内容の編集機能　　　　　 　　|

# URL
https://try-angle.herokuapp.com/


# テスト用アカウント

テストユーザーは、ログイン画面からボタン一つでログインできるようになっています。 是非そちらをご利用ください。


# 利用方法

### アカウントの新規登録、ログイン後に「体重管理機能・食事管理機能・トレーニング管理機能」を使用できます。

### ◆体重管理機能

①「体重の記録」アイコン、またはヘッダーの「体重の記録」から、体重の記録画面へ。<br>

　![2e27cc29fb0dadd792b5b6fdd095a691](https://user-images.githubusercontent.com/78146812/112335187-5d03a080-8cff-11eb-9f25-a932a402badf.gif)

②「記録する」をクリック後、必要項目を入力して送信ボタンを押すと、データが２つ以上ある時、折れ線グラフが表示されます。
 
 ![cc75e06097fb6797e4efbaced6dc9efe](https://user-images.githubusercontent.com/78146812/112338994-9e497f80-8d02-11eb-9398-fbc6a6ba0e0f.gif)

### ◆食事管理機能

①「食事の記録」アイコン、またはヘッダーの「食事の記録」から、食事の記録画面へ。

![52857234600780a8e0f04f2cc7dca1a7](https://user-images.githubusercontent.com/78146812/112341646-f2556380-8d04-11eb-814b-44da4b4c6d7a.gif)

②「記録する」をクリック後、必要項目を入力して送信ボタンを押すと、入力内容が新しい順に一覧表示されます。

![e65866b1fdcfb60c64e34d6456cabc9f](https://user-images.githubusercontent.com/78146812/112342379-86272f80-8d05-11eb-9037-b329532fa0e3.gif)

### トレーニング管理機能

①「トレーニングの記録」アイコン、またはヘッダーの「トレーニングの記録」から、トレーニングの記録画面へ。

![cf65bcea4f2a7719d7ff0759b88b5f6e](https://user-images.githubusercontent.com/78146812/112344003-026e4280-8d07-11eb-97c8-be1e3a1ae531.gif)

②「記録する」をクリック後、必要項目を入力して送信ボタンを押すと、入力内容が新しい順に一覧表示されます。

![3fe94671c2b3f5a4761380f0d997af3c](https://user-images.githubusercontent.com/78146812/112344568-8e806a00-8d07-11eb-86c7-5a7e7fe0e2ca.gif)


# 目指した課題解決

| ユーザーストーリーから考える課題	                                       | 課題解決                                                          | 
|:----------------------------------------------------------------|:-----------------------------------------------------------------|
| 簡易的に体重・食事・トレーニング管理アプリケーションがあまりない 　　　　　　　　　　| 入力項目を絞っている為、時間をかけずに記録ができる。 　　　　　　　　　　　　　　 | 
| 個人で管理できるアプリはあるが、トレーナーが一元的に管理できるアプリケーションがない  | ユーザー情報を共有する事で、体重・食事・トレーニングを全てトレーナーとも共有ができる  | 
| トレーニングの結果はすぐに現れない為、継続が難しい                          |  グラフ、一覧表で可視化され、体重や扱える重量をすぐに確認ができて変化を感じやすい  | 

# 

# 実装予定の機能
・体重、トレーニングの記録ページに目標設定機能の追加<br>
・トレーナー専用ページとして、ユーザー情報一覧ページの追加<br>
・各ページでの検索機能（日付やトレーニング項目）<br>

# データベース設計
## users

|Column              |Type    |Options                    |
|--------------------|--------|---------------------------|
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| family_name        | string | null: false               |
| last_name          | string | null: false               |
| family_name_kana   | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
has_many :weights<br>
has_many :meals<br>
has_many :trainings


## weights

|Column              |Type         |Options                         |
|--------------------|-------------|--------------------------------|
| date               | date        | null: false                    |
| weight             | integer     | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
belongs_to :user


## meals

|Column              |Type         |Options                         |
|--------------------|-------------|--------------------------------|
| date               | date        | null: false                    |
| description        | text        |                                |
| user               | references  | null: false, foreign_key: true |

### Association
belongs_to :user


## trainings

|Column              |Type         |Options                         |
|--------------------|-------------|--------------------------------|
| date               | date        | null: false                    |
| description        | text        | null: false                    |
| user               | references  | null: false, foreign_key: true |

### Association
belongs_to :user

# 開発環境
+ VScode
+ Ruby 2.6.5
+ Rails 6.0.3.5
+ mysql2 5.6.5
+ HTML
+ CSS,SCSS
+ JavaScript




