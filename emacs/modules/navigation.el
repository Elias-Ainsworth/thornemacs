;;; -*- lexical-binding: t -*-

(use-package which-key
  :defer 1
  :config
  (which-key-mode)
  (setq which-key-idle-delay 0.3))

(use-package avy
  :bind (("M-s" . avy-goto-char-timer)
         ("M-g c" . avy-goto-char)
         ("M-g w" . avy-goto-word-1)))

(use-package consult
  :bind (("C-s" . consult-line)
         ("C-x b" . consult-buffer)
         ("M-g g" . consult-goto-line)
         ("M-g M-g" . consult-goto-line)))

(use-package embark
  :bind (("C-." . embark-act)
         ("C-;" . embark-dwim)
         ("C-h B" . embark-bindings))
  :init
  (setq embark-action-indicator
        (lambda (&optional _)
          (which-key--show-keymap "Embark Actions" embark--keymap nil nil t)))
  (setq embark-become-indicator embark-action-indicator))

(use-package orderless
  :init
  (setq completion-styles '(orderless)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package vertico
  :init
  (setq vertico-cycle t)
  (vertico-mode))

(use-package marginalia
  :init (marginalia-mode))

(use-package dirvish
  :after evil
  :init
  (dirvish-override-dired-mode)
  :config
  (setq dirvish-default-layout '(0 0.25 0.75))
  (setq dirvish-mode-line-format
        '(:left (sort symlink) :right (omit yank index)))
  (setq dirvish-header-line-height 24)

  ;; Explicitly bind Evil keys to Dirvish (NOT using evil-collection)
  (with-eval-after-load 'dirvish
    (evil-define-key 'normal dirvish-mode-map
      "h" #'dired-up-directory
      "l" #'dired-find-file
      "q" #'quit-window
      "gg" #'revert-buffer
      ;; You can add more custom bindings here
      ))

  ;; Optional: if you want Enter (RET) to open files too
  (with-eval-after-load 'dirvish
    (evil-define-key 'normal dirvish-mode-map
      (kbd "RET") #'dired-find-file))
)
