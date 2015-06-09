
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cask
;;; Code:
(when (and (not (equal window-system 'w32))
	   (or (require 'cask nil t) ;; MacOS X (homebrew)
	       (require 'cask "~/.cask/cask.el" t))) ;; Linux (install by curl)
   (cask-initialize))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; evil
(require 'evil)
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-chord
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.1)
;(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto-save-buffers-enhanced
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;;; ファイルの尻尾に改行を入れるかどうか。
;; (t->常に挿入する、nil->常に挿入しない、それ以外->ユーザに問い合わせる。)
(setq-default require-final-newline t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helm
(require 'helm)
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(require 'helm-imenu)
(require 'helm-ghq)
(helm-mode 1)
;; agのデフォルトのコマンドオプションを指定
(setq helm-buffer-max-length 50)
(setq helm-ag-base-command "ag --nocolor --nogroup")
(global-set-key "\C-ch" 'helm-ghq)
(define-key global-map (kbd "M-y") 'helm-show-kill-ring)
(define-key global-map (kbd "C-x g") 'helm-ag)
(define-key global-map (kbd "C-x /") 'comment-dwim)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "C-x b") 'helm-for-files)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

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
;; ;; 現在ポイントがある関数名をモードラインに表示
;; (which-function-mode 1)
;; 対応する括弧をハイライト
(show-paren-mode t)
;; yes-noをy-nに置き換え
(fset 'yes-or-no-p 'y-or-n-p)
;; バックアップファイルを作らない
(setq make-backup-files nil)
;;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; インデントはタブではなくスペースを使用
(setq-default indent-tabs-mode nil)
;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)
;; ファイル名補完で大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;;; 現在行を目立たせる
(global-hl-line-mode)
;; バッファの同一ファイル名を区別する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; KeyBinding
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq mac-option-modifier 'meta)
;; (setq ns-alternate-modifier (quote meta))
;; ;;(global-set-key "\C-cg" 'magit-status)



;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; iserch-select
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defadvice isearch-mode (around isearch-mode-default-string (forward &optional regexp op-fun recursive-edit word-p) activate)
;;   (if (and transient-mark-mode mark-active (not (eq (mark) (point))))
;;       (progn
;;         (isearch-update-ring (buffer-substring-no-properties (mark) (point)))
;;         (deactivate-mark)
;;         ad-do-it
;;         (if (not forward)
;;             (isearch-repeat-backward)
;;           (goto-char (mark))
;;           (isearch-repeat-forward)))
;;         ad-do-it))

;; (setq x-select-enable-clipboard t)

;; (global-set-key (kbd "C-c <f8>") 'flyspell-mode)
;; (global-set-key (kbd "C-c <f9>") 'ispell-word)
;; (global-set-key (kbd "C-c <f10>") 'flyspell-buffer)

;; (put 'dired-find-alternate-file 'disabled nil)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el 開く
(global-set-key
 (kbd "C-c C-e")
 (lambda () (interactive)
   (switch-to-buffer (find-file-noselect "~/.emacs.d/init.el"))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;画面を 2 分割したときの 上下を入れ替える swap screen
;;というのが PF 何番かにわりあてられていました。
(defun swap-screen()
  "Swap two screen,leaving cursor at current window."
  (interactive)
  (let ((thiswin (selected-window))
        (nextbuf (window-buffer (next-window))))
    (set-window-buffer (next-window) (window-buffer))
    (set-window-buffer thiswin nextbuf)))
(defun swap-screen-with-cursor()
  "Swap two screen,with cursor in same buffer."
  (interactive)
  (let ((thiswin (selected-window))
        (thisbuf (window-buffer)))
    (other-window 1)
    (set-window-buffer thiswin (window-buffer))
    (set-window-buffer (selected-window) thisbuf)))
(global-set-key [f2] 'swap-screen)
(global-set-key [S-f2] 'swap-screen-with-cursor)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; atom-dark
(load-theme 'atom-dark t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; linum
;; 行No
(require 'linum)
(global-linum-mode t)
(setq linum-format "%3d ")
(set-face-attribute 'linum nil
                    :foreground "#636363"
                    :background "#2E2E2E"
                    :height 0.9)


;; mode settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml-mode
(when (require 'yaml-mode nil t)
    (add-to-list 'auto-mode-alist '("¥¥.yml$" . yaml-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ruby-mode
(require 'ruby-mode)
(autoload 'ruby-mode "ruby-mode"
  "Mode for editing ruby source files" t)
(add-to-list 'auto-mode-alist '("\\.rb$latex " . ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(setq ruby-insert-encoding-magic-comment nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rspec-mode
(require 'rspec-mode)
(eval-after-load 'rspec-mode
   '(rspec-install-snippets))
(add-to-list 'minor-mode-alist ' (rspec-mode))
(custom-set-variables '(rspec-use-rake-flag nil))
(custom-set-faces )

(require 'rubocop)
(add-hook 'ruby-mode-hook 'rubocop-mode)








;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flycheck
(require 'flycheck)
(require 'flyspell)
(flycheck-mode 1)
(flyspell-mode 1)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; (flycheck-define-checker ruby-rubocop
;;   "A Ruby syntax and style checker using the RuboCop tool."
;;   :command ("rubocop" "--format" "emacs" "--silent"
;;             (config-file "--config" flycheck-rubocoprc)
;;             source)
;;   :error-patterns
;;   ((warning line-start
;;             (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
;;             line-end)
;;    (error line-start
;;           (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
;;           line-end))
;;      :modes (enh-ruby-mode motion-mode))


;; definition for flycheck
(flycheck-define-checker ruby-rubylint
  "A Ruby syntax and style checker using the rubylint tool."
  :command ("ruby-lint" source)
  :error-patterns
  ((warning line-start
            (file-name) ":" line ":" column ": " (or "C" "W") ": " (message)
            line-end)
   (error line-start
          (file-name) ":" line ":" column ": " (or "E" "F") ": " (message)
          line-end))
    :modes (enh-ruby-mode ruby-mode))















;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; auto-highlight-symbol
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'auto-highlight-symbol)
;; (global-auto-highlight-symbol-mode t)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; evil-surround
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'evil-surround)
;; (global-evil-surround-mode 1)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; rbenv
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'rbenv)
;; (global-rbenv-mode)
;; (setq rbenv-installation-dir "/usr/local/var/rbenv")
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ruby-block
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'ruby-block)
;; (ruby-block-mode t)
;; (setq ruby-block-highlight-toggle t)
;; (add-hook 'ruby-mode-hook 'yard-mode)


;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; ;; ruby-electric
;; ;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; (require 'ruby-electric)
;; ;; (add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))
;; ;; (setq ruby-electric-expand-delimiters-list nil)

;; (require 'ruby-end)
;; (add-hook 'ruby-mode-hook
;;           '(lambda()
;;              (abbrev-mode 1)
;;              (electric-pair-mode t)
;;              (electric-indent-mode t)
;;              (electric-layout-mode t)))


;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; projectile-rails
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'projectile)
;; (projectile-global-mode)

;; (require 'projectile-rails)
;; (add-hook 'projectile-mode-hook 'projectile-rails-on)
;; ;; rirariと同様のキーバインドを使う
;; (define-key projectile-rails-mode-map (kbd "C-c ; f m") 'projectile-rails-find-current-model)
;; (define-key projectile-rails-mode-map (kbd "C-c ; f c") 'projectile-rails-find-current-controller)
;; (define-key projectile-rails-mode-map (kbd "C-c ; f v") 'projectile-rails-find-current-view)
;; (define-key projectile-rails-mode-map (kbd "C-c ; f s") 'projectile-rails-find-current-spec)
;; (define-key projectile-rails-mode-map (kbd "C-c ; c") 'projectile-rails-console)

;; ;; evilの`gf`で`projectile-rails-goto-file-at-point`を使うように
;; (evil-define-key 'normal projectile-rails-mode-map (kbd "gf")
;;   'projectile-rails-goto-file-at-point)
;; ;; fix above keybind can't be applied til state changes
;; ;; https://bitbucket.org/lyro/evil/issue/301/evil-define-key-for-minor-mode-does-not
;; (add-hook 'find-file-hook
;;           #'(lambda ()
;;               (when projectile-rails-mode
;;                 (evil-normalize-keymaps))))

;; ;; `app/views/application`と`app/views/shared`のビューも探す候補に入れる
;; (defun projectile-rails-goto-template-at-point ()
;;   (interactive)
;;   (let* ((template (projectile-rails-filename-at-point))
;;          (dir (projectile-rails-template-dir template))
;;          (name (projectile-rails-template-name template))
;;          (format (projectile-rails-template-format template)))
;;     (if format
;;         (loop for processor in '("erb" "haml" "slim")
;;               for template = (s-lex-format "${dir}${name}.${format}.${processor}")
;;               for partial = (s-lex-format "${dir}_${name}.${format}.${processor}")
;;               for partial-2 = (expand-file-name
;;                                (s-lex-format "_${name}.${format}.${processor}")
;;                                (projectile-expand-root "app/views/application"))
;;               for partial-3 = (expand-file-name
;;                                (s-lex-format "_${name}.${format}.${processor}")
;;                                (projectile-expand-root "app/views/shared"))
;;               until (or
;;                      (projectile-rails-ff template)
;;                      (projectile-rails-ff partial)
;;                      (projectile-rails-ff partial-2)
;;                      (projectile-rails-ff partial-3)))
;;       (message "Could not recognize the template's format")
;;             (dired dir))))

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; my-copy-file-path
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;(defun my-copy-file-path ()
;; ; "show the full path file name in the minibuffer and copy to kill ring."
;; ; (interactive)
;; ; (when buffer-file-name
;; ;   (kill-new (file-truename buffer-file-name))
;; ;       (message (buffer-file-name))

;;; init.el ends here
