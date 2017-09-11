;;; Setting Oz

;;; This is the setting for mozart-oz 1.4 or former. See: https://mozart.github.io/mozart-v1/doc-1.4.0/opi/index.html

(or (getenv "OZHOME")
    (setenv "OZHOME"
            "c:/Program Files/Mozart"))   ; EDIT OZ PATH HERE
(setenv "PATH" (concat (getenv "OZHOME") "/bin:" (getenv "PATH")))

(setq load-path (cons (concat (getenv "OZHOME") "/share/elisp")
                      load-path))

(setq auto-mode-alist
      (append '(("\\.oz\\'" . oz-mode)
                ("\\.ozg\\'" . oz-gump-mode))
              auto-mode-alist))

(autoload 'run-oz "oz" "" t)
(autoload 'oz-mode "oz" "" t)
(autoload 'oz-gump-mode "oz" "" t)
(autoload 'oz-new-buffer "oz" "" t)

;;; Oz major mode:
;;; 1. oz-mode: load a file with extension .oz automatically puts a buffer into Oz mode
;;; 2. oz-gump-mode: editing Oz code with embedded Gump specifications
;;; 3. oz-mode-hook: a list of functions to be run when one of the Oz modes is activated.

(provide 'init-mozart-oz)
