;;; -*- lexical-binding: t -*-

(setq gc-cons-threshold (* 50 1000 1000))
(add-hook 'emacs-startup-hook
          (lambda () (setq gc-cons-threshold (* 2 1000 1000))))

(defun auto-tangle-config ()
  (when (string-equal (buffer-file-name)
                      (expand-file-name "init.org" user-emacs-directory))
    (let ((org-confirm-babel-evaluate nil))
      (org-babel-tangle))))

(add-hook 'org-mode-hook
          (lambda ()
            (add-hook 'after-save-hook #'auto-tangle-config nil 'local)))

(require 'package)
(setq package-enable-at-startup nil)

(require 'use-package)
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t)

(org-babel-load-file
  (expand-file-name "modules/evil.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/ui.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/navigation.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/direnv.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/lsp.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/org.org"
    (file-name-directory (or load-file-name buffer-file-name))))

(org-babel-load-file
  (expand-file-name "modules/magit.org"
    (file-name-directory (or load-file-name buffer-file-name))))
