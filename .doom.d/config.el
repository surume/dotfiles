;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
;; font
(setq doom-font (font-spec :family "Fira Code" :size 11)
      doom-variable-pitch-font (font-spec :family "Fira Code")
      doom-unicode-font (font-spec :family "Fira Code")
      doom-big-font (font-spec :family "Fira Code" :size 21))

;; FiraCode リガチャ対応
(mac-auto-operator-composition-mode)

;; 高速化対応
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; meta
(setq mac-command-modifier 'super)
(setq mac-option-modifier 'alt)
(setq mac-right-command-modifier 'super)
(setq mac-right-option-modifier 'hyper)

;; コメントを見やすく
(setq doom-one-brighter-comments t)
;; don't lighten the background of the comment
(setq doom-one-comment-bg nil)

;; ウィンドウ移動
;; (define-key evil-visual-state-map (kbd "C-k") 'evil-window-up)
;; (define-key evil-visual-state-map (kbd "C-j") 'evil-window-down)
;; (define-key evil-visual-state-map (kbd "C-h") 'evil-window-left)
;; (define-key evil-visual-state-map (kbd "C-l") 'evil-window-right)

;; 補完設定
(global-company-mode)
(define-key company-active-map (kbd "C-n") 'company-select-next)
(define-key company-active-map (kbd "C-p") 'company-select-previous)

;; 自動保存設定
(setq auto-save-buffers-enhanced-interval 1.2)
(auto-save-buffers-enhanced t)

;; プロジェクト/ファイル移動
;; (define-key global-map (kbd "C-c h") 'projectile-switch-project)
(require 'ivy-ghq)
(setq ivy-ghq-short-list t)
(define-key global-map (kbd "s-g") 'ivy-ghq-open)
(define-key global-map (kbd "s-p") 'projectile-find-file)

;; jj, kk で ESC
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.6)
(key-chord-define evil-insert-state-map  "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map  "kk" 'evil-normal-state)

;; 定義元ジャンプ
(define-key global-map (kbd "s-b") 'dumb-jvump-go)
(define-key global-map (kbd "s-[") 'dumb-jump-back)
(define-key global-map (kbd "s-B") 'dumb-jump-go-other-window)

;; elscreen設定
;; (setq elscreen-prefix-key (kbd "s-e"))
;; (elscreen-start)
;; (define-key global-map (kbd "s-n") 'elscreen-create)
;; (define-key global-map (kbd "s-t") 'elscreen-create)
;; (define-key global-map (kbd "s-w") 'elscreen-kill)
;; (define-key global-map (kbd "s-{") 'elscreen-previous)
;; (define-key global-map (kbd "s-}") 'elscreen-next)

;; JSのセミコロンチェックを殺す
(setq js2-strict-missing-semi-warning nil)
(setq js2-missing-semi-one-line-override nil)

;; (custom-set-variables
;;   '(google-translate-default-source-language "en")
;; '(google-translate-default-target-language "ja"))
