;;----------------------------------------------------------------------------
;; Magit
;;----------------------------------------------------------------------------
(use-package magit
  :ensure t
  :bind (("C-x g" . magit-status )))


;;----------------------------------------------------------------------------
;; Git gutter & Fringe
;;----------------------------------------------------------------------------
(use-package git-gutter
  :ensure t
  :init
  (use-package git-gutter-fringe :ensure t)
  (setq-default left-fringe-width  20)
  (setq-default right-fringe-width 20)
  (set-face-foreground 'git-gutter-fr:modified "yellow")
  (set-face-foreground 'git-gutter-fr:added    "blue")
  (set-face-foreground 'git-gutter-fr:deleted  "white")
  (setq git-gutter:window-width 2)
  (setq git-gutter:unchanged-sign " ")
  (global-git-gutter-mode +1))
