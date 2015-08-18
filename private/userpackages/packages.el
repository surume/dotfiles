;;; packages.el --- userpackages Layer packages File for Spacemacs
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

(setq userpackages-packages
      '(
        auto-save-buffers-enhanced
        key-chord
        helm-ghq
        helm-ls-git
;;        atom-dark-theme
        ))

(defun userpackages/init-auto-save-buffers-enhanced ()
  (setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
  (auto-save-buffers-enhanced t)
  )

(defun userpackages/init-key-chord ()
  (key-chord-mode 1)
  (setq key-chord-two-keys-delay 0.1)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  )

(defun userpackages/init-helm-ghq ()
  (global-set-key "\C-ch" 'helm-ghq)
  )

(defun userpackages/init-helm-ls-git ()
  (define-key global-map (kbd "C-c C-g l") 'helm-ls-git-ls)
  (define-key global-map (kbd "C-c C-g d") 'helm-browse-project)
  )

;; (defun userpackages/init-atom-dark-theme ())

;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
