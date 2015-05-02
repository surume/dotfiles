
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
(require 'helm-files)
(require 'helm-ag)
(require 'helm-imenu)
(helm-mode 1)
;; agのデフォルトのコマンドオプションを指定
;; -nを消すとサブディレクトリも再帰的に検索します
(setq helm-ag-base-command "ag --nocolor --nogroup")

;;Alt+sでag実行
(define-key global-map (kbd "C-x g") 'helm-ag)
(define-key global-map (kbd "C-x /") 'comment-dwim)
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
;; (require 'magit)                        ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; git-gutter-fringe
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(require 'git-gutter-fringe)

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
;; yaml-mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(when (require 'yaml-mode nil t)
    (add-to-list 'auto-mode-alist '("¥¥.yml$" . yaml-mode)))

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


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ruby-electric
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ruby-electric)
;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; (setq ruby-electric-expand-delimiters-list nil)

(require 'ruby-end)
(add-hook 'ruby-mode-hook
          '(lambda()
             (abbrev-mode 1)
             (electric-pair-mode t)
             (electric-indent-mode t)
             (electric-layout-mode t)))

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
;; projectile-rails
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'projectile)
(projectile-global-mode)

(require 'projectile-rails)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
;; rirariと同様のキーバインドを使う
(define-key projectile-rails-mode-map (kbd "C-c ; f m") 'projectile-rails-find-current-model)
(define-key projectile-rails-mode-map (kbd "C-c ; f c") 'projectile-rails-find-current-controller)
(define-key projectile-rails-mode-map (kbd "C-c ; f v") 'projectile-rails-find-current-view)
(define-key projectile-rails-mode-map (kbd "C-c ; f s") 'projectile-rails-find-current-spec)
(define-key projectile-rails-mode-map (kbd "C-c ; c") 'projectile-rails-console)

;; evilの`gf`で`projectile-rails-goto-file-at-point`を使うように
(evil-define-key 'normal projectile-rails-mode-map (kbd "gf")
  'projectile-rails-goto-file-at-point)
;; fix above keybind can't be applied til state changes
;; https://bitbucket.org/lyro/evil/issue/301/evil-define-key-for-minor-mode-does-not
(add-hook 'find-file-hook
          #'(lambda ()
              (when projectile-rails-mode
                (evil-normalize-keymaps))))

;; `app/views/application`と`app/views/shared`のビューも探す候補に入れる
(defun projectile-rails-goto-template-at-point ()
  (interactive)
  (let* ((template (projectile-rails-filename-at-point))
         (dir (projectile-rails-template-dir template))
         (name (projectile-rails-template-name template))
         (format (projectile-rails-template-format template)))
    (if format
        (loop for processor in '("erb" "haml" "slim")
              for template = (s-lex-format "${dir}${name}.${format}.${processor}")
              for partial = (s-lex-format "${dir}_${name}.${format}.${processor}")
              for partial-2 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/application"))
              for partial-3 = (expand-file-name
                               (s-lex-format "_${name}.${format}.${processor}")
                               (projectile-expand-root "app/views/shared"))
              until (or
                     (projectile-rails-ff template)
                     (projectile-rails-ff partial)
                     (projectile-rails-ff partial-2)
                     (projectile-rails-ff partial-3)))
      (message "Could not recognize the template's format")
            (dired dir))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; scala
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; my-copy-file-path
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(defun my-copy-file-path ()
; "show the full path file name in the minibuffer and copy to kill ring."
; (interactive)
; (when buffer-file-name
;   (kill-new (file-truename buffer-file-name))
;       (message (buffer-file-name))
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
(setq ruby-insert-encoding-magic-comment nil)

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
(global-set-key "\C-ch" 'helm-ghq)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iserch-select
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
  (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
      (progn
        (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
        (deactivate-mark)
        ad-do-it
        (if (not forward)
            (isearch-repeat-backward)
          (goto-char (mark))
          (isearch-repeat-forward)))
        ad-do-it))


