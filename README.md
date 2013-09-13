[oracle 12c](http://www.oracle.com/technetwork/jp/database/enterprise-edition/overview/index.html)のインストール・設定・動作検証を行う為のサーバ

## Usage

### サーバセットアップ

> HostOSコンソール上で実行

    host $ vagrant up                   # 仮想OS作成・起動
    host $ vagrant ssh                  # 仮想OSへssh接続
    vagrant $ vagrant su                # rootユーザへ切り替え（root password: vagrant）
    root $ /vagrant/shared/setup.sh     # サーバセットアップ（かなり時間かかります）
    root $ passwd oracle                # oracleユーザパスワード設定（パスワードは任意）
    root $ shutdown -r now              # サーバ再起動

#### 言語を日本語に変更

> デスクトップ環境から`oracle`ユーザでログイン

1. ツールバーより [System] > [Administration] > [Language] を選択
2. 「日本語」を選択
    - root password: vagrant
3. OS再起動
    - 言語選択反映の為、再起動が必要

#### Oracle12cインストール

> デスクトップ環境から`oracle`ユーザでログイン

1. ツールバーより [アプリケーション] > [システムツール] > [端末] を選択
2. 開いたコンソールで以下を実行

    database/runInstaller

> 前提条件チェックで「スワップサイズ」に問題が発生するが、検証環境なので「無視」にチェックし、続行