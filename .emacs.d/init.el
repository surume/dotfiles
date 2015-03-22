
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cask
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cask)
(cask-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'evil)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(helm-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行No
(require 'linum)
(global-linum-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; flycheck 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popwin 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'magit)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-save-buffers-enhanced
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)


;; ターミナルのときメニューを表示しない
(if (eq window-system 'x)
        (menu-bar-mode 1) (menu-bar-mode 0))

;; 現在ポイントがある関数名をモードラインに表示
(which-function-mode 1)

;; 対応する括弧をハイライト
(show-paren-mode t)

;; yes-noをy-nに置き換え
(fset 'yes-or-no-p 'y-or-n-p) 

;; バックアップファイルを作らない
(setq backup-inhibited t)

;; インデントはタブではなくスペースを使用
(setq-default indent-tabs-mode nil)

;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)

;; ファイル名補完で大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 操作に関する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; スクロールマウスを有効
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mac-option-modifier 'meta)
