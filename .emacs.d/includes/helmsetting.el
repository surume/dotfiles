
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; helm
(require 'helm)
(require 'helm-config)
(require 'helm-files)
(require 'helm-ag)
(require 'helm-imenu)
(require 'helm-ghq)
;;; Code:
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

(provide 'helmsetting)
;;; helmsetting.el ends here
