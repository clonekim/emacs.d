(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
(add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/dougm/goflymake"))

(require 'direx)
(require 'go-mode)
(require 'go-flymake)
(require 'go-flycheck)
(require 'go-autocomplete)
(require 'auto-complete-config)


(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)

(ac-config-default)

(if (not (string-match "go" compile-command))
    (set (make-local-variable 'compile-command)
         "go build -v && go test -v && go vet"))

(add-hook 'go-mode-hook (lambda ()
                          (go-eldoc-setup)
                          (add-hook 'before-save-hook 'gofmt-before-save)
                          (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)
                          (local-set-key (kbd "C-c C-a") 'go-import-add)
                          (local-set-key (kbd "C-c C-g") 'go-goto-imports)
                          (local-set-key (kbd "C-c C-f") 'gofmt)
                          (local-set-key (kbd "M-.")     'godef-jump)))




