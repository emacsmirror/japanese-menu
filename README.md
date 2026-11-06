# japanese-menu.el (Emacs GUI menu Japanese translation)

[![MELPA](https://melpa.org/packages/japanese-menu-badge.svg)](https://melpa.org/#/japanese-menu)

## License

This package is licensed under GPL-3.0-or-later.


EmacsのGUIメニュー（メニューバー / プルダウン / 右クリック等）を、
英語ラベル → 日本語ラベルの辞書で置換します。  
macOS、Windows 11 Pro および Ubuntu の GNU Emacs (GUI) で動作確認しています。
主に Emacs 30.x で検証しています。
---

## 使い方

### MELPAからインストール（推奨）

MELPAをパッケージ取得先に設定したGNU Emacsで、次を実行します。

```text
M-x package-refresh-contents RET
M-x package-install RET japanese-menu RET
```

インストール後、`init.el` に次を追加します。

```elisp
(require 'japanese-menu)
(japanese-menu-setup)
```

Emacsを再起動すると、日本語メニューが有効になります。

### 手動インストール



#### 1) ファイル配置（例）

~/.emacs.d/lisp/japanese-menu.el


#### 2) init.el に追記

```elisp
(add-to-list 'load-path (expand-file-name "~/.emacs.d/lisp"))
(require 'japanese-menu)
(japanese-menu-setup)
```

#### 3) 反映

 Emacs を再起動します。

 または、 `init.el` を開いて　`M-x eval-buffer`　を実行します。

### 動作確認環境

### macOS（ネイティブ環境）

- OS: macOS Tahoe 26.2
- Emacs: GNU Emacs 30.2（GUI）
- インストール方法: MELPA（package-install）
- 動作確認: japanese-menu-setup の実行直後にGUIメニューが日本語化されることを確認
- 検証条件: emacs -Q で起動した初期状態からインストール
  
### Windows（ネイティブ環境）

- OS: Windows 11 Pro（Surface Laptop 4）
- Emacs: GNU Emacs 30.2（GUI、64ビット）
- インストール方法: MELPA（package-install）
- 動作確認:
  - GUIメニューバーとプルダウンメニューの日本語化
  - Control + 右クリックによるポップアップメニューの日本語化
  - .emacs に設定を追加し、再起動後も自動的に日本語化されることを確認
    
### Ubuntu（VMware Fusion仮想環境）

Host OS: macOS Tahoe 26.2

Virtualization: VMware Fusion Professional 25H2 (VMware20,1)

Guest OS: Ubuntu 25.10 (aarch64)

Kernel: Linux 6.17.0-8-generic

Desktop Environment: GNOME 49.0

Display Server: Wayland (Mutter)

Emacs:

GNU Emacs 30.1

aarch64-unknown-linux-gnu

GTK+ 3.24.50

cairo 1.18.4

Debian build (2025-08-28)

確認済み内容

メニューバー（File / Edit / Options / Tools / Help）

プルダウンメニュー

モード固有メニュー（Info-mode 等）

右クリックメニュー（popup-menu / x-popup-menu）

注意

端末版 Emacs（emacs -nw）は GUI メニューが存在しないため対象外です

メニューラベルは Emacs / パッケージのバージョンにより表記揺れがあります
必要に応じて辞書を追加してください


---

## Links

- GitHub repository: https://github.com/yt-emacs-ja/emacs-japanese-menu
- GitHub Releases: https://github.com/yt-emacs-ja/emacs-japanese-menu/releases
- EmacsWiki: https://www.emacswiki.org/emacs/japanese-menu






