
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cask
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'cask)
(cask-initialize)

(require 'cl)
(require 'yasnippet)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'evil)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-chord
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm)
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x b") 'helm-for-files)
;; For find-file etc.
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
;; For helm-find-files etc.
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(setq helm-buffer-max-length 50)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; helm-ghq
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'helm-ghq)

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
;; git-gutter-fringe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'git-gutter-fringe)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; popwin
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
;; helm
(push '("*helm*") popwin:special-display-config)
(push '("*rspec*") popwin:special-display-config)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-save-buffers-enhanced
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-highlight-symbol
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-highlight-symbol)
(global-auto-highlight-symbol-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil-surround
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'evil-surround)
(global-evil-surround-mode 1)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rbenv
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rbenv)
(global-rbenv-mode)
(setq rbenv-installation-dir "/usr/local/var/rbenv")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ruby-block)
(ruby-block-mode t)
(setq ruby-block-highlight-toggle t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rspec-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'rspec-mode)
(eval-after-load 'rspec-mode
   '(rspec-install-snippets))
(add-to-list 'minor-mode-alist ' (rspec-mode))
(custom-set-variables '(rspec-use-rake-flag nil))
(custom-set-faces )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-electric
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
(setq ruby-electric-expand-delimiters-list nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; atom-dark
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load-theme 'atom-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 行No
(global-linum-mode t)
(set-face-attribute 'linum nil
                    :foreground "#636363"
                    :background "#2E2E2E"
                    :height 0.9)
(setq linum-format "%3d ")



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general-settings
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; スタートアップ非表示
(setq inhibit-startup-screen t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")
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
;; バックアップファイルを作らないようにする
(setq make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)

;; インデントはタブではなくスペースを使用
(setq-default indent-tabs-mode nil)
;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)
;; タイトルバーにファイルのフルパス表示
(setq frame-title-format
      (format "%%f - Emacs@%s" (system-name)))
;; ファイル名補完で大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; 現在行を目立たせる
(global-hl-line-mode)

;; バッファの同一ファイル名を区別する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 操作に関する設定
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;; スクロールマウスを有効
(global-set-key [mouse-4] 'scroll-down)
(global-set-key [mouse-5] 'scroll-up)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mac-option-modifier 'meta)
(setq ns-alternate-modifier (quote meta))
(global-set-key "\C-cg" 'magit-status)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)







