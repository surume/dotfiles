
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; iserch-select
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;;; Code:
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

(provide 'orgFunction)
;;; orgFunction.el ends here
