;; misc
(setq inhibit-startup-message t)
(setq initial-scratch-message "")
(setq-default line-spacing 0.1)
(column-number-mode t)

(setq completion-ignore-case t)
(iswitchb-mode 1)

(global-font-lock-mode t)
(transient-mark-mode t)
(show-paren-mode 1)
(global-linum-mode)
(setq show-paren-delay 0)
(setq indicate-empty-lines t)

(fset 'yes-or-no-p 'y-or-n-p)

(setq kill-whole-line t)
(delete-selection-mode 1)

(setq visible-bell nil)
(setq ring-bell-function 'ignore)

;; status
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-string-forms
      '(month "/" day " " 24-hours ":" minutes " "))

(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

;; show trailing spaces
(when (boundp 'show-trailing-whitespace)
  (setq-default show-trailing-whitespace t))

;; backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; encoding
(prefer-coding-system 'utf-8)

(setq current-language-environment "Japanese")

;; indent
(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(global-set-key (kbd "C-h") 'delete-backward-char)

;; Vim-compatible word separation
(modify-syntax-entry ?_ "w" (standard-syntax-table))
