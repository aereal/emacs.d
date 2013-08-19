(setq el-get-dir (expand-file-name "~/.emacs.d/elisp/el-get/"))

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(require 'el-get)
(setq my/el-get-packages
      '(
        smartchr
        ))
(el-get 'sync my/el-get-packages)
