(use-package js2-mode
  :mode "\\.js\\'"
  :config
  (setq-default js-indent-level 2)
  (setq-default js2-ignored-warnings '("msg.extra.trailing.comma")))


(use-package web-mode
  :mode
  ("\\.hbs\\'"
   "\\.tsx?\\'"
   "\\.mustache\\'"
   "\\.html?\\'"
   "\\.php\\'"
   "\\.vue\\'")
  :config
  (setq web-mode-enable-auto-pairing t
        web-mode-enable-auto-closing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight nil
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2))


(use-package emmet-mode
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
  :hook
  ((web-mode . emmet-mode)
   (sgml-mode . emmet-mode)
   (css-mode . emmet-mode)))

