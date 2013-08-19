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

;; window system
(when window-system
  (scroll-bar-mode -1)
  (tool-bar-mode 0)
  (fringe-mode 0)
  (set-face-attribute 'default nil
                      :family "Monaco"
                      :height 120)
  (set-fontset-font "fontset-default"
                    'japanese-jisx0208
                    '("Osaka" . "iso10646-1"))
  (set-fontset-font "fontset-default"
                    'katakana-jisx0201
                    '("Osaka" . "iso10646-1"))
  (setq face-font-rescale-alist
        '((".*Monaco-bold.*" 1.0)
          (".*Monaco-medium.*" 1.0)
          (".*Osaka-bold.*" . 1.2)
          (".*Osaka-medium.*" . 1.2)
          ("-cdac$" . 1.4)))

  (setq mac-option-modifier 'meta)
  (setq mac-command-key-is-meta t)
  (setq mac-command-modifier-meta t)

  (setq grep-find-use-xargs 'bsd)

  (setq mac-autohide-menubar-on-maximize t)

  (setq mac-pass-control-to-system nil)
  (setq amc-pass-command-to-system nil)
  (setq mac-pass-option-to-system nil)

  (setq ns-use-native-fullscreen nil)
  )

;; Emacs directory
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; Package management
(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(setq my/packages
      '(
        auto-complete
        color-moccur
        color-theme-solarized
        deferred
        elscreen
        emmet-mode
        expand-region
        evil
        evil-numbers
        flymake
        helm
        helm-c-moccur
        jaunte
        magit
        popwin
        quickrun
        surround
        undo-tree
        yasnippet
        ))

(unless package-archive-contents
  (package-refresh-contents))

(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))

;; color
(load-theme 'solarized-light t)

;; evil
(require 'evil)
(evil-mode t)

;; evil-numbers
(require 'evil-numbers)
(define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; helm
(require 'helm)
(require 'helm-config)

(defun my-helm-mini ()
  (interactive)
  (require 'helm-files)
  (helm-other-buffer '(
                       helm-source-buffers-list
                       helm-source-files-in-current-dir
                       helm-source-recentf
                       helm-source-file-cache
                       helm-source-locate
                       )
                     "*helm mini*"))

(global-set-key (kbd "C-;") 'my-helm-mini)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-dwim t)
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-precious)
(setq ac-delay 0.05)
(setq ac-auto-show-menu 0.05)
(setq ac-ignore-case 'smart)
(setq ac-menu-height 10)

;; color-moccur
(require 'color-moccur)

;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-height 0.5)

(push '("helm" :regexp t :height 0.5) popwin:special-display-config)
(push '("*undo-tree*" :height 0.5) popwin:special-display-config)
