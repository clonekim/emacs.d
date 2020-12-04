(use-package company
  :ensure t
  :config
  (setq company-transformers  '( company-sort-by-backend-importance ))  ;; 정렬 순서
  (setq company-idle-delay  0)  ; 기본값은 0.5
  (setq company-minimum-prefix-length  3)  ; 기본 4
  (setq company-selection-wrap-around  t)  ; 후보의 하단에서 더 아래에 가려고하면 가장 위로
  (setq completion-ignore-case  t)
  (setq company-dabbrev-downcase  nil)
  (global-company-mode t)
  :bind (:map company-active-map
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous))
  )
