;;; package --- Summary:

;;; Commentary:
;;; You can customize your shortcuts here.

;;; Code:

(global-set-key (kbd "C-x t") 'shell)

(global-set-key (kbd "C-x j") 'slime)

(global-set-key (kbd "C-,") 'origami-recursively-toggle-node)

(global-set-key (kbd "C-M-;") 'comment-box) ;

;;; Character bindings

(global-set-key (kbd "C-x \\") "λ")




;;; Rebind paredit
;;; (foo (bar |baz) quux zot)
;;; (foo (bar |baz quux) zot)
(global-set-key (kbd "C-<right>") 'paredit-forward-slurp-sexp)

;;; (foo (bar |baz quux) zot)
;;; (foo (bar |baz) quux zot)

(global-set-key (kbd "C-<left>") 'paredit-forward-barf-sexp)

;;; C-M-<right>, etc. are Unity shortcuts and not avaliable in Emacs.
;;; Use "ESC C-<left>", "ESC C-<right>" instead.

;;; (foo bar (baz| quux) zot)
;;; (foo (bar baz| quux) zot)

(global-set-key (kbd "C-M-<left>") 'paredit-backward-slurp-sexp)

;;; (foo (bar baz |quux) zot)
;;; (foo bar (baz |quux) zot)

(global-set-key (kbd "C-M-<right>") 'paredit-backward-barf-sexp)

(global-set-key (kbd "C-M-,") 'spell-word)

(provide 'extra-shortcuts)

;;; extra-shortcuts.el ends here

