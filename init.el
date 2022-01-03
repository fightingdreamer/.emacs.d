(set 'inhibit-startup-screen t)
(set 'frame-resize-pixelwise t)

(menu-bar-mode 0)
(toggle-scroll-bar 0)
(tool-bar-mode 0)
(blink-cursor-mode 0)
(toggle-frame-maximized)

(fset 'yes-or-no-p 'y-or-n-p)

(set 'fonts-config-file "~/.emacs.d/fonts-config.el")
(set 'fonts-custom-file "~/.emacs.d/fonts-custom.el")

(when (file-readable-p fonts-config-file) (load fonts-config-file))
(when (file-readable-p fonts-custom-file) (load fonts-custom-file))

(set-face-attribute 'default nil :font main-font)

(set 'custom-file "~/.emacs.d/custom.el")
(load custom-file)

(require 'recentf)
(recentf-mode t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(set 'package-enable-at-startup nil)
(set 'straight-use-package-by-default t)
(set 'straight-vc-git-default-clone-depth 1)

(straight-use-package 'use-package)

(use-package esup
  :straight t
  :config
  (set 'esup-depth 0))

(use-package org
  :straight t
  :config
  (set 'org-id-track-globally t)
  (set 'org-log-done 'time)
  (set-face-attribute 'org-date nil :font main-font))

(use-package counsel
  :straight t
  :init
  (use-package ivy
    :straight t
    :config
    (ivy-mode)))

(use-package company
  :straight t
  :config
  (global-company-mode t)
  (company-tng-mode t))

(use-package undo-tree
  :straight
  (undo-tree :host gitlab.com
	     :repo "tsc25/undo-tree")
  :config
  (set 'undo-tree-auto-save-history t)
  (global-undo-tree-mode t))

(use-package evil
  :straight t
  :init
  :config
  (evil-set-undo-system 'undo-tree)
  (evil-mode t)
  ;; (define-key evil-motion-state-map (kbd "RET") nil)
  (set 'org-return-follows-link t))

(use-package evil-surround
  :straight t
  :config
  (global-evil-surround-mode t))

(use-package evil-commentary
  :straight t
  :config
  (evil-commentary-mode t))

(use-package evil-org
  :straight
  (evil-org :type git
	    :host github
	    :repo "Somelauw/evil-org-mode"
	    :files ("evil-org.el" "evil-org-agenda.el"))
  :after org
  :config
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys)
  (add-hook 'org-mode-hook 'evil-org-mode))

(use-package evil-textobj-line
  :straight t)

;; (use-package magit
;;   :straight t)

;; dark-theme
;; (use-package tao-theme
;;   :straight
;;   (tao-theme-emacs :host github
;; 		   :repo "11111000000/tao-theme-emacs")
;;   :config
;;   (load-theme 'tao-yin t))

;; light-theme
;; (use-package berrys-theme
;;   :straight t
;;   :config
;;   (load-theme 'berrys t)
;;   (setq-default cursor-type '(bar . 2))
;;   (setq-default line-spacing 1))

;; :themes
;;   ancient-one-dark-theme
;; :plugins
;;   evil-org
;;   tree-edit
;;   evil-collection
;;   evil-textobj-tree-sitter
