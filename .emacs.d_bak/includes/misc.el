
;; (require 'rubocop)
;; (add-hook 'ruby-mode-hook 'rubocop-mode)

;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; auto-highlight-symbol
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (require 'auto-highlight-symbol)
;; (global-auto-highlight-symbol-mode t)

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

