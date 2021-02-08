;;-----------------------------------------------------------------------------
;; Ivy
;;-----------------------------------------------------------------------------

(use-package ivy
  :diminish (ivy-mode . "") ; does not display ivy in the modeline
  :init (ivy-mode 1)        ; enable ivy globally at startup
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-d" . ivy-switch-buffer-kill))

  :config
  (setq ivy-use-virtual-buffers t)   ; extend searching to bookmarks and …
  (setq ivy-height 30)               ; set height of the ivy window
  (setq ivy-count-format "(%d/%d) ") ; count format, from the ivy help page
  )

(use-package counsel
  :bind                                ; load counsel when pressed
  (("M-x"     . counsel-M-x)           ; M-x use counsel
   ("C-x C-f" . counsel-find-file)     ; C-x C-f use counsel-find-file
   ("C-x C-r" . counsel-recentf)       ; search recently edited files
   ("C-c f"   . counsel-git)           ; search for files in git repo
   ("C-c s"   . counsel-git-grep)      ; search for regexp in git repo
   ("C-c l"   . counsel-locate)) ; search for files or else using locate
  )
