
;; mode settings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; yaml-mode
;;; Code:
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

(provide 'modes)
;;; modes.el ends here
