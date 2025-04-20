;;; -*- lexical-binding: t -*-

(use-package magit
  :commands (magit-status magit-log-current magit-blame)
  :bind (("C-x g" . magit-status)         ;; Shortcut to open Magit Status
         ("C-x C-g" . magit-dispatch)    ;; Magit dispatch for other actions
         ("C-x M-g" . magit-blame))       ;; Shortcut for Magit Blame
  :config
)
