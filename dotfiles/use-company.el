(use-package company
  :diminish company-mode
  :commands (company-complete company-mode)
  :bind (([remap dabbrev-expand] . company-complete)
         :map prog-mode-map
         ([tab] . company-indent-or-complete-common))
  :init (if (fboundp 'evil-declare-change-repeat)
            (mapc #'evil-declare-change-repeat
                  '(company-complete-common
                    company-select-next
                    company-select-previous
                    company-complete-selection
                    company-complete-number)))
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (use-package company-statistics
    :disabled
    :init
    (company-statistics-mode))
  (setq company-idle-delay 0)
  (setq company-show-numbers "on")
  (add-hook 'prog-mode-hook 'company-mode))
