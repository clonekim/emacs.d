(use-package which-key
  :ensure t
  :diminish
  :config
  (which-key-mode )
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.1))
