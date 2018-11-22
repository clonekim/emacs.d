(require 'web-mode)

(add-hook 'web-mode-hook (lambda ()
                           (setq web-mode-enable-auto-pairing nil)
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-css-indent-offset 2)
                           (setq web-mode-code-indent-offset 2)
                           (setq web-mode-enable-current-element-highlight t)
                           (setq web-mode-enable-current-column-highlight t)))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[aj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
;;(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

