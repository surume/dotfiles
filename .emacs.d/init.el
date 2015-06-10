
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; cask
;;; Code:
(when (and (not (equal window-system 'w32))
	   (or (require 'cask nil t) ;; MacOS X (homebrew)
	       (require 'cask "~/.cask/cask.el" t))) ;; Linux (install by curl)
   (cask-initialize))

(load "~/.emacs.d/includes/generalSettings.el")

(load "~/.emacs.d/includes/keySettings.el")

(load "~/.emacs.d/includes/helmsetting.el")

(load "~/.emacs.d/includes/orgFunction.el")

(load "~/.emacs.d/includes/modes.el")

;; (require 'rubocop)
;; (add-hook 'ruby-mode-hook 'rubocop-mode)

(load "~/.emacs.d/includes/flycheckSettings.el")

(load "~/.emacs.d/includes/powerline.el")

(load "~/.emacs.d/includes/misc.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
