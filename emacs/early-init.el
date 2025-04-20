;;; early-init.el --- Pre-load settings before GUI shows up -*- lexical-binding: t; -*-

;; Disable UI chrome early
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Transparency
(add-to-list 'default-frame-alist '(alpha-background . 80))

;; Font (applies to first frame)
(let ((current-font (face-attribute 'default :family)))
  (set-face-attribute 'default nil
    :family current-font
    :height 120))
