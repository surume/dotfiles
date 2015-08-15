(setq helm-buffer-max-length 50)
(setq helm-ag-base-command "ag --nocolor --nogroup")

;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)
;; バックアップファイルを作らない
(setq make-backup-files nil)
;; yes-noをy-nに置き換え
(fset 'yes-or-no-p 'y-or-n-p)
;; 行末の空白をハイライト
(setq-default show-trailing-whitespace t)
;;; ファイルの尻尾に改行を入れるかどうか。
;; (t->常に挿入する、nil->常に挿入しない、それ以外->ユーザに問い合わせる。)
(setq-default require-final-newline t)
