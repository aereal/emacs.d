(defalias 'perl-mode 'cperl-mode)

(defun my/perl-smartchr ()
  (interactive)
  (define-key cperl-mode-map (kbd ".") (smartchr '("." "->")))
  (define-key cperl-mode-map (kbd ",") (smartchr '(", " " => " ",")))
  (define-key cperl-mode-map (kbd "~") (smartchr '(" =~ " " !~ " " ~~ " "~"))))

(add-hook 'cperl-mode-hook 'my/perl-smartchr)
