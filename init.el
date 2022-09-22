(org-babel-load-file
 (expand-file-name
  "george.org"
  user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages
   '(wc-mode helm-core consult orderless vertico marginalia key-chord smooth-scrolling counsel-projectile projectile command-log-mode which-key rainbow-delimiters xclip helpful undo-tree olivetti try all-the-icons ivy-rich counsel swiper magit evil-tutor evil-collection evil use-package))
 '(warning-suppress-types '((use-package) (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)
