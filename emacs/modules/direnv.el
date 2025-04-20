;;; -*- lexical-binding: t -*-

(use-package envrc
  :demand t  ; Load immediately instead of deferring
  :config
  (envrc-global-mode)

  ;; Activate envrc before starting LSP to ensure correct environment
  (defun thornemacs/ensure-envrc-before-lsp ()
    "Make sure envrc is activated before LSP starts."
    (when (and (buffer-file-name)
              (not envrc--status))
      (envrc-mode 1)
      (envrc-reload)))

  ;; Add this hook to prog-mode which will run before our LSP hooks
  (add-hook 'prog-mode-hook #'thornemacs/ensure-envrc-before-lsp '5))
