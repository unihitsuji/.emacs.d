;; -*- Mode: Emacs-Lisp ; coding: utf-8 -*-

;;; https://ayatakesi.github.io/emacs/25.1/Init-File.html
;;; emacs は以下の順で設定ファイルを探す
;;;   ~/.emacs ~/.emacs.el ~/.emacs.d/init.el

;;; Windows の emacs は、以下の順で設定ファイルを探す
;;; ~/AppData/Roaming/.emacs.el
;;; ~/AppData/Roaming/.emacs
;;; ~/AppData/Roaming/.emacs.d/init.el
;;; ~/AppData/Roaming/.emacs.d/init

;;; emacs を再起動させないで、設定内容を反映させたい
;;;     (A) M-x eval-region
;;;     (B) M-x eval-buffer

;;; 前回 開いたファイルを開く
(desktop-save-mode 1)

;;; Windows, X-Window 等のクリップボードを使う
;;;   端末で立ち上げた emacs はクリップボードが使えない
;;;   == カット(C-w) コピー(M-w) ペースト(C-y) がクリップボードと連動しない
;;;   => 端末機能のコピー(マウスで範囲選択 C-Ins) ペースト(Shif-Ins)を使う
;;(cond (window-system (setq x-select-enable-clipboard t)))
(setq x-select-enable-clipboard t)

;;; スクロール時のステップ行数
(setq scroll-step 1)

;;; デフォルトのタブ幅
;;;     tab-width はバッファローカル
(setq default-tab-width 2)

;;; TAB は使わない
(setq-default tab-width 4 indent-tabs-mode nil)

;;; ctags で宣言部分にジャンプ
;;;     M-. or M-x xref-find-difinitions

;;; ctags でジャンプした後、戻る
;;;     M-* or M-x pop-tag-mark
(define-key global-map (kbd "M-*") 'pop-tag-mark)
;;(global-set-key (kbd "M-*") 'pop-tag-mark)

;;; パッケージ管理ツール
;;; https://emacs-jp.github.io/packages/package の設定例
(require 'package)
;; package-archives を上書き
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ;; ("melpa-stable" . "https://stable.melpa.org/packages/")
        ("org" . "https://orgmode.org/elpa/")
        ;; ("gnu" . "https://elpa.gnu.org/packages/")
	))

;;; 指定したパッケージをインストールする例
;;;     M-x package-install

;;; パッケージ情報を更新する
;;; 後述の package-list-packages からインストールするときは不要
;;;     M-x package-refresh-contents

;;; パッケージ操作バッファを開く
;;;     M-x package-list-packages

;;; 下の意訳
;;; package.el によって追加された。
;;; インストールされたパッケージの設定の前にコレが来なくてはならない。
;;; この行を削除するな。
;;; もし不要ならセミコロンで その行頭にセミコロンでコメントアウトしろ。
;;; これらの説明のコメントは削除してもよい。

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(column-number-mode t)
 '(custom-enabled-themes '(manoj-dark))
 '(initial-frame-alist '((height . 36) (width . 80) (top . 0) (left . 0)))
 '(package-selected-packages '(magit-popup async dash))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;; (package-list-packages)
