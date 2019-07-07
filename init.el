;; Emacs config

;; ------------------------------------
;; Required package installation
;; ------------------------------------

;; Add package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

;; Basic TLS security checks
(setq tls-checktrust t)
(setq gnutls-verify-error t)

;; Ensure use-package and its deps installed
(mapc
 (lambda (package)
   (if (not (package-installed-p package))
       (progn
         (package-refresh-contents)
         (package-install package))))
 '(use-package diminish bind-key))

(eval-when-compile
  (require 'use-package))
(require 'diminish)
(require 'bind-key)

(org-babel-load-file "~/.emacs.d/configuration.org")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-eighties)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(ivy-mode t)
 '(package-selected-packages
   (quote
    (company-lsp lsp-ui color-theme-sanityinc-tomorrow nyan-mode epresent org-download forge counsel helm org-bullets gruvbox-theme dockerfile-mode yaml-mode use-package tagedit spacemacs-theme smex restclient rainbow-delimiters projectile org-plus-contrib neotree magit json-mode jedi ido-completing-read+ fish-mode fill-column-indicator exec-path-from-shell elpy elfeed doom-modeline diminish better-defaults auto-compile)))
 '(pdf-view-midnight-colors (quote ("#fdf4c1" . "#282828"))))
