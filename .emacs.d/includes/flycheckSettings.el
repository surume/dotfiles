

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; flycheck
(require 'flycheck)
(require 'flyspell)
;;; Code:
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

(provide 'flycheckSettings)
;;; flycheckSettings.el ends here
