(add-to-list 'load-path "/usr/local/go/bin")
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/dougm/goflymake"))

(require 'go-mode)
(require 'go-flycheck)
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'company-go)



(add-hook 'go-mode-hook 'flycheck-mode)
(add-hook 'go-mode-hook (lambda ()

                          (let ((map go-mode-map))
                            (define-key map (kbd "C-c C-a") 'go-import-add)
                            (define-key map (kbd "C-c C-u") 'go-remove-unused-imports)
                            (define-key map (kbd "C-c C-g") 'go-goto-imports)
                            (define-key map (kbd "C-c C-f") 'gofmt)
                            (define-key map (kbd "C-c r")   'go-run)
                            (define-key map (kbd "C-h f")   'godoc-at-point)
                            (define-key map (kbd "M-.")     'godef-jump)
                            (define-key map (kbd "M-,")     'pop-tag-mark))

                          (add-hook 'before-save-hook 'gofmt-before-save nil t)

                          (set (make-local-variable 'company-backends) '(company-go))
                          (go-eldoc-setup)
                          (subword-mode +1)))

(add-hook 'go-mode-hook (lambda()
                          (company-mode)
                          (setq company-transformers '(company-sort-by-backend-importance))
                          (setq company-idle-delay 0)
                          (setq company-minimum-prefix-length 3)
                          (setq company-selection-wrap-around t)
      (setq completion-ignore-case t)
      (setq company-dabbrev-downcase nil)
      (global-set-key (kbd "C-M-i") 'company-complete)
      (define-key company-active-map (kbd "C-n") 'company-select-next)
      (define-key company-active-map (kbd "C-p") 'company-select-previous)
      (define-key company-active-map (kbd "C-s") 'company-filter-candidates)
      (define-key company-active-map [tab] 'company-complete-selection)
      (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)))

(require 'flycheck-pos-tip)
(eval-after-load 'flycheck
  '(custom-set-variables
   '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))
