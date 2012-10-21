;; auto-install.el にLoad-pathを設定
(add-to-list 'load-path "~/.emacs.d/auto-install")
(add-to-list 'load-path "~/.emacs.d/elisp")

;;-----------------------------------------------
;; auto-install の設定
;;-----------------------------------------------
;; require関数でauto-install.elを読み込み
(when (require 'auto-install nil t)
  ;; インストールディレクトリを設定
  (setq auto-install-directory "~/.emacs.d/elisp/")
  ;; EmacsWiki に登録されている名前を取得する.
  (auto-install-update-emacswiki-package-name t)
  ;; install-elisp の関数を利用可能にする
  (auto-install-compatibility-setup))

;;-----------------------------------------------
;; anything
;;-----------------------------------------------
(require 'anything)
(setq
 ;; 候補を表示するまでの時間。デフォルトは0.5
 anything-idle-delay 0.3)

(require 'anything-config)
(setq
 anything-su-or-sudo "sudo")

(require 'anything-match-plugin)

(require 'descbinds-anything)
(descbinds-anything-install)

;; redo+.el の設定
(when (require 'redo+ nil t)
  ;; C-'にredoを割当
  (global-set-key (kbd "C-'") 'redo))


;;-----------------------------------------------
;; auto-complete
;;-----------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete-1.3.1")
(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-config-default)


;;-----------------------------------------------
;; color-moccur
;;-----------------------------------------------
(require 'color-moccur)
;; M-oにoccur-by-moccurを割当
(define-key global-map (kbd "M-o") 'occur-by-moccur)
;; スペース区切りでAND検索
(setq Moccur-split-word t)
;;ディレクトリ検索のとき除外するファイル
(add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
(add-to-list 'dmoccur-exclusion-mask "^#.+#$")

;;-----------------------------------------------
;; ElScreen
;;-----------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/apel")
(add-to-list 'load-path "~/.emacs.d/elisp/apel-10.8")
(add-to-list 'load-path "~/.emacs.d/elisp/elscreen-1.4.6")
(require 'elscreen)

;;-----------------------------------------------
;; cua-mode
;;-----------------------------------------------
;;(cua-mode t) ; cua-modeをオン
(setq cua-mode-cua-keys nil) ; CUAキーバインドを無効にする


;;-----------------------------------------------
;; ruby-mode
;;-----------------------------------------------
;; ruby-modeのインデント設定
;; (setq ruby-indent-level 4              ; インデント幅を4、初期値は2
;;       ruby-deep-indent-paren-style nil ; 改行時のインデントを調整
;;       ruby-indent-tabs-mode t)         ; タブ文字を使用。初期値はnil



;;-----------------------------------------------
;; gtags
;;-----------------------------------------------
(add-to-list 'load-path "~/.emacs.d/elisp/gtags")
;; ;; gtags-modeのキーバインドを有効化
(setq gtags-suggested-key-mapping t)
(require 'gtags nil t)
;(autoload 'gtags-mode "gtags" "" t)
;; (setq gtags-mode-hook
;;       '(lambda ()
;;          (local-set-key "M-t" 'gtags-find-tag)
;;          (local-set-key "M-r" 'gtags-find-rtag)
;;          (local-set-key "M-s" 'gtags-find-symbol)
;;          (local-set-key "C-t" 'gtags-pop-stack)
;;          ))
(global-set-key "\M-t" 'gtags-find-tag)     ;関数の定義元へ
(global-set-key "\M-r" 'gtags-find-rtag)    ;関数の参照先へ
(global-set-key "\M-s" 'gtags-find-symbol)  ;変数の定義元/参照先へ
(global-set-key "\M-p" 'gtags-find-pattern)
;(global-set-key "\M-f" 'gtags-find-file)    ;ファイルにジャンプ
(global-set-key [?\C-,] 'gtags-pop-stack)   ;前のバッファに戻る



(put 'scroll-left 'disabled nil)
;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)
; 言語を日本語にする
(set-language-environment 'Japanese)
; 極力UTF-8とする
(prefer-coding-system 'utf-8)
;; バッテリー残量を表示
(display-battery-mode t)
;; 行番号を表示
(global-linum-mode t)
;; ファイルサイズを表示
(size-indication-mode t)
;; tabの表示幅
(setq-default tab-width 4)

; C言語のStyle
(add-hook 'c-mode-hock '(lamba ()(c-set-style "cc-mode")))

