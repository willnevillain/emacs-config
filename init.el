;; Emacs config

;; ------------------------------------
;; Required package installation
;; ------------------------------------

;; Add package repositories
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)
(package-refresh-contents)

;; Basic TLS security checks
(setq tls-checktrust t)
(setq gnutls-verify-error t)
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

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
 '(custom-safe-themes
   (quote
    ("7f6d4aebcc44c264a64e714c3d9d1e903284305fd7e319e7cb73345a9994f5ef" default)))
 '(package-selected-packages
   (quote
    (nord-theme exec-path-from-shell helpful elfeed dockerfile-mode json-mode yaml-mode fish-mode company-restclient restclient rainbow-delimiters paredit cider clojure-mode npm-mode prettier-js web-beautify web-mode rjsx-mode js2-refactor js2-mode pyvenv helm-lsp company-lsp lsp-ui lsp-mode helm-projectile flycheck helm-ag ag helm-flx flx org-projectile org-bullets ox-gfm magit all-the-icons solarized-theme dracula-theme gruvbox-theme color-theme-sanityinc-tomorrow better-defaults benchmark-init auto-compile diminish use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
