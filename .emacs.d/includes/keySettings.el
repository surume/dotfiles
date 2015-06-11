
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; evil
(require 'evil)
;;; Code:
(evil-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; evil-surround
;; (require 'evil-surround)
;; (global-evil-surround-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; key-chord
(require 'key-chord)
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.1)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; auto-save-buffers-enhanced
(require 'auto-save-buffers-enhanced)
(setq auto-save-buffers-enhanced-interval 1) ; 指定のアイドル秒で保存
(auto-save-buffers-enhanced t)

;;; ファイルの尻尾に改行を入れるかどうか。
;; (t->常に挿入する、nil->常に挿入しない、それ以外->ユーザに問い合わせる。)
(setq-default require-final-newline t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; KeyBinding
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (setq mac-option-modifier 'meta)
;; (setq ns-alternate-modifier (quote meta))
;; ;;(global-set-key "\C-cg" 'magit-status)

(provide 'keySettings)
;;; keySettings.el ends here
