
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; rainbow-delimiters
(require 'rainbow-delimiters)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 色強調設定
;; (require 'cl-lib)
;; (require 'color)
;; (defun rainbow-delimiters-using-stronger-colors ()
;;   (interactive)
;;   (cl-loop
;;    for index from 1 to rainbow-delimiters-max-face-count
;;    do
;;    (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
;;      (cl-callf color-saturate-name (face-foreground face) 30))))
;; (add-hook 'emacs-startup-hook 'rainbow-delimiters-using-stronger-colors)



;;--------------------------------------------------------------------------------
;; モードライン
;;--------------------------------------------------------------------------------
;;; Code:
;; (defun git-branch-mode-line ()
;;   (let* ((branch (replace-regexp-in-string
;;                   "[\r\n]+\\'" ""
;;                   (shell-command-to-string "git symbolic-ref -q HEAD")))
;;          (mode-line-str (if (string-match "^refs/heads/" branch)
;;                             (format " \u2B60 %s \u2B81" (substring branch 11)) "")))
;;         (propertize mode-line-str 'face 'mode-line-4-fg)))

(line-number-mode t)   ; 行番号表示
(column-number-mode t) ; 列番号表示
(setq-default mode-line-format '(
                                 (:propertize " %m "           face mode-line-1-fg)
                                 (:propertize "\u2B80"              face mode-line-1-bg)
                                 (:propertize minor-mode-alist face mode-line-2-fg)
                                 (:propertize " \u2B81"             face mode-line-2-fg)
                                 (:propertize " %b "           face mode-line-3-fg)
                                 ;; (:propertize "\u2B80"              face mode-line-3-bg)
                                 ;; (:eval (git-branch-mode-line))
                                 (:propertize " %+ \u2B81 %Z "      face mode-line-4-fg)
                                 ;; (:propertize "\u2B80"              face mode-line-4-bg)
                                 (:propertize " %p "           face mode-line-2-fg)
                                 (:propertize "\u2B80"              face mode-line-5-bg)
                                 (:propertize " \u2B61 "            face mode-line-5-fg)
                                 (:propertize "%l"             face mode-line-6-fg)
                                 (:propertize ":%c"            face mode-line-5-fg)))
;;--------------------------------------------------------------------------------

;;--------------------------------------------------------------------------------
;; モードラインの色
;;--------------------------------------------------------------------------------
(set-face-attribute 'mode-line nil
                    :foreground "#005f5f" :background "#87d7ff" :box nil)
(set-face-attribute 'mode-line-inactive nil
                    :foreground "#005f5f" :background "#87d7ff" :box nil)
(defun make/set-face (face-name fg-color bg-color weight)
  (make-face face-name)
  (set-face-attribute face-name nil
                      :foreground fg-color :background bg-color :box nil :weight weight))
(make/set-face 'mode-line-1-fg "#005f5f" "#ffffff" 'bold)
(make/set-face 'mode-line-1-bg "#ffffff" "#0087af" 'normal)
(make/set-face 'mode-line-2-fg "#87d7ff" "#0087af" 'normal)
(make/set-face 'mode-line-2-bg "#87d7ff" "#0087af" 'normal)
(make/set-face 'mode-line-3-fg "#ffffff" "#0087af" 'bold)
(make/set-face 'mode-line-3-bg "#0087af" "#005f87" 'bold)
(make/set-face 'mode-line-4-fg "#87d7ff" "#005f87" 'normal)
(make/set-face 'mode-line-4-bg "#005f87" "#0087af" 'normal)
(make/set-face 'mode-line-5-fg "#005f5f" "#87d7ff" 'normal)
(make/set-face 'mode-line-5-bg "#0087af" "#87d7ff" 'normal)
(make/set-face 'mode-line-6-fg "#005f5f" "#87d7ff" 'bold)
;;--------------------------------------------------------------------------------


