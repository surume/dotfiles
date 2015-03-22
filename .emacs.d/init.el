
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
;; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq mac-option-modifier 'meta)
