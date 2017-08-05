;; Configure scheme

(require 'cmuscheme)
(setq scheme-program-name "scheme")
;; bypass the interactive question and start the default interpreter
(defun scheme-proc ()
  "Return the current Scheme process, starting one if necessary."
  (unless (and scheme-buffer
               (get-buffer scheme-buffer)
               (comint-check-proc scheme-buffer))
    (save-window-excursion
      (run-scheme scheme-program-name)))
  (or (scheme-get-process)
      (error "No current process. See variable `scheme-buffer'")))
(defun scheme-split-window ()
  (cond
   ((= 1 (count-windows))
    (delete-other-windows)
    (split-window-vertically (floor (* 0.68 (window-height))))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window 1))
   ((not (find "*scheme*"
               (mapcar (lambda (w) (buffer-name (window-buffer w)))
                       (window-list))
               :test 'equal))
    (other-window 1)
    (switch-to-buffer "*scheme*")
    (other-window -1))))
(defun scheme-send-last-sexp-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-last-sexp))
(defun scheme-send-definition-split-window ()
  (interactive)
  (scheme-split-window)
  (scheme-send-definition))

(add-hook 'scheme-mode-hook
          (lambda ()
            (paredit-mode 1)
            (define-key scheme-mode-map (kbd "<f5>") 'scheme-send-last-sexp-split-window)
            (define-key scheme-mode-map (kbd "<f6>") 'scheme-send-definition-split-window)))

;; Windows numbering mode
(window-numbering-mode 1)

;; Windows spliting hotkey
(defun split-three-windows-and-shell ()
  "Split Emacs to -| and run shell on window-2."
  (interactive)
  (sanityinc/toggle-delete-other-windows)
  (split-window-horizontally)
  (select-window-1)
  (split-window-vertically)
  (projectile-run-shell)
  (previous-buffer))

(defun split-four-windows ()
  "Split Emacs to -|-."
  (interactive)
  (sanityinc/toggle-delete-other-windows)
  (split-window-horizontally)
  (split-window-vertically)
  (select-window-3)
  (split-window-vertically))



;; Debug mode
;; (toggle-debug-on-quit)
(toggle-debug-on-error)


(provide 'configuration)
