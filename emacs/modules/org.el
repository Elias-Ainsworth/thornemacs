;;; -*- lexical-binding: t -*-

;; Auto line wrap
(add-hook 'org-mode-hook #'auto-fill-mode)

;; Indentation for headings and lists
(add-hook 'org-mode-hook #'org-indent-mode)

;; Visual wrapping (soft word wrap)
(add-hook 'org-mode-hook #'visual-line-mode)

;; Optional: Edit code blocks neatly
(setq org-edit-src-content-indentation 0)

(use-package org-modern
  :after org
  :config
  (global-org-modern-mode))

(with-eval-after-load 'org
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((rust . t)
     (nix . t)
     (org . t)
     (emacs-lisp . t))))

(use-package org-roam
  :custom (org-roam-directory "~/org-roam")
  :config (org-roam-db-autosync-mode))
