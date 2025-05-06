{
  emacsWithPackagesFromUsePackage,
  emacs-git-pgtk,
  ...
}:
emacsWithPackagesFromUsePackage {
  package = emacs-git-pgtk;

  config = ../init.org;

  defaultInitFile = true;
  alwaysEnsure = true;
  alwaysTangle = true;

  extraEmacsPackages =
    epkgs: with epkgs; [

      # Core
      use-package
      babel
      benchmark-init
      vterm

      # Evil stack (Vim keybindings)
      evil
      evil-collection
      evil-commentary
      embrace
      evil-embrace
      evil-org

      # Git
      magit

      # Org-mode
      org
      org-autolist
      org-roam
      org-roam-timestamps
      org-roam-ui
      org-modern
      htmlize

      # Direnv
      envrc

      # Completion
      company
      yasnippet
      yasnippet-snippets

      # LSP (default: eglot, fallback: lsp-mode)
      eglot
      eldoc
      eldoc-box
      json-rpc
      lsp-mode
      lsp-ui
      consult-lsp

      # Navigation / Fuzzy
      which-key
      vertico
      orderless
      projectile
      projectile-ripgrep
      marginalia
      avy
      embark
      consult
      embark-consult

      # UI / Appearance
      catppuccin-theme
      gruvbox-theme
      doom-modeline
      nerd-icons
      all-the-icons
      highlight-indent-guides
      rainbow-mode
      smartparens

      # Dashboard
      dashboard
      async

      # Tree-sitter
      (treesit-grammars.with-grammars (
        grammars: with grammars; [
          tree-sitter-c
          tree-sitter-go
          tree-sitter-gomod
          tree-sitter-nix
          tree-sitter-rust
        ]
      ))
      nix-ts-mode
      nushell-ts-mode

      # C
      ccls

      # Golang
      go-mode
      ob-go

      # Rust
      rustic
      ob-rust

      # Nix
      nix-mode
      ob-nix

      # File Manager
      dirvish
    ];
}
