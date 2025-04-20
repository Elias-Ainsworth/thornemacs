;;; -*- lexical-binding: t -*-

;; Prevent conflicts with evil-collection
(setq evil-want-keybinding nil)

(use-package evil
  :demand t
  :init
  :config
  (evil-mode 1))

 (use-package evil-collection
   :after evil
   :init (evil-collection-init))

(use-package embrace)

(use-package evil-embrace
  :after (evil embrace)
  :config (evil-embrace-enable-evil-surround-integration))

(use-package evil-commentary
  :after evil
  :init (evil-commentary-mode 1))
