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
    ("947190b4f17f78c39b0ab1ea95b1e6097cc9202d55c73a702395fc817f899393" "8f97d5ec8a774485296e366fdde6ff5589cf9e319a584b845b6f7fa788c9fa9a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" default)))
 '(lsp-ui-peek-always-show t)
 '(lsp-ui-sideline-enable nil)
 '(package-selected-packages
   (quote
    (dracula-theme helpful todoist flycheck ox-gfm helm-ag ag lsp-ivy benchmark-init company-restclient org-projectile ox-md paredit rainbow-delimiters clojure-mode cider lsp-python-ms pyvenv csv-mode org-present exec-path-from-shell better-defaults neotree elfeed dockerfile-mode json-mode yaml-mode fish-mode restclient elpy projectile counsel helm-flx flx epresent org-download org-bullets forge magit all-the-icons nyan-mode gruvbox-theme color-theme-sanityinc-tomorrow auto-compile diminish use-package))))
