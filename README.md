# japanese-menu.el (Emacs GUI menu Japanese translation)

[![MELPA](https://melpa.org/packages/japanese-menu-badge.svg)](https://melpa.org/#/japanese-menu)
[![test](https://github.com/yt-emacs-ja/emacs-japanese-menu/actions/workflows/test.yml/badge.svg)](https://github.com/yt-emacs-ja/emacs-japanese-menu/actions/workflows/test.yml)

Emacs の GUI メニュー（メニューバー / プルダウン / 右クリック等）を、
英語ラベル → 日本語ラベルの辞書で置換します。

GNU Emacs 30.1 / 30.2 / 31.1 は実機の画面で確認しています。詳細は「動作確認環境」を参照してください。


---

## 使い方

### MELPAからインストール（推奨）

MELPAをパッケージ取得先に設定したGNU Emacsで、次を実行します。

```text
M-x package-refresh-contents RET
M-x package-install RET japanese-menu RET
```

インストールすると、日本語メニューが有効になります（Emacs を再起動しても維持されます）。
有効にならない場合や、明示的に有効化したい場合は、`init.el` に次を追加します。

```elisp
(require 'japanese-menu)
(japanese-menu-setup)
```

Emacsを再起動すると、日本語メニューが有効になります。

### 手動インストール

#### 1) ファイル配置（例）

```text
~/.emacs.d/lisp/japanese-menu.el
```

#### 2) init.el に追記

```elisp
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'japanese-menu)
(japanese-menu-setup)
```

#### 3) 反映

Emacs を再起動します。

または、`init.el` を開いて `M-x eval-buffer` を実行します。

---

## 動作確認環境

### 実機（画面で目視）

#### macOS（ネイティブ環境）

- OS: macOS Tahoe 26.2
- Emacs: GNU Emacs 30.2 (GUI)
- Emacs: GNU Emacs 31.1 (GUI、Emacs for Mac OS X のユニバーサルバイナリ)
- インストール方法: MELPA (package-install)
- 動作確認: パッケージのインストール直後にGUIメニューが日本語化され、再起動後も維持されることを確認
- 検証条件: 31.1 は、設定なしの初期状態から MELPA でインストール

  
#### Windows（ネイティブ環境）

- OS: Windows 11 Pro (Surface Laptop 4)
- Emacs: GNU Emacs 30.2 (GUI、64ビット)
- インストール方法: MELPA (package-install)
- 動作確認:
  - GUIメニューバーとプルダウンメニューの日本語化
  - Control + 右クリックによるポップアップメニューの日本語化
  - .emacs に設定を追加し、再起動後も自動的に日本語化されることを確認

#### Ubuntu（VMware Fusion仮想環境）

- Host OS: macOS Tahoe 26.2
- Virtualization: VMware Fusion Professional 25H2 (VMware20,1)
- Guest OS: Ubuntu 25.10 (aarch64)
- Kernel: Linux 6.17.0-8-generic
- Desktop Environment: GNOME 49.0
- Display Server: Wayland (Mutter)
- Emacs:
  - GNU Emacs 30.1
  - aarch64-unknown-linux-gnu
  - GTK+ 3.24.50
  - cairo 1.18.4
  - Debian build (2025-08-28)
 
#### Fedora Asahi Remix（ネイティブ環境）

- OS: Fedora Linux Asahi Remix 45 (KDE Plasma Desktop Edition Prerelease)
- Desktop Environment: KDE Plasma
- Display Server: Wayland

- Emacs: GNU Emacs 31.1 (GUI、Fedora 公式パッケージ emacs-31.1-8.fc45.aarch64)
- インストール方法: MELPA (package-install)
- 動作確認: パッケージのインストール直後にGUIメニューが日本語化されることを確認
- 右クリックメニュー: Control + 右クリックで日本語化されることを確認

### 自動テスト（GitHub Actions）

GitHub が提供する仮想環境（ubuntu-latest / macos-latest / windows-latest）で、
GNU Emacs 30.2 と 31.1 に対して、バイトコンパイルと ERT テストを実行しています。

ERT テストでは、メニューの日本語化が適用されることと、辞書に訳の食い違いがないことを、
画面を出さずに確認しています。

画面表示そのものの確認は、上の実機の環境で行っています。
GNU Emacs 31.1 は、macOS と Fedora では実機の画面で確認済みです。
Windows 11 では、Smart App Control の制限のため、自動テストのみです。

---

## 確認済み内容

- メニューバー (File / Edit / Options / Tools / Help)
- プルダウンメニュー
- モード固有メニュー (Info-mode 等)
- 右クリックメニュー (popup-menu / x-popup-menu)

## 注意

- 端末版 Emacs (`emacs -nw`) は GUI メニューが存在しないため対象外です。
- メニューラベルは Emacs / パッケージのバージョンにより表記揺れがあります。
  必要に応じて辞書を追加してください。

---

## License

This package is licensed under GPL-3.0-or-later.

## Links

- GitHub repository: https://github.com/yt-emacs-ja/emacs-japanese-menu
- GitHub Releases: https://github.com/yt-emacs-ja/emacs-japanese-menu/releases
- EmacsWiki: https://www.emacswiki.org/emacs/japanese-menu
