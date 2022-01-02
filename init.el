(set 'inhibit-startup-screen t)
(set 'frame-resize-pixelwise t)

(menu-bar-mode 0)
(toggle-scroll-bar 0)
(tool-bar-mode 0)
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

(straight-use-package 'use-package)

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

(use-package evil
  :straight t
  :init
  (use-package undo-fu
    :straight t
    :config)
  :config
  (evil-set-undo-system 'undo-fu)
  (evil-mode t)
  ;; (define-key evil-motion-state-map (kbd "RET") nil)
  (set 'org-return-follows-link t))

(use-package evil-surround
  :straight t
  :config
  (global-evil-surround-mode 1))

(use-package evil-textobj-line
  :straight t)

;; (use-package evil-org
;;   :straight
;;   (evil-org
;;    :files (:defaults "evil-org-agenda.el"))
;;   :config
;;   (require 'evil-org-agenda)
;;   (evil-org-agenda-set-keys))

;; tree-edit
;; evil-collection
;; evil-textobj-tree-sitter
