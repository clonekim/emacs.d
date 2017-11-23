(require 'neotree)

(defun neotree-project-dir ()
  "Open NeoTree using the git root."
  (interactive)
  (let ((file-name (buffer-file-name)))
    (if file-name
        (progn
          (neotree-find file-name))
      (message "Could not find git project root."))))

(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "C-c C-p") 'neotree-project-dir)
