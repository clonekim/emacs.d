;;-----------------------------------------------------------------------------
;; helm
;;-----------------------------------------------------------------------------
(use-package helm
  :diminish helm-mode
  :bind (("C-c h" . helm-mini)
         ("C-h a" . helm-apropos)
         ("C-x b" . helm-buffers-list)
         ("M-y" . helm-show-kill-ring)
         ("M-x" . helm-M-x)
         ("C-x f" . helm-find-files)
         ("C-x c o" . helm-occur)
         ("C-x c s" . helm-swoop)
         ("C-x c y" . helm-yas-complete)
         ("C-x c Y" . helm-yas-create-snippet-on-region)
         ("C-x c b" . my/helm-do-grep-book-notes)
         ("C-x c SPC" . helm-all-mark-rings)
         ("C-x C-g" . helm-grep-do-git-grep)
         ("C-x C-o" . ffap))
  :init
  (require 'helm-config)
  (setq helm-candidate-number-limit 100)
  (setq helm-yas-display-key-on-candidate t)
  ;; for pretty fast updates when hitting RET too quickly
  ;; after typing fast:
  (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
        helm-input-idle-delay 0.01  ; this actually updates things
                                        ; reeeelatively quickly.
        helm-quick-update t
        helm-M-x-requires-pattern nil
        helm-ff-skip-boring-files t)
  :config
  (use-package helm-descbinds
    :config (helm-descbinds-mode)))


(use-package helm-lsp)
(use-package helm-swoop)
(use-package helm-ag)
(use-package helm-projectile)

(use-package helm-ls
  (add-hook 'prog-mode-hook  'lsp))

