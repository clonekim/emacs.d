(require 'web-mode)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook (lambda ()
                           (setq web-mode-enable-auto-pairing t)
                           (setq web-mode-markup-indent-offset 2)
                           (setq web-mode-css-indent-offset 2)
                           (setq web-mode-code-indent-offset 2)
                           (setq web-mode-enable-current-element-highlight t)
                           (setq web-mode-enable-current-column-highlight t)
                           (setq web-mode-ac-sources-alist
                                 '(("css" . (ac-source-css-property))
                                   ("html" . (ac-source-words-in-buffer ac-source-abbrev))))))

(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[aj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ftl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

