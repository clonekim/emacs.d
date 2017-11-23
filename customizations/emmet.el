(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; マークアップ言語全部で使う
(add-hook 'css-mode-hook  'emmet-mode) ;; CSSにも使う

(add-hook 'emmet-mode-hook (lambda () 
                             (setq emmet-indentation 2)
                             (setq emmet-indent-after-insert nil)
                             )) ;; indent はスペース2個

(add-to-list 'auto-mode-alist '("\\.html?\\'" . emmet-mode))
(add-to-list 'auto-mode-alist '("\\.ftl\\'" . emmet-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . emmet-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . emmet-mode))
(eval-after-load "emmet-mode"
  '(progn
     (setq emmet-preview-default 1)
     (define-key emmet-mode-keymap (kbd "C-j") nil))
  )

(keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
(define-key emmet-mode-keymap (kbd "H-i") 'emmet-expand-line) ;; C-i で展開
