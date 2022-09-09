(require 'package)

  (setq package-archives '(("melpa" . "https://melpa.org/packages/")
			   ("org" . "https://orgmode.org/elpa/")
			   ("elpa" . "https://elpa.gnu.org/packages/")))

  (package-initialize)
  (unless package-archive-contents
   (package-refresh-contents))

  ;; Initialize use-package on non-Linux platforms
  (unless (package-installed-p 'use-package)
     (package-install 'use-package))

  (require 'use-package)
  (setq use-package-always-ensure t)

  (use-package command-log-mode)


    (use-package which-key
    :init (which-key-mode)
    :diminish which-key-mode
    :config
    (setq which-key-idle-delay 0))

(setq split-height-threshold nil) ;split vertically by default
(setq split-width-threshold 160)
  (fset 'yes-or-no-p 'y-or-n-p)

(setq inhibit-startup-screen t)
      (setq initial-scratch-message nil)
      (menu-bar-mode -1)
      (tool-bar-mode -1)
      (tooltip-mode -1)
      (set-fringe-mode 5)        ; Give some breathing room
      (scroll-bar-mode -1)
      (xclip-mode 1)
;;(defalias 'ivy-switch-buffer 'ibuffer); make ibuffer default
    ;; (use-package desktop
    ;;   :defer 2
    ;;   :config
    ;;   (setq desktop-path (list my-savefile-dir))
    ;;   (setq desktop-dirname my-savefile-dir)
    ;;   (setq desktop-restore-eager 5)
    ;;   (setq desktop-load-locked-desktop t)
    ;;   (desktop-save-mode +1))

      (add-to-list 'default-frame-alist '(fullscreen . maximized))
      (load-theme 'modus-vivendi)
      (use-package all-the-icons)
      (delete-selection-mode t)
      (define-key global-map (kbd "<f5>") #'modus-themes-toggle)
      (find-file "~/.emacs.d/george.org") 

      ;;(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
      (add-to-list 'load-path "~/.emacs.d/lisp/")


  (require 'xah-fly-keys)

  ;; specify a layout
  (xah-fly-keys-set-layout "colemak-mod-dh")
  (define-key xah-fly-command-map (kbd "e") 'previous-line)
  (define-key xah-fly-command-map (kbd "n") 'next-line)

  (xah-fly-keys 1)

     (define-key key-translation-map (kbd "ESC") (kbd "C-g")) 


  ;; (defun x-activate-cmd-mode-n-keyboard-quit ()
   ;; "DOCSTRING"
    ;; (interactive)
    ;; (xah-fly-command-mode-activate)
    ;; (keyboard-quit))
  ;; (global-set-key "ESC" 'x-activate-cmd-mode-n-keyboard-quit)

(use-package magit
  :ensure t)

(use-package counsel
    :after ivy
    :config (counsel-mode))
  (use-package ivy
    :defer 0.1
    :diminish
    :bind
    (("C-c C-r" . ivy-resume)
     ("C-x B" . ivy-switch-buffer-other-window))
    :custom
    (setq ivy-count-format "(%d/%d) ")
    (setq ivy-use-virtual-buffers t)
    (setq enable-recursive-minibuffers t)
    :config
    (ivy-mode))
  (use-package ivy-rich
    :after ivy
    :custom
    (ivy-virtual-abbreviate 'full
     ivy-rich-switch-buffer-align-virtual-buffer t
     ivy-rich-path-style 'abbrev)
    :config
    (ivy-set-display-transformer 'ivy-switch-buffer
				 'ivy-rich-switch-buffer-transformer)
    (ivy-rich-mode 1)) ;; this gets us descriptions in M-x.
  (use-package swiper
    :after ivy
    :bind (("C-s" . swiper)
	   ("C-r" . swiper)))

  (use-package projectile
  :diminish projectile-mode
  :config (projectile-mode)
  :custom ((projectile-completion-system 'ivy))
  :bind-keymap
  ("C-c p" . projectile-command-map)
  :init
  ;; NOTE: Set this to the folder where you keep your Git repos!
  (when (file-directory-p "~/Projects/Code")
    (setq projectile-project-search-path '("~/Projects/Code")))
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :config (counsel-projectile-mode))

;;gets rid of ^ at beginning of M-x
(setq ivy-initial-inputs-alist nil)
;; zoom in/out like we do everywhere else.
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; Using garbage magic hack.
 (use-package gcmh
   :config
   (gcmh-mode 1))
;; Setting garbage collection threshold
(setq gc-cons-threshold 402653184
      gc-cons-percentage 0.6)

;; Profile emacs startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (message "*** Emacs loaded in %s with %d garbage collections."
                     (format "%.2f seconds"
                             (float-time
                              (time-subtract after-init-time before-init-time)))
                     gcs-done)))

;; Silence compiler warnings as they can be pretty disruptive (setq comp-async-report-warnings-errors nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
   )
(defun fontify-frame (frame)
  (set-frame-parameter frame 'font "Consolas-13"))
;; Fontify current frame
(fontify-frame nil)
;; Fontify any future frames
(push 'fontify-frame after-make-frame-functions)

(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "<M-S-left>") nil)
       "M-p"   '(org-meta-right :which-key "org-meta-right")
;;(global-set-key (kbd "C-M-<right>") 'org-metaright)
;;(global-set-key (kbd "C-M-<left>") 'org-metaright)

;;org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))


(column-number-mode)
(global-display-line-numbers-mode t)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
