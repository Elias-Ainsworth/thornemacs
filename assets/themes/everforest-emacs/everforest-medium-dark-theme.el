;;; everforest-medium-dark-theme.el --- Everforest Medium Dark Theme -*- lexical-binding: t; -*-

;; Copyright (C) 2022-2024 theorytoe

;; Author: theorytoe <theorytoe@cock.li>
;; URL: https://github.com/Theory-of-Everything/everforest-emacs
;; Version: 0.1
;; Package-Requires: ((emacs "24"))

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License v3.0 for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;; Everforest medium dark

;;; Code:

(deftheme everforest-medium-dark
  "Everforest Medium Dark - sainnhe/everforest medium dark port to emacs")

(defvar everforest-medium-dark-colors-alist
    (let ((colors `(("everforest-medium-dark-accent"   . "#a7c080")  ; green
                    ("everforest-medium-dark-fg"       . "#d3c6aa")  ; fg
                    ("everforest-medium-dark-bg"       . "#2d353b")  ; base00
                    ("everforest-medium-dark-bg-1"     . "#343f44")  ; base01
                    ("everforest-medium-dark-bg-hl"    . "#475258")  ; base02
                    ("everforest-medium-dark-gutter"   . "#475258")  ; base02 (or adjusted)
                    ("everforest-medium-dark-mono-1"   . "#d3c6aa")  ; base05
                    ("everforest-medium-dark-mono-2"   . "#9da9a0")  ; base04
                    ("everforest-medium-dark-mono-3"   . "#859289")  ; base03
                    ("everforest-medium-dark-cyan"     . "#83c092")  ; base0C
                    ("everforest-medium-dark-blue"     . "#7fbbb3")  ; base0D
                    ("everforest-medium-dark-purple"   . "#d699b6")  ; base0E
                    ("everforest-medium-dark-green"    . "#a7c080")  ; base0B
                    ("everforest-medium-dark-red"      . "#e67e80")  ; base08
                    ("everforest-medium-dark-orange"   . "#e69875")  ; base09
                    ("everforest-medium-dark-yellow"   . "#dbbc7f")  ; base0A
                    ("everforest-medium-dark-gray"     . "#343f44")  ; base01
                    ("everforest-medium-dark-silver"   . "#9da9a0")  ; base04
                    ("everforest-medium-dark-black"    . "#2d353b")  ; base00
                    ("everforest-medium-dark-border"   . "#475258")  ; base02
                    ("everforest-medium-dark-visual"   . "#343f44")))) ; base01
    colors)
  "List of Everforest Medium Dark Colors.")

(defmacro everforest-medium-dark-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
	 ,@ (mapcar (lambda (cons)
		      (list (intern (car cons)) (cdr cons)))
		    everforest-medium-dark-colors-alist))
     ,@body))

(everforest-medium-dark-with-color-variables
  (custom-theme-set-faces
   'everforest-medium-dark

   `(default             ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg))))
   `(success             ((t (:foreground ,everforest-medium-dark-green))))
   `(warning             ((t (:foreground ,everforest-medium-dark-yellow))))
   `(error               ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(link                ((t (:foreground ,everforest-medium-dark-blue :underline t :weight bold))))
   `(link-visited        ((t (:foreground ,everforest-medium-dark-blue :underline t :weight normal))))
   `(cursor              ((t (:background ,everforest-medium-dark-fg))))
   `(fringe              ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-silver))))
   `(region              ((t (:background ,everforest-medium-dark-gutter :distant-foreground ,everforest-medium-dark-mono-2))))
   `(highlight           ((t (:background ,everforest-medium-dark-gray :distant-foreground ,everforest-medium-dark-mono-2))))
   `(hl-line             ((t (:background ,everforest-medium-dark-visual :distant-foreground nil))))
   `(header-line         ((t (:background ,everforest-medium-dark-black))))
   `(vertical-border     ((t (:background ,everforest-medium-dark-border :foreground ,everforest-medium-dark-border))))
   `(secondary-selection ((t (:background ,everforest-medium-dark-bg-1))))
   `(query-replace       ((t (:inherit (isearch)))))
   `(minibuffer-prompt   ((t (:foreground ,everforest-medium-dark-blue))))
   `(tooltip             ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg-1 :inherit variable-pitch))))

   `(font-lock-builtin-face           ((t (:foreground ,everforest-medium-dark-cyan))))
   `(font-lock-comment-face           ((t (:foreground ,everforest-medium-dark-mono-3 :slant italic))))
   `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
   `(font-lock-doc-face               ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face     ((t (:foreground ,everforest-medium-dark-green))))
   `(font-lock-keyword-face           ((t (:foreground ,everforest-medium-dark-red :weight normal))))
   `(font-lock-preprocessor-face      ((t (:foreground ,everforest-medium-dark-red))))
   `(font-lock-string-face            ((t (:foreground ,everforest-medium-dark-green))))
   `(font-lock-type-face              ((t (:foreground ,everforest-medium-dark-green))))
   `(font-lock-constant-face          ((t (:foreground ,everforest-medium-dark-cyan))))
   `(font-lock-variable-name-face     ((t (:foreground ,everforest-medium-dark-blue))))
   `(font-lock-warning-face           ((t (:foreground ,everforest-medium-dark-mono-3 :bold t))))
   `(font-lock-negation-char-face     ((t (:foreground ,everforest-medium-dark-cyan :bold t))))
   `(highlight-numbers-number         ((t (:foreground ,everforest-medium-dark-purple))))

   ;; eob
   `(vi-tilde-fringe-face ((t (:foreground ,everforest-medium-dark-silver))))
   `(solaire-fringe-face  ((t (:foreground ,everforest-medium-dark-silver))))

   ;; mode-line
   `(mode-line           ((t (:background ,everforest-medium-dark-visual :foreground ,everforest-medium-dark-silver))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis  ((t (:weight bold))))
   `(mode-line-inactive  ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-silver))))

   ;; window-divider
   `(window-divider             ((t (:foreground ,everforest-medium-dark-border))))
   `(window-divider-first-pixel ((t (:foreground ,everforest-medium-dark-border))))
   `(window-divider-last-pixel  ((t (:foreground ,everforest-medium-dark-border))))

   ;; custom
   `(custom-state ((t (:foreground ,everforest-medium-dark-green))))

   ;; Package/Plugin Customizations

   ;; ido
   `(ido-first-match ((t (:foreground ,everforest-medium-dark-purple :weight bold))))
   `(ido-only-match  ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(ido-subdir      ((t (:foreground ,everforest-medium-dark-blue))))
   `(ido-virtual     ((t (:foreground ,everforest-medium-dark-mono-3))))

   ;; ace-jump
   `(ace-jump-face-background ((t (:foreground ,everforest-medium-dark-mono-3 :background ,everforest-medium-dark-bg-1 :inverse-video nil))))
   `(ace-jump-face-foreground ((t (:foreground ,everforest-medium-dark-red :background ,everforest-medium-dark-bg-1 :inverse-video nil))))

   ;; ace-window
   `(aw-background-face   ((t (:inherit font-lock-comment-face))))
   `(aw-leading-char-face ((t (:foreground ,everforest-medium-dark-red :weight bold))))

   ;; centaur-tabs
   `(centaur-tabs-default           ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-black))))
   `(centaur-tabs-selected          ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg :weight bold))))
   `(centaur-tabs-unselected        ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-fg :weight light))))
   `(centaur-tabs-selected-modified ((t (:background ,everforest-medium-dark-bg
					 :foreground ,everforest-medium-dark-blue :weight bold))))
   `(centaur-tabs-unselected-modified ((t (:background ,everforest-medium-dark-black :weight light
					   :foreground ,everforest-medium-dark-blue))))
   `(centaur-tabs-active-bar-face            ((t (:background ,everforest-medium-dark-accent))))
   `(centaur-tabs-modified-marker-selected   ((t (:inherit 'centaur-tabs-selected :foreground,everforest-medium-dark-accent))))
   `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected :foreground,everforest-medium-dark-accent))))

   ;; company-mode
   `(company-tooltip                      ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-gray))))
   `(company-tooltip-annotation           ((t (:foreground ,everforest-medium-dark-mono-2 :background ,everforest-medium-dark-gray))))
   `(company-tooltip-annotation-selection ((t (:foreground ,everforest-medium-dark-mono-2 :background ,everforest-medium-dark-mono-3))))
   `(company-tooltip-selection            ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-mono-3))))
   `(company-tooltip-mouse                ((t (:background ,everforest-medium-dark-gray))))
   `(company-tooltip-common               ((t (:foreground ,everforest-medium-dark-yellow :background ,everforest-medium-dark-gray))))
   `(company-tooltip-common-selection     ((t (:foreground ,everforest-medium-dark-yellow :background ,everforest-medium-dark-mono-3))))
   `(company-preview                      ((t (:background ,everforest-medium-dark-bg))))
   `(company-preview-common               ((t (:foreground ,everforest-medium-dark-yellow :background ,everforest-medium-dark-bg))))
   `(company-scrollbar-fg                 ((t (:background ,everforest-medium-dark-mono-1))))
   `(company-scrollbar-bg                 ((t (:background ,everforest-medium-dark-gray))))
   `(company-template-field               ((t (:inherit highlight))))

   ;; doom-modeline
   `(doom-modeline-bar ((t (:background ,everforest-medium-dark-accent))))

   ;; flyspell
   `(flyspell-duplicate ((t (:underline (:color ,everforest-medium-dark-cyan :style wave)))))
   `(flyspell-incorrect ((t (:underline (:color ,everforest-medium-dark-red :style wave)))))

   ;; flymake
   `(flymake-error   ((t (:underline (:color ,everforest-medium-dark-red :style wave)))))
   `(flymake-note    ((t (:underline (:color ,everforest-medium-dark-green :style wave)))))
   `(flymake-warning ((t (:underline (:color ,everforest-medium-dark-orange :style wave)))))

   ;; flycheck
   `(flycheck-error   ((t (:underline (:color ,everforest-medium-dark-red :style wave)))))
   `(flycheck-info    ((t (:underline (:color ,everforest-medium-dark-green :style wave)))))
   `(flycheck-warning ((t (:underline (:color ,everforest-medium-dark-orange :style wave)))))

   ;; compilation
   `(compilation-face           ((t (:foreground ,everforest-medium-dark-fg))))
   `(compilation-line-number    ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(compilation-column-number  ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(compilation-mode-line-exit ((t (:inherit compilation-info :weight bold))))
   `(compilation-mode-line-fail ((t (:inherit compilation-error :weight bold))))

   ;; isearch
   `(isearch        ((t (:foreground ,everforest-medium-dark-bg :background ,everforest-medium-dark-purple))))
   `(isearch-fail   ((t (:foreground ,everforest-medium-dark-red :background nil))))
   `(lazy-highlight ((t (:foreground ,everforest-medium-dark-purple :background ,everforest-medium-dark-bg-1 :underline ,everforest-medium-dark-purple))))

   ;; diff-hl (https://github.com/dgutov/diff-hl)
   '(diff-hl-change ((t (:foreground "#E9C062" :background "#8b733a"))))
   '(diff-hl-delete ((t (:foreground "#CC6666" :background "#7a3d3d"))))
   '(diff-hl-insert ((t (:foreground "#A8FF60" :background "#547f30"))))

   ;; dired-mode
   '(dired-directory ((t (:inherit (font-lock-keyword-face)))))
   '(dired-flagged       ((t (:inherit (diff-hl-delete)))))
   '(dired-symlink       ((t (:foreground "#FD5FF1"))))
   `(diredfl-file-name   ((t (:foreground ,everforest-medium-dark-fg))))
   `(diredfl-file-suffix ((t (:foreground ,everforest-medium-dark-fg))))
   `(diredfl-number      ((t (:foreground ,everforest-medium-dark-red))))
   `(diredfl-date-time   ((t (:foreground ,everforest-medium-dark-blue))))
   `(diredfl-no-priv     ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-dir-priv    ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-read-priv   ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-write-priv  ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-exec-priv   ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-link-priv   ((t (:foreground ,everforest-medium-dark-yellow))))
   `(diredfl-dir-heading ((t (:foreground ,everforest-medium-dark-green :weight bold))))

   ;; dired-async
   `(dired-async-failures     ((t (:inherit error))))
   `(dired-async-message      ((t (:inherit success))))
   `(dired-async-mode-message ((t (:foreground ,everforest-medium-dark-orange))))

   ;; helm
   `(helm-header ((t (:foreground ,everforest-medium-dark-mono-2
		      :background ,everforest-medium-dark-bg
		      :underline nil
		      :box (:line-width 6 :color ,everforest-medium-dark-bg)))))
   `(helm-source-header ((t (:foreground ,everforest-medium-dark-yellow
			     :background ,everforest-medium-dark-bg
			     :underline nil
			     :weight bold
			     :box (:line-width 6 :color ,everforest-medium-dark-bg)))))
   `(helm-selection                    ((t (:background ,everforest-medium-dark-gray))))
   `(helm-selection-line               ((t (:background ,everforest-medium-dark-gray))))
   `(helm-visible-mark                 ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-yellow))))
   `(helm-candidate-number             ((t (:foreground ,everforest-medium-dark-green :background ,everforest-medium-dark-bg-1))))
   `(helm-separator                    ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-red))))
   `(helm-M-x-key                      ((t (:foreground ,everforest-medium-dark-orange))))
   `(helm-bookmark-addressbook         ((t (:foreground ,everforest-medium-dark-orange))))
   `(helm-bookmark-directory           ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file                ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus                ((t (:foreground ,everforest-medium-dark-purple))))
   `(helm-bookmark-info                ((t (:foreground ,everforest-medium-dark-green))))
   `(helm-bookmark-man                 ((t (:foreground ,everforest-medium-dark-yellow))))
   `(helm-bookmark-w3m                 ((t (:foreground ,everforest-medium-dark-purple))))
   `(helm-match                        ((t (:foreground ,everforest-medium-dark-yellow))))
   `(helm-ff-directory                 ((t (:foreground ,everforest-medium-dark-cyan :background ,everforest-medium-dark-bg :weight bold))))
   `(helm-ff-file                      ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg :weight normal))))
   `(helm-ff-executable                ((t (:foreground ,everforest-medium-dark-green :background ,everforest-medium-dark-bg :weight normal))))
   `(helm-ff-invalid-symlink           ((t (:foreground ,everforest-medium-dark-red :background ,everforest-medium-dark-bg :weight bold))))
   `(helm-ff-symlink                   ((t (:foreground ,everforest-medium-dark-yellow :background ,everforest-medium-dark-bg :weight bold))))
   `(helm-ff-prefix                    ((t (:foreground ,everforest-medium-dark-bg :background ,everforest-medium-dark-yellow :weight normal))))
   `(helm-buffer-not-saved             ((t (:foreground ,everforest-medium-dark-red))))
   `(helm-buffer-process               ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(helm-buffer-saved-out             ((t (:foreground ,everforest-medium-dark-fg))))
   `(helm-buffer-size                  ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(helm-buffer-directory             ((t (:foreground ,everforest-medium-dark-purple))))
   `(helm-grep-cmd-line                ((t (:foreground ,everforest-medium-dark-cyan))))
   `(helm-grep-file                    ((t (:foreground ,everforest-medium-dark-fg))))
   `(helm-grep-finish                  ((t (:foreground ,everforest-medium-dark-green))))
   `(helm-grep-lineno                  ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(helm-grep-finish                  ((t (:foreground ,everforest-medium-dark-red))))
   `(helm-grep-match                   ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-swoop-target-line-block-face ((t (:background ,everforest-medium-dark-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-line-face       ((t (:background ,everforest-medium-dark-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-word-face       ((t (:background ,everforest-medium-dark-purple :foreground "#ffffff"))))
   `(helm-locate-finish                ((t (:foreground ,everforest-medium-dark-green))))
   `(info-menu-star                    ((t (:foreground ,everforest-medium-dark-red))))

   ;; ivy
   `(ivy-confirm-face               ((t (:inherit minibuffer-prompt :foreground ,everforest-medium-dark-green))))
   `(ivy-current-match              ((t (:background ,everforest-medium-dark-gray :weight normal))))
   `(ivy-highlight-face             ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face        ((t (:inherit minibuffer-prompt :foreground ,everforest-medium-dark-red))))
   `(ivy-minibuffer-match-face-1    ((t (:background ,everforest-medium-dark-bg-hl))))
   `(ivy-minibuffer-match-face-2    ((t (:inherit ivy-minibuffer-match-face-1 :background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-purple :weight semi-bold))))
   `(ivy-minibuffer-match-face-3    ((t (:inherit ivy-minibuffer-match-face-2 :background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-green :weight semi-bold))))
   `(ivy-minibuffer-match-face-4    ((t (:inherit ivy-minibuffer-match-face-2 :background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-yellow :weight semi-bold))))
   `(ivy-minibuffer-match-highlight ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer            ((t (:inherit default :foreground ,everforest-medium-dark-orange))))
   `(ivy-virtual                    ((t (:inherit font-lock-builtin-face :slant italic))))

   ;; counsel
   `(counsel-key-binding ((t (:foreground ,everforest-medium-dark-yellow :weight bold))))

   ;; swiper
   `(swiper-match-face-1 ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2 ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3 ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4 ((t (:inherit ivy-minibuffer-match-face-4))))

   ;; git-commit
   `(git-commit-comment-action  ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(git-commit-comment-branch  ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(git-commit-comment-heading ((t (:foreground ,everforest-medium-dark-yellow :weight bold))))

   ;; git-gutter
   `(git-gutter:added    ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(git-gutter:deleted  ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(git-gutter:modified ((t (:foreground ,everforest-medium-dark-orange :weight bold))))

   ;; eshell
   `(eshell-ls-archive    ((t (:foreground ,everforest-medium-dark-purple :weight bold))))
   `(eshell-ls-backup     ((t (:foreground ,everforest-medium-dark-yellow))))
   `(eshell-ls-clutter    ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(eshell-ls-directory  ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(eshell-ls-missing    ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(eshell-ls-product    ((t (:foreground ,everforest-medium-dark-yellow))))
   `(eshell-ls-special    ((t (:foreground "#FD5FF1" :weight bold))))
   `(eshell-ls-symlink    ((t (:foreground ,everforest-medium-dark-cyan :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,everforest-medium-dark-mono-1))))
   `(eshell-prompt        ((t (:inherit minibuffer-prompt))))

   ;; man
   `(Man-overstrike ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(Man-underline  ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; woman
   `(woman-bold   ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(woman-italic ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; dictionary
   `(dictionary-button-face     ((t (:inherit widget-button))))
   `(dictionary-reference-face  ((t (:inherit font-lock-type-face :weight bold))))
   `(dictionary-word-entry-face ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; erc
   `(erc-error-face     ((t (:inherit error))))
   `(erc-input-face     ((t (:inherit shadow))))
   `(erc-my-nick-face   ((t (:foreground ,everforest-medium-dark-accent))))
   `(erc-notice-face    ((t (:inherit font-lock-comment-face))))
   `(erc-timestamp-face ((t (:foreground ,everforest-medium-dark-green :weight bold))))

   ;; jabber
   `(jabber-roster-user-online     ((t (:foreground ,everforest-medium-dark-green))))
   `(jabber-roster-user-away       ((t (:foreground ,everforest-medium-dark-red))))
   `(jabber-roster-user-xa         ((t (:foreground ,everforest-medium-dark-red))))
   `(jabber-roster-user-dnd        ((t (:foreground ,everforest-medium-dark-purple))))
   `(jabber-roster-user-chatty     ((t (:foreground ,everforest-medium-dark-yellow))))
   `(jabber-roster-user-error      ((t (:foreground ,everforest-medium-dark-red :bold t))))
   `(jabber-roster-user-offline    ((t (:foreground ,everforest-medium-dark-mono-3))))
   `(jabber-chat-prompt-local      ((t (:foreground ,everforest-medium-dark-blue))))
   `(jabber-chat-prompt-foreign    ((t (:foreground ,everforest-medium-dark-yellow))))
   `(jabber-chat-prompt-system     ((t (:foreground ,everforest-medium-dark-mono-3))))
   `(jabber-chat-error             ((t (:inherit jabber-roster-user-error))))
   `(jabber-rare-time-face         ((t (:foreground ,everforest-medium-dark-cyan))))
   `(jabber-activity-face          ((t (:inherit jabber-chat-prompt-foreign))))
   `(jabber-activity-personal-face ((t (:inherit jabber-chat-prompt-local))))

   ;; eww
   `(eww-form-checkbox       ((t (:inherit eww-form-submit))))
   `(eww-form-file           ((t (:inherit eww-form-submit))))
   `(eww-form-select         ((t (:inherit eww-form-submit))))
   `(eww-form-submit         ((t (:background ,everforest-medium-dark-gray :foreground ,everforest-medium-dark-fg :box (:line-width 2 :color ,everforest-medium-dark-border :style released-button)))))
   `(eww-form-text           ((t (:inherit widget-field :box (:line-width 1 :color ,everforest-medium-dark-border)))))
   `(eww-form-textarea       ((t (:inherit eww-form-text))))
   `(eww-invalid-certificate ((t (:foreground ,everforest-medium-dark-red))))
   `(eww-valid-certificate   ((t (:foreground ,everforest-medium-dark-green))))

   ;; ediff
   `(ediff-fine-diff-Ancestor      ((t (:background "#885555"))))
   `(ediff-fine-diff-A             ((t (:background "#885555"))))
   `(ediff-fine-diff-B             ((t (:background "#558855"))))
   `(ediff-fine-diff-C             ((t (:background "#555588"))))
   `(ediff-current-diff-Ancestor   ((t (:background "#663333"))))
   `(ediff-current-diff-A          ((t (:background "#663333"))))
   `(ediff-current-diff-B          ((t (:background "#336633"))))
   `(ediff-current-diff-C          ((t (:background "#333366"))))
   `(ediff-even-diff-Ancestor      ((t (:background "#181a1f"))))
   `(ediff-even-diff-A             ((t (:background "#181a1f"))))
   `(ediff-even-diff-B             ((t (:background "#181a1f"))))
   `(ediff-even-diff-C             ((t (:background "#181a1f"))))
   `(ediff-odd-diff-Ancestor       ((t (:background "#181a1f"))))
   `(ediff-odd-diff-A              ((t (:background "#181a1f"))))
   `(ediff-odd-diff-B              ((t (:background "#181a1f"))))
   `(ediff-odd-diff-C              ((t (:background "#181a1f"))))

   ;; magit
   `(magit-section-highlight           ((t (:background ,everforest-medium-dark-bg-hl))))
   `(magit-section-heading             ((t (:foreground ,everforest-medium-dark-yellow :weight bold))))
   `(magit-section-heading-selection   ((t (:foreground ,everforest-medium-dark-fg :weight bold))))
   `(magit-diff-file-heading           ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,everforest-medium-dark-gray :weight bold))))
   `(magit-diff-file-heading-selection ((t (:foreground ,everforest-medium-dark-yellow :background ,everforest-medium-dark-bg-hl :weight bold))))
   `(magit-diff-hunk-heading           ((t (:foreground ,everforest-medium-dark-mono-2 :background ,everforest-medium-dark-gray))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,everforest-medium-dark-mono-1 :background ,everforest-medium-dark-mono-3))))
   `(magit-diff-hunk-heading-selection ((t (:foreground ,everforest-medium-dark-purple :background ,everforest-medium-dark-mono-3))))
   `(magit-diff-context                ((t (:foreground ,everforest-medium-dark-fg))))
   `(magit-diff-context-highlight      ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-fg))))
   `(magit-diffstat-added              ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-diffstat-removed            ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-process-ok                  ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-process-ng                  ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-log-author                  ((t (:foreground ,everforest-medium-dark-yellow))))
   `(magit-log-date                    ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(magit-log-graph                   ((t (:foreground ,everforest-medium-dark-silver))))
   `(magit-sequence-pick               ((t (:foreground ,everforest-medium-dark-yellow))))
   `(magit-sequence-stop               ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-sequence-part               ((t (:foreground ,everforest-medium-dark-orange))))
   `(magit-sequence-head               ((t (:foreground ,everforest-medium-dark-blue))))
   `(magit-sequence-drop               ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-sequence-done               ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(magit-sequence-onto               ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(magit-bisect-good                 ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-bisect-skip                 ((t (:foreground ,everforest-medium-dark-orange))))
   `(magit-bisect-bad                  ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-blame-heading               ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-mono-2))))
   `(magit-blame-hash                  ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-purple))))
   `(magit-blame-name                  ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-yellow))))
   `(magit-blame-date                  ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-mono-3))))
   `(magit-blame-summary               ((t (:background ,everforest-medium-dark-bg-1 :foreground ,everforest-medium-dark-mono-2))))
   `(magit-dimmed                      ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(magit-hash                        ((t (:foreground ,everforest-medium-dark-purple))))
   `(magit-tag                         ((t (:foreground ,everforest-medium-dark-orange :weight bold))))
   `(magit-branch-remote               ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(magit-branch-local                ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(magit-branch-current              ((t (:foreground ,everforest-medium-dark-blue :weight bold :box t))))
   `(magit-head                        ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(magit-refname                     ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg :weight bold))))
   `(magit-refname-stash               ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg :weight bold))))
   `(magit-refname-wip                 ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg :weight bold))))
   `(magit-signature-good              ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-signature-bad               ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-signature-untrusted         ((t (:foreground ,everforest-medium-dark-orange))))
   `(magit-cherry-unmatched            ((t (:foreground ,everforest-medium-dark-cyan))))
   `(magit-cherry-equivalent           ((t (:foreground ,everforest-medium-dark-purple))))
   `(magit-reflog-commit               ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-reflog-amend                ((t (:foreground ,everforest-medium-dark-purple))))
   `(magit-reflog-merge                ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-reflog-checkout             ((t (:foreground ,everforest-medium-dark-blue))))
   `(magit-reflog-reset                ((t (:foreground ,everforest-medium-dark-red))))
   `(magit-reflog-rebase               ((t (:foreground ,everforest-medium-dark-purple))))
   `(magit-reflog-cherry-pick          ((t (:foreground ,everforest-medium-dark-green))))
   `(magit-reflog-remote               ((t (:foreground ,everforest-medium-dark-cyan))))
   `(magit-reflog-other                ((t (:foreground ,everforest-medium-dark-cyan))))

   ;; message
   `(message-cited-text         ((t (:foreground ,everforest-medium-dark-green))))
   `(message-header-cc          ((t (:foreground ,everforest-medium-dark-orange :weight bold))))
   `(message-header-name        ((t (:foreground ,everforest-medium-dark-purple))))
   `(message-header-newsgroups  ((t (:foreground ,everforest-medium-dark-yellow :weight bold :slant italic))))
   `(message-header-other       ((t (:foreground ,everforest-medium-dark-red))))
   `(message-header-subject     ((t (:foreground ,everforest-medium-dark-blue))))
   `(message-header-to          ((t (:foreground ,everforest-medium-dark-yellow :weight bold))))
   `(message-header-xheader     ((t (:foreground ,everforest-medium-dark-silver))))
   `(message-mml                ((t (:foreground ,everforest-medium-dark-purple))))
   `(message-separator          ((t (:foreground ,everforest-medium-dark-mono-3 :slant italic))))

   ;; epa
   `(epa-field-body ((t (:foreground ,everforest-medium-dark-blue :slant italic))))
   `(epa-field-name ((t (:foreground ,everforest-medium-dark-cyan :weight bold))))

   ;; notmuch
   `(notmuch-crypto-decryption            ((t (:foreground ,everforest-medium-dark-purple :background ,everforest-medium-dark-black))))
   `(notmuch-crypto-signature-bad         ((t (:foreground ,everforest-medium-dark-red :background ,everforest-medium-dark-black))))
   `(notmuch-crypto-signature-good        ((t (:foreground ,everforest-medium-dark-green :background ,everforest-medium-dark-black))))
   `(notmuch-crypto-signature-good-key    ((t (:foreground ,everforest-medium-dark-green :background ,everforest-medium-dark-black))))
   `(notmuch-crypto-signature-unknown     ((t (:foreground ,everforest-medium-dark-orange :background ,everforest-medium-dark-black))))
   `(notmuch-hello-logo-background        ((t (:inherit default))))
   `(notmuch-message-summary-face         ((t (:background ,everforest-medium-dark-black))))
   `(notmuch-search-count                 ((t (:inherit default :foreground ,everforest-medium-dark-silver))))
   `(notmuch-search-date                  ((t (:inherit default :foreground ,everforest-medium-dark-purple))))
   `(notmuch-search-matching-authors      ((t (:inherit default :foreground ,everforest-medium-dark-yellow))))
   `(notmuch-search-non-matching-authors  ((t (:inherit font-lock-comment-face :slant italic))))
   `(notmuch-tag-added                    ((t (:underline t))))
   `(notmuch-tag-deleted                  ((t (:strike-through ,everforest-medium-dark-red))))
   `(notmuch-tag-face                     ((t (:foreground ,everforest-medium-dark-green))))
   `(notmuch-tag-unread                   ((t (:foreground ,everforest-medium-dark-red))))
   `(notmuch-tree-match-author-face       ((t (:inherit notmuch-search-matching-authors))))
   `(notmuch-tree-match-date-face         ((t (:inherit notmuch-search-date))))
   `(notmuch-tree-match-face              ((t (:weight semi-bold))))
   `(notmuch-tree-match-tag-face          ((t (:inherit notmuch-tag-face))))
   `(notmuch-tree-no-match-face           ((t (:slant italic :weight light :inherit font-lock-comment-face))))

   ;; mu4e
   `(mu4e-header-key-face      ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(mu4e-header-title-face    ((t (:foreground ,everforest-medium-dark-blue))))
   `(mu4e-title-face           ((t (:foreground ,everforest-medium-dark-green :weight bold))))

   ;; calendar
   `(cfw:face-title                  ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(cfw:face-select                 ((t (:foreground ,everforest-medium-dark-bg :background ,everforest-medium-dark-fg))))
   `(cfw:face-header                 ((t (:foreground ,everforest-medium-dark-fg :weight bold))))
   `(cfw:face-sunday                 ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(cfw:face-holiday                ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(cfw:face-toolbar                ((t (:background ,everforest-medium-dark-bg))))
   `(cfw:face-toolbar-button-on      ((t (:foreground ,everforest-medium-dark-fg :weight bold))))
   `(cfw:face-toolbar-button-off     ((t (:foreground ,everforest-medium-dark-silver :weight bold))))
   `(cfw:face-day-title              ((t (:background ,everforest-medium-dark-bg))))
   `(cfw:face-today-title            ((t (:foreground ,everforest-medium-dark-bg :background ,everforest-medium-dark-green))))

   ;; elfeed
   `(elfeed-log-debug-level-face      ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-green))))
   `(elfeed-log-error-level-face      ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-red))))
   `(elfeed-log-info-level-face       ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-blue))))
   `(elfeed-log-warn-level-face       ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-orange))))
   `(elfeed-search-date-face          ((t (:foreground ,everforest-medium-dark-purple))))
   `(elfeed-search-feed-face          ((t (:foreground ,everforest-medium-dark-yellow))))
   `(elfeed-search-tag-face           ((t (:foreground ,everforest-medium-dark-green))))
   `(elfeed-search-title-face         ((t (:foreground ,everforest-medium-dark-silver))))
   `(elfeed-search-unread-title-face  ((t (:foreground ,everforest-medium-dark-mono-1 :weight bold))))
   `(elfeed-search-unread-count-face  ((t (:foreground ,everforest-medium-dark-silver))))

   ;; perspective
   `(persp-selected-face ((t (:foreground ,everforest-medium-dark-blue))))

   ;; powerline
   `(powerline-active1    ((,class (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-purple))))
   `(powerline-active2    ((,class (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-purple))))
   `(powerline-inactive1  ((,class (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg))))
   `(powerline-inactive2  ((,class (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-fg))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face    ((t (:foreground ,everforest-medium-dark-green))))
   `(rainbow-delimiters-depth-2-face    ((t (:foreground ,everforest-medium-dark-red))))
   `(rainbow-delimiters-depth-3-face    ((t (:foreground ,everforest-medium-dark-blue))))
   `(rainbow-delimiters-depth-4-face    ((t (:foreground ,everforest-medium-dark-cyan))))
   `(rainbow-delimiters-depth-5-face    ((t (:foreground ,everforest-medium-dark-purple))))
   `(rainbow-delimiters-depth-6-face    ((t (:foreground ,everforest-medium-dark-yellow))))
   `(rainbow-delimiters-depth-7-face    ((t (:foreground ,everforest-medium-dark-orange))))
   `(rainbow-delimiters-depth-8-face    ((t (:foreground ,everforest-medium-dark-green))))
   `(rainbow-delimiters-depth-9-face    ((t (:foreground ,everforest-medium-dark-orange))))
   `(rainbow-delimiters-depth-10-face   ((t (:foreground ,everforest-medium-dark-cyan))))
   `(rainbow-delimiters-depth-11-face   ((t (:foreground ,everforest-medium-dark-purple))))
   `(rainbow-delimiters-depth-12-face   ((t (:foreground ,everforest-medium-dark-yellow))))
   `(rainbow-delimiters-unmatched-face  ((t (:foreground ,everforest-medium-dark-red :weight bold))))

   ;; rbenv
   `(rbenv-active-ruby-face ((t (:foreground ,everforest-medium-dark-green))))

   ;; elixir
   `(elixir-atom-face       ((t (:foreground ,everforest-medium-dark-cyan))))
   `(elixir-attribute-face  ((t (:foreground ,everforest-medium-dark-red))))

   ;; show-paren
   `(show-paren-match     ((,class (:foreground ,everforest-medium-dark-purple :inherit bold :underline t))))
   `(show-paren-mismatch  ((,class (:foreground ,everforest-medium-dark-red :inherit bold :underline t))))

   ;; cider
   `(cider-fringe-good-face ((t (:foreground ,everforest-medium-dark-green))))

   ;; sly
   `(sly-error-face          ((t (:underline (:color ,everforest-medium-dark-red :style wave)))))
   `(sly-mrepl-note-face     ((t (:inherit font-lock-comment-face))))
   `(sly-mrepl-output-face   ((t (:inherit font-lock-string-face))))
   `(sly-mrepl-prompt-face   ((t (:inherit comint-highlight-prompt))))
   `(sly-note-face           ((t (:underline (:color ,everforest-medium-dark-green :style wave)))))
   `(sly-style-warning-face  ((t (:underline (:color ,everforest-medium-dark-yellow :style wave)))))
   `(sly-warning-face        ((t (:underline (:color ,everforest-medium-dark-orange :style wave)))))

   ;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,everforest-medium-dark-red :background ,everforest-medium-dark-gray :weight bold))))
   `(sp-show-pair-match-face    ((t (:foreground ,everforest-medium-dark-blue :weight bold :underline t))))

   ;; lispy
   `(lispy-face-hint ((t (:background ,everforest-medium-dark-border :foreground ,everforest-medium-dark-yellow))))

   ;; lispyville
   `(lispyville-special-face ((t (:foreground ,everforest-medium-dark-red))))

   ;; spaceline
   `(spaceline-flycheck-error    ((,class (:foreground ,everforest-medium-dark-red))))
   `(spaceline-flycheck-info     ((,class (:foreground ,everforest-medium-dark-green))))
   `(spaceline-flycheck-warning  ((,class (:foreground ,everforest-medium-dark-orange))))
   `(spaceline-python-venv       ((,class (:foreground ,everforest-medium-dark-purple))))

   ;; solaire mode
   `(solaire-default-face      ((,class (:inherit default :background ,everforest-medium-dark-black))))
   `(solaire-minibuffer-face   ((,class (:inherit default :background ,everforest-medium-dark-black))))

   ;; web-mode
   `(web-mode-doctype-face            ((t (:inherit font-lock-comment-face))))
   `(web-mode-error-face              ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-red))))
   `(web-mode-html-attr-equal-face    ((t (:inherit default))))
   `(web-mode-html-attr-name-face     ((t (:foreground ,everforest-medium-dark-orange))))
   `(web-mode-html-tag-bracket-face   ((t (:inherit default))))
   `(web-mode-html-tag-face           ((t (:foreground ,everforest-medium-dark-red))))
   `(web-mode-symbol-face             ((t (:foreground ,everforest-medium-dark-orange))))

   ;; nxml
   `(nxml-attribute-local-name             ((t (:foreground ,everforest-medium-dark-orange))))
   `(nxml-element-local-name               ((t (:foreground ,everforest-medium-dark-red))))
   `(nxml-markup-declaration-delimiter     ((t (:inherit (font-lock-comment-face nxml-delimiter)))))
   `(nxml-processing-instruction-delimiter ((t (:inherit nxml-markup-declaration-delimiter))))

   ;; flx-ido
   `(flx-highlight-face ((t (:inherit (link) :weight bold))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face          ((t (:foreground ,everforest-medium-dark-blue))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground "#FFFFFF" :background ,everforest-medium-dark-red))))
   `(rpm-spec-macro-face        ((t (:foreground ,everforest-medium-dark-yellow))))
   `(rpm-spec-var-face          ((t (:foreground ,everforest-medium-dark-red))))
   `(rpm-spec-doc-face          ((t (:foreground ,everforest-medium-dark-purple))))
   `(rpm-spec-dir-face          ((t (:foreground ,everforest-medium-dark-cyan))))
   `(rpm-spec-package-face      ((t (:foreground ,everforest-medium-dark-red))))
   `(rpm-spec-ghost-face        ((t (:foreground ,everforest-medium-dark-red))))
   `(rpm-spec-section-face      ((t (:foreground ,everforest-medium-dark-yellow))))

   ;; guix
   `(guix-true ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(guix-build-log-phase-end ((t (:inherit success))))
   `(guix-build-log-phase-start ((t (:inherit success :weight bold))))

   ;; gomoku
   `(gomoku-O ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(gomoku-X ((t (:foreground ,everforest-medium-dark-green :weight bold))))

   ;; tabbar
   `(tabbar-default             ((,class (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-black))))
   `(tabbar-highlight           ((,class (:underline t))))
   `(tabbar-button              ((,class (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg))))
   `(tabbar-button-highlight    ((,class (:inherit 'tabbar-button :inverse-video t))))
   `(tabbar-modified            ((,class (:inherit tabbar-button :foreground ,everforest-medium-dark-purple :weight light :slant italic))))
   `(tabbar-unselected          ((,class (:inherit tabbar-default :foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-black :slant italic :underline nil :box (:line-width 1 :color ,everforest-medium-dark-bg)))))
   `(tabbar-unselected-modified ((,class (:inherit tabbar-modified :background ,everforest-medium-dark-black :underline nil :box (:line-width 1 :color ,everforest-medium-dark-bg)))))
   `(tabbar-selected            ((,class (:inherit tabbar-default :foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg :weight bold :underline nil :box (:line-width 1 :color ,everforest-medium-dark-bg)))))
   `(tabbar-selected-modified   ((,class (:inherit tabbar-selected :foreground ,everforest-medium-dark-purple :underline nil :box (:line-width 1 :color ,everforest-medium-dark-bg)))))

   ;; linum
   `(linum                    ((t (:foreground ,everforest-medium-dark-gutter :background ,everforest-medium-dark-bg))))
   ;; hlinum
   `(linum-highlight-face     ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg))))
   ;; native line numbers (emacs version >=26)
   `(line-number              ((t (:foreground ,everforest-medium-dark-gutter :background ,everforest-medium-dark-bg))))
   `(line-number-current-line ((t (:foreground ,everforest-medium-dark-fg :background ,everforest-medium-dark-bg))))

   ;; regexp-builder
   `(reb-match-0 ((t (:background ,everforest-medium-dark-gray))))
   `(reb-match-1 ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-purple :weight semi-bold))))
   `(reb-match-2 ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-green :weight semi-bold))))
   `(reb-match-3 ((t (:background ,everforest-medium-dark-black :foreground ,everforest-medium-dark-yellow :weight semi-bold))))

   ;; desktop-entry
   `(desktop-entry-deprecated-keyword-face ((t (:inherit font-lock-warning-face))))
   `(desktop-entry-group-header-face       ((t (:inherit font-lock-type-face))))
   `(desktop-entry-locale-face             ((t (:inherit font-lock-string-face))))
   `(desktop-entry-unknown-keyword-face    ((t (:underline (:color ,everforest-medium-dark-red :style wave) :inherit font-lock-keyword-face))))
   `(desktop-entry-value-face              ((t (:inherit default))))

   ;; calendar
   `(diary   ((t (:inherit warning))))
   `(holiday ((t (:foreground ,everforest-medium-dark-green))))

   ;; gud
   `(breakpoint-disabled ((t (:foreground ,everforest-medium-dark-orange))))
   `(breakpoint-enabled  ((t (:foreground ,everforest-medium-dark-red :weight bold))))

   ;; realgud
   `(realgud-overlay-arrow1        ((t (:foreground ,everforest-medium-dark-green))))
   `(realgud-overlay-arrow3        ((t (:foreground ,everforest-medium-dark-orange))   `(realgud-overlay-arrow2        ((t (:foreground ,everforest-medium-dark-yellow))))
				    ))
   '(realgud-bp-enabled-face       ((t (:inherit (error)))))
   `(realgud-bp-disabled-face      ((t (:inherit (secondary-selection)))))
   `(realgud-bp-line-enabled-face  ((t (:box (:color ,everforest-medium-dark-red)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color ,everforest-medium-dark-gray)))))
   `(realgud-line-number           ((t (:foreground ,everforest-medium-dark-mono-2))))
   `(realgud-backtrace-number      ((t (:inherit (secondary-selection)))))

   ;; rmsbolt
   `(rmsbolt-current-line-face ((t (:inherit hl-line :weight bold))))

   ;; ruler-mode
   `(ruler-mode-column-number  ((t (:inherit ruler-mode-default))))
   `(ruler-mode-comment-column ((t (:foreground ,everforest-medium-dark-red))))
   `(ruler-mode-current-column ((t (:foreground ,everforest-medium-dark-accent :inherit ruler-mode-default))))
   `(ruler-mode-default        ((t (:inherit mode-line))))
   `(ruler-mode-fill-column    ((t (:foreground ,everforest-medium-dark-orange :inherit ruler-mode-default))))
   `(ruler-mode-fringes        ((t (:foreground ,everforest-medium-dark-green :inherit ruler-mode-default))))
   `(ruler-mode-goal-column    ((t (:foreground ,everforest-medium-dark-cyan :inherit ruler-mode-default))))
   `(ruler-mode-margins        ((t (:inherit ruler-mode-default))))
   `(ruler-mode-tab-stop       ((t (:foreground ,everforest-medium-dark-mono-3 :inherit ruler-mode-default))))

   ;; undo-tree
   `(undo-tree-visualizer-current-face    ((t (:foreground ,everforest-medium-dark-red))))
   `(undo-tree-visualizer-register-face   ((t (:foreground ,everforest-medium-dark-orange))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,everforest-medium-dark-cyan))))

   ;; tab-bar-mode
   `(tab-bar-tab-inactive ((t (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-fg))))
   `(tab-bar-tab          ((t (:background ,everforest-medium-dark-bg :foreground ,everforest-medium-dark-purple))))
   `(tab-bar              ((t (:background ,everforest-medium-dark-bg-hl))))

   ;; all-the-icons
   `(all-the-icons-purple    ((t (:foreground ,everforest-medium-dark-purple))))
   `(all-the-icons-yellow    ((t (:foreground ,everforest-medium-dark-yellow))))

   ;; dashboard
   `(dashboard-heading        ((t (:foreground ,everforest-medium-dark-green))))
   `(dashboard-items-face     ((t (:bold ,everforest-medium-dark-green))))

   ;; Language Customizations ----------------------------------------------------------------------
   ;; these laguage customizations are seperate from certain larger lagu

   ;; markdown
   `(markdown-header-face-1            ((t (:foreground ,everforest-medium-dark-red :weight bold))))
   `(markdown-header-face-2            ((t (:foreground ,everforest-medium-dark-orange :weight bold))))
   `(markdown-link-face                ((t (:foreground ,everforest-medium-dark-purple ))))
   `(markdown-url-face                 ((t (:foreground ,everforest-medium-dark-blue :underline t))))
   `(markdown-plain-url-face           ((t (:foreground ,everforest-medium-dark-blue))))
   `(markdown-header-delimiter-face    ((t (:foreground ,everforest-medium-dark-silver))))
   `(markdown-language-keyword-face    ((t (:foreground ,everforest-medium-dark-green))))
   `(markdown-markup-face              ((t (:foreground ,everforest-medium-dark-silver))))
   `(markdown-pre-face                 ((t (:foreground ,everforest-medium-dark-green))))
   `(markdown-metadata-key-face        ((t (:foreground ,everforest-medium-dark-green))))

   ;; org-mode
   `(org-date                  ((t (:foreground ,everforest-medium-dark-cyan))))
   `(org-document-info         ((t (:foreground ,everforest-medium-dark-mono-3))))
   `(org-document-info-keyword ((t (:inherit org-meta-line :underline t))))
   `(org-document-title        ((t (:weight bold))))
   `(org-footnote              ((t (:foreground ,everforest-medium-dark-cyan))))
   `(org-sexp-date             ((t (:foreground ,everforest-medium-dark-cyan))))
   `(org-table                 ((t (:foreground ,everforest-medium-dark-blue))))
   `(org-drawer                ((t (:foreground ,everforest-medium-dark-blue))))
   `(org-headline-done         ((t (:foreground ,everforest-medium-dark-purple))))
   ;; `(org-block                 ((t (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-silver :extend t))))
   ;; `(org-block-begin-line      ((t (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-silver :extend t))))
   ;; `(org-block-end-line        ((t (:background ,everforest-medium-dark-bg-hl :foreground ,everforest-medium-dark-silver :extend t))))
   `(org-level-1               ((t (:foreground ,everforest-medium-dark-green))))
   `(org-level-2               ((t (:foreground ,everforest-medium-dark-red))))
   `(org-level-3               ((t (:foreground ,everforest-medium-dark-purple))))
   `(org-level-4               ((t (:foreground ,everforest-medium-dark-orange))))
   `(org-level-6               ((t (:foreground ,everforest-medium-dark-blue))))
   `(org-level-7               ((t (:foreground ,everforest-medium-dark-silver))))
   `(org-level-8               ((t (:foreground ,everforest-medium-dark-cyan))))
   `(org-cite                  ((t (:foreground ,everforest-medium-dark-blue :weight bold))))
   `(org-cite-key              ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(org-hide                  ((t (:foreground ,everforest-medium-dark-bg))))

   ;; latex-mode
   `(font-latex-sectioning-0-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-sectioning-1-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-sectioning-2-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-sectioning-3-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-sectioning-4-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-sectioning-5-face        ((t (:foreground ,everforest-medium-dark-blue :height 1.0))))
   `(font-latex-bold-face                ((t (:foreground ,everforest-medium-dark-green :weight bold))))
   `(font-latex-italic-face              ((t (:foreground ,everforest-medium-dark-green :slant italic))))
   `(font-latex-warning-face             ((t (:foreground ,everforest-medium-dark-red))))
   `(font-latex-doctex-preprocessor-face ((t (:foreground ,everforest-medium-dark-cyan))))
   `(font-latex-script-char-face         ((t (:foreground ,everforest-medium-dark-gray))))

   ;; sh-mode
   `(sh-heredoc ((t (:inherit font-lock-string-face :slant italic))))

   ;; js2-mode
   `(js2-error             ((t (:underline (:color ,everforest-medium-dark-red :style wave)))))
   `(js2-external-variable ((t (:foreground ,everforest-medium-dark-cyan))))
   `(js2-warning           ((t (:underline (:color ,everforest-medium-dark-orange :style wave)))))
   `(js2-function-call     ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param    ((t (:foreground ,everforest-medium-dark-mono-1))))
   `(js2-jsdoc-tag         ((t (:foreground ,everforest-medium-dark-purple))))
   `(js2-jsdoc-type        ((t (:foreground ,everforest-medium-dark-yellow))))
   `(js2-jsdoc-value       ((t (:foreground ,everforest-medium-dark-red))))
   `(js2-object-property   ((t (:foreground ,everforest-medium-dark-red))))

   ;; whitespace-mode
   `(whitespace-big-indent       ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-empty            ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-hspace           ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-indentation      ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-line             ((t (:background ,everforest-medium-dark-border))))
   `(whitespace-newline          ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-space            ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-space-after-tab  ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-space-before-tab ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-tab              ((t (:foreground ,everforest-medium-dark-border))))
   `(whitespace-trailing         ((t (:foreground ,everforest-medium-dark-silver))))
   ))

(everforest-medium-dark-with-color-variables
  (custom-theme-set-variables
   'everforest-medium-dark
   ;; fill-column-indicator
   `(fci-rule-color ,everforest-medium-dark-gray)

   ;; tetris
   ;; | Tetromino | Color                    |
   ;; | O         | `everforest-medium-dark-yellow' |
   ;; | J         | `everforest-medium-dark-blue'     |
   ;; | L         | `everforest-medium-dark-orange' |
   ;; | Z         | `everforest-medium-dark-red'    |
   ;; | S         | `everforest-medium-dark-green'    |
   ;; | T         | `everforest-medium-dark-purple'   |
   ;; | I         | `everforest-medium-dark-cyan'     |
   '(tetris-x-colors
     [[229 192 123] [97 175 239] [209 154 102] [224 108 117] [152 195 121] [198 120 221] [86 182 194]])

   ;; ansi-color
   `(ansi-color-names-vector
     [,everforest-medium-dark-black ,everforest-medium-dark-red ,everforest-medium-dark-green ,everforest-medium-dark-yellow
				  ,everforest-medium-dark-blue ,everforest-medium-dark-purple ,everforest-medium-dark-cyan ,everforest-medium-dark-fg])))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
		  (file-name-as-directory
		   (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'everforest-medium-dark)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; everforest-medium-dark-theme.el ends here

