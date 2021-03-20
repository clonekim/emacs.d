;;----------------------------------------------------------------------------
;; Clojure & CIDER
;;----------------------------------------------------------------------------
(use-package clojure-mode
  :ensure t
  :config
  (use-package flycheck-clojure
    :ensure t
    :after flycheck
    :commands flycheck-clojure-setup
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-clojure-setup))
  (add-hook 'clojure-mode-hook (lambda ()
                                 (setq indent-tabs-mode nil)
                                 (setq clojure-indent-style :always-align)
         (define-clojure-indent
           (defroutes 'defun)
           (GET 2)
           (POST 2)
           (PUT 2)
           (DELETE 2)
           (PATCH 2)
           (HEAD 2)
           (ANY 2)
           (context 2))
         (rainbow-delimiters-mode t)
                                 (paredit-mode t)
                                 (subword-mode t))))

(use-package cider
  :ensure t
  :commands (cider cider-connect cider-jack-in)
  :config
  (add-hook 'cider-mode-hook 'eldoc-mode)
  (add-hook 'cider-repl-mode-hook (lambda ()
            (setq cider-repl-history-file "~/.emacs.d/cider-history")
                                    (turn-on-eldoc-mode)
                                    (paredit-mode t)
                                    (subword-mode t))))
