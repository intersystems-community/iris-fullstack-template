# InterSystems IRIS Full Stack demo and template
このリポジトリは「coffee-maker shop」デモ用の InterSystems IRIS REST API とフロントエンドアプリケーションで構成されたサンプルアプリケーションです。

このデモを通して、フロントエンドアプリケーションから InterSystems IRIS への接続方法がご確認いただけます。
リポジトリには、ユニットテストコードも含まれていて、インタラクティブに実行できるほか、ZPM を使ったり、GitHub CI（[GitHub Actions](https://docs.github.com/ja/actions/reference/workflow-syntax-for-github-actions)) を介して実行することもできます。

Docker コンテナを使った開発方法のデモも含まれています
また、ZPM モジュールでアプリケーションをパッケージ化する方法、ZPM を使ってデプロイする方法も含まれています。

## インストール方法
### Docker を利用する場合
リポジトリを clone 後、docker-compose.yml があるディレクトリで以下実行します。
```
docker-compose up -d
```
アプリケーションを以下のURLで実行します。

URL: http://localhost:52775/csp/coffee/index.html#/

### ZPM を利用する場合
IRIS ターミナルを開き、以下 ZPM コマンドを実行します。
```
USER>zpm
zpm:USER>install "demo-coffeemaker"
```
アプリケーションを以下URLで実行します。

URL: http://yourserver:52775/csp/coffee/index.html#/

## 開発方法
### 前提条件
[git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) と [Docker desktop](https://www.docker.com/products/docker-desktop) がインストールされた環境をご準備ください。

このリポジトリには、ObjectScript のプラグインを使って [VSCode](https://code.visualstudio.com/) のコーディングできるようになっています。
[VSCode](https://code.visualstudio.com/)、[Docker](https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker)、[ObjectScript](https://marketplace.visualstudio.com/items?itemName=daimor.vscode-objectscript) プラグインをインストールし、VSCode 内のフォルダを開きます。

このリポジトリは開発テンプレートです。GitHub の「Use this template」ボタンを利用して iris-fullstack-template コピーしたリポジトリを新規で作成します。

![template](https://user-images.githubusercontent.com/2781759/93434019-4142bc00-f8d0-11ea-9b09-0e64501dde53.gif)

あなたのリポジトリをクローンし、VSCodeでクローンしたフォルダを開きます。
以下の gif にで紹介しているようにコンテナをビルドします。

![template-build](https://user-images.githubusercontent.com/2781759/93434498-ebbadf00-f8d0-11ea-992e-3197f007d3bf.gif)

または、ターミナルを開き、以下実行します。
```
docker-compose up -d
```
VSCode の ObjectScript メニューでアプリケーションが実行しているかどうか確認します。

![template-app1](https://user-images.githubusercontent.com/2781759/93438148-946b3d80-f8d5-11ea-8373-71383bf6395b.gif)

ここまで動作できたら、開発を開始できます。

## ユニットテストの利用
このリポジトリは、[Unit Tests](https://github.com/intersystems-community/iris-fullstack-template/blob/787acb10efae8847e3084db26c3e4211bd5a753a/tests/UnitTest/Demo/coffeemaker.cls) を含んでいます。
このリポジトリには、[Github Actions CI workflow](https://github.com/intersystems-community/iris-fullstack-template/blob/787acb10efae8847e3084db26c3e4211bd5a753a/.github/workflows/main.yml) が含まれていて、GitHub リポジトリへ Push する毎にユニットテストを行い、テストを失敗すると失敗する仕組みになっています。

ですが、ローカルでテストスクリプトを実行することもできます。
```
COFFEE>set ^UnitTestRoot="/irisdev/app/tests"
COFFEE>do ##class(%UnitTest.Manager).RunTest()
```
または、ZPM 使用することもできます。
```
COFFEE>zpm
zpm:COFFEE>load /irisdev/app
zpm:COFFEE>test demo-coffeemaker
```

## ZPM Package Manager
このモジュールは、ZPM でパッケージ化されていて、[module.xml](https://github.com/intersystems-community/iris-fullstack-template/blob/40d39a688df604ef11681c80fc24254a6570fe43/module.xml)で記述され、パブリックリポジトリで利用可能で、インストールは以下のコマンドを使用します。
zpm "install demo-coffeemaker"

例として、自由に使用して、module.xml を変更して独自の InterSystems IRIS フルスタック・ソリューションをパッケージ化してください。


## Credits
デモは、Michael Smart によってオリジナルの  [Coffee Maker application](https://github.com/intersystems/FirstLook-REST) が開発されています。また、[Caret Dev](https://github.com/caretdev/CoffeeMaker)により、拡張バージョンが用意されています。
