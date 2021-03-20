(use-package web-mode
  :ensure t
  :mode
  ("\\.js?\\'"
   "\\.hbs\\'"
   "\\.mustache\\'"
   "\\.html?\\'"
   "\\.php\\'"
   "\\.vue\\'" )
  :config
  (setq js-indent-level 2
        web-mode-enable-auto-pairing t
        web-mode-enable-auto-closing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight nil
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)
  )

(use-package emmet-mode
  :ensure t
  :defer t
  :config
  (define-key emmet-mode-keymap (kbd "C-j") nil)
  (keyboard-translate ?\C-i ?\H-i)
  (define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line)
  (setq
   emmet-self-closing-tag-style " /"
   emmet-preview-default 1
   emmet-indent-after-insert t
   emmet-indentation 2)

  )

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)
