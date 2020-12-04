(use-package evil
  :ensure t
  :init
  (evil-mode 1)
  :config
  (setq evil-cross-lines t
        evil-search-module 'isearch
        evil-want-find-undo t
        evil-ecs-delay 0.1)


  :bind
  (:map evil-visual-state-map
        ("TAB" . indent-for-tab-command))

  (:map evil-normal-state-map
        ("SPC b" . ibuffer-jump-to-buffer)
        ("SPC d" . dired)
        ("SPC l" . ibuffer-list-buffers)
        ("SPC w" . save-buffer)
        ("SPC k" . kill-this-buffer)
        ("SPC r" . consel-recentf))
  )
