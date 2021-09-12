(use-package dashboard
  :init
  (setq dashboard-banner-log-title "Emacs Dashboard")
  (setq dashboard-set-navigator t)

  :config
  (dashboard-setup-startup-hook)

  )
