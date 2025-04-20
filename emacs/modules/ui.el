;;; -*- lexical-binding: t -*-

(setq window-divider-default-right-width 0)
(setq window-divider-default-bottom-width 0)
(window-divider-mode -1)

(add-to-list 'default-frame-alist '(internal-border-width . 0))
(set-frame-parameter nil 'internal-border-width 0)

(use-package catppuccin-theme
  :config (setq catppuccin-flavor 'mocha)
  :init (load-theme 'catppuccin :no-confirm))

(add-hook 'server-after-make-frame-hook #'catppuccin-reload)

(require 'json)
(require 'filenotify)

;; Path to your Wallust JSON
(defvar thornemacs/wallust-json-path "~/.cache/wallust/nix.json")

;; Watch descriptor
(defvar thornemacs/wallust-watch-descriptor nil)

;; Function to load background from Wallust JSON
(defun thornemacs/load-wallust-bg-from-json ()
  "Load background color from Wallust JSON and apply it to default face."
  (interactive)
  (when (file-exists-p thornemacs/wallust-json-path)
    (let* ((json-object-type 'alist)
           (json (with-temp-buffer
                   (insert-file-contents thornemacs/wallust-json-path)
                   (json-read)))
           (bg (alist-get 'background (alist-get 'special json))))
      (when (and bg (stringp bg))
        (set-face-background 'default bg)
        (set-face-background 'fringe bg)
        (message "Set background to: %s" bg)))))

;; Watcher function
(defun thornemacs/start-wallust-bg-watcher ()
  "Start watching the Wallust JSON file for background changes."
  (interactive)
  (unless (and thornemacs/wallust-watch-descriptor
               (file-notify-valid-p thornemacs/wallust-watch-descriptor))
    (when (file-exists-p thornemacs/wallust-json-path)
      (setq thornemacs/wallust-watch-descriptor
            (file-notify-add-watch
             thornemacs/wallust-json-path
             '(change)
             (lambda (_event) (thornemacs/load-wallust-bg-from-json)))))
    (message "Started watching Wallust JSON for background updates.")))

;; Optional: start the watcher immediately
(thornemacs/load-wallust-bg-from-json)
(thornemacs/start-wallust-bg-watcher)

(add-to-list 'default-frame-alist '(alpha-background . 80))
(set-frame-parameter nil 'alpha-background 80)
(set-face-background 'default nil (selected-frame))

(use-package dashboard
  :demand t
  :init
  ;; Delay initial-buffer-choice until after dashboard loads
  (setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
  :config
  (dashboard-setup-startup-hook)

  ;; Banner and layout
  (setq dashboard-startup-banner 'official) ; You can use a custom path too
  (setq dashboard-center-content t)
  (setq dashboard-show-shortcuts nil)

  ;; Dashboard items
  (setq dashboard-items '((recents  . 5)
                          (projects . 5)
                          (agenda   . 5))))

(use-package nerd-icons)

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-height 25
        doom-modeline-bar-width 3
        doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-buffer-file-name-style 'truncate-upto-project))

(defun thornemacs/enable-indent-guides-safe ()
  (when (face-background 'default)
    (highlight-indent-guides-mode)))

(use-package highlight-indent-guides
  :hook (prog-mode . thornemacs/enable-indent-guides-safe)
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-auto-enabled t
        highlight-indent-guides-responsive 'top))

(use-package rainbow-mode
  :hook (prog-mode . rainbow-mode))

(use-package smartparens
  :init (smartparens-global-mode)
  :hook (prog-mode . smartparens-mode)
  :config
  (require 'smartparens-config))
