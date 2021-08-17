(use-package lsp-mode
  (add-hook 'lsp-mode-hook 'lsp-enable-which-key-integration)
  (add-hook 'prog-mode-hook 'lsp))

(use-package lsp-treemacs)
