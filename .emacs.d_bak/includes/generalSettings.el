
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; general-settings
;; スタートアップ非表示
;;; Code:
(setq inhibit-startup-screen t)
;; scratchの初期メッセージ消去
(setq initial-scratch-message "")
;; ターミナルのときメニューを表示しない
(if (eq window-system 'x)
    (menu-bar-mode 1) (menu-bar-mode 0))
;; 対応する括弧をハイライト
(show-paren-mode t)
;; yes-noをy-nに置き換え
(fset 'yes-or-no-p 'y-or-n-p)
;; バックアップファイルを作らない
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; インデントはタブではなくスペースを使用
(setq-default indent-tabs-mode nil)
;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)
;; ファイル名補完で大文字小文字を区別しない
(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
;; 現在行を目立たせる
(global-hl-line-mode)
;; バッファの同一ファイル名を区別する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
;; 現在ポイントがある関数名をモードラインに表示
;; (which-function-mode 1)

(provide 'generalSettings)
;;; generalSettings.el ends here

;;; Get current path and put it to clipboard
(defun put-current-path-to-clipboard ()
  (interactive)
  (let ((file-path buffer-file-name)
        (dir-path default-directory))
    (cond (file-path
           (kill-new (expand-file-name file-path))
           (message "This file path is on the clipboard!"))
          (dir-path
           (kill-new (expand-file-name dir-path))
           (message "This directory path is on the clipboard!"))
          (t
           (error-message-string "Fail to get path name.")
           ))))
(global-set-key (kbd "C-c C-c p") 'put-current-path-to-clipboard)
