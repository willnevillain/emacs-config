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
 '(package-selected-packages
   (quote
    (counsel helm org-bullets gruvbox-theme dockerfile-mode yaml-mode use-package tagedit spacemacs-theme smex restclient rainbow-delimiters projectile org-plus-contrib neotree magit json-mode jedi ido-completing-read+ fish-mode fill-column-indicator exec-path-from-shell elpy elfeed doom-modeline diminish better-defaults auto-compile))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
