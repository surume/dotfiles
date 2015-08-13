;;; packages.el --- test Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
;;(setq test-packages
;;   '(
;;    auto-save-buffers-enhanced
;;    key-chord
;;    helm-ghq
 ;;    ))

;; List of packages to exclude.

;; For each package, define a function test/init-<package-name>

;;(;;defun test/init-auto-save-buffers-enhanced ()
;; ;;(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
;; (auto-save-buffers-enhanced t)
;; )

;;(defun test/init-key-chord ()
;; (key-chord-mode 1)
;; (setq key-chord-two-keys-delay 0.1)
;; (define-key evil-insert-state-map [escape] 'evil-normal-state)
;; (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
;; )

;;(defun test/init-helm-ghq ()
;;;;  (global-set-key "\C-ch" 'helm-ghq)
;;  )

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
