;;----------------------------------------------------------------------------
;; Multi Term
;;----------------------------------------------------------------------------
(unless (package-installed-p 'multi-term)
  (package-install 'multi-term))

(require 'multi-term)
(setq multi-term-program "/bin/bash")
