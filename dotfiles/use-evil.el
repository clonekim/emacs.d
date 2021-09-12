(use-package evil-leader
  :after evil
  :config (global-evil-leader-mode))

(use-package evil
  :init
  (evil-mode 1)
  :bind (:map evil-insert-state-map
              ("TAB" . indent-for-tab-command)

         :map evil-visual-state-map
;             ("<up>" . drag-stuff-up)
;             ("<down>" . drag-stuff-down)
             ("C-;" . iedit-mode)

         :map evil-normal-state-map
         ("k" . evil-previous-visual-line)
         ("j" . evil-next-visual-line)
;         ("<up>" . drag-stuff-up)
;         ("<down>" . drag-stuff-down)
         ("C-;" . iedit-mode)
         ("TAB" . indent-for-tab-command))

 :config
  (setq evil-cross-lines t
        evil-search-module 'evil-search
        evil-want-find-undo t
        evil-ecs-delay 0.1
        evil-default-cursor t
        evil-shift-width 1
        evil-shift-round nil)


  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "TAB" 'previous-buffer
    "d"  'dired
    "bb" 'helm-mini
    "bk" 'kill-this-buffer
    "bw" 'save-buffer
    "1" 'winum-select-window-1
    "2" 'winum-select-window-2
    "3" 'winum-select-window-3
    "4" 'winum-select-window-4
    "5" 'winum-select-window-5
    "6" 'winum-select-window-6
    "7" 'winum-select-window-7
    "8" 'winum-select-window-8
    "9" 'winum-select-window-9
    "gs" 'magit-status
    "sb" 'helm-occur
    "ss" 'helm-swoop
    "sS" 'helm-multi-swoop-all
    "w/" 'split-window-right
    "w-" 'split-window-below
    "wm" 'delete-other-windows
    "ww" 'other-window
    "wd" 'delete-window
    "w=" 'balance-windows
    "u"  'undo-tree-visualize
    "ha" 'helm-ag
    "hA" 'helm-ag-project-root
    "hp" 'helm-projectile
    "fj" 'dired-jump
    "fr" 'helm-recentf
    "ff" 'helm-find-files
    "fs" 'save-buffer
    )

  (with-current-buffer "*Messages*"
    (evil-leader-mode t))


  )
