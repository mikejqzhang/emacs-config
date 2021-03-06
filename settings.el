(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("1d079355c721b517fdc9891f0fda927fe3f87288f2e6cc3b8566655a64ca5453" "34ed3e2fa4a1cb2ce7400c7f1a6c8f12931d8021435bad841fdc1192bd1cc7da" default))
 '(evil-undo-system 'undo-tree)
 '(package-selected-packages
   '(helm-bibtexkey undo-tree dashboard org-roam-server ivy-bibtex org-roam-bibtex org-ref evil-magit base16-theme treemacs evil-org helm evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(use-package evil)
(use-package base16-theme )
(use-package eradio)
(use-package evil-org )
(use-package evil-org-agenda )
(use-package helm )
(use-package treemacs )
(use-package evil-leader )
(use-package evil-magit )
(use-package org-roam-server )
(use-package org-roam-bibtex)
(use-package org-bullets)
(use-package olivetti)
(use-package helm-bibtex)
(use-package evil-org-agenda)
(use-package org)
(use-package ivy)
(use-package magit)
(use-package undo-tree)
(use-package org-roam
    :after org
    :hook (org-mode . org-roam-mode)
    :custom
    (org-roam-directory "/home/garrett/org-roam/")
    :bind
    ("C-c n l" . org-roam)
    ("C-c n t" . (lambda () (interactive) (find-file "~/org-roam/20201020103239-daily.org")))
    ("C-c n f" . org-roam-find-file)
    ("C-c n i" . org-roam-insert)
    ("C-c n b" . org-roam-buffer-activate)
    ("C-c n c" . org-roam-capture)
    ("C-c n g" . org-roam-show-graph))
(defun org-roam/init-org-roam-bibtex ()
(use-package org-roam-bibtex
    :after org-roam
    :hook (org-roam-mode . org-roam-bibtex-mode)
    :bind (:map org-mode-map
    (("C-c n a" . orb-note-actions)))))
(use-package dashboard :ensure t :config (dashboard-setup-startup-hook))

(evil-mode 1)
(with-eval-after-load 'evil-maps (define-key evil-motion-state-map (kbd "RET") nil))
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(evil-org-agenda-set-keys)
(evil-leader/set-key
	"m a" 'org-agenda
	"f s" 'save-buffer
	"<SPC>" 'execute-extended-command
	"g s" 'magit-status-here
	"b b" 'helm-recentf
	"w d" 'evil-window-delete
	"w v" 'evil-window-vsplit
	"t l" 'toggle-truncate-lines
	"m i c" 'org-ref-helm-insert-cite-link
	"b n" 'next-buffer
	"b p" 'previous-buffer
	"r p" 'eradio-play
	"r s" 'eradio-stop
	"<right>" 'tab-bar-switch-to-next-tab
	"<left>" 'tab-bar-switch-to-prev-tab
	"<up>" 'tab-bar-new-tab
	"<down>" 'tab-bar-close-tab
	"p t" 'treemacs)

(setq org-todo-keywords
	    '((sequence "TODO" "INPROGRESS" "WAITING" "|" "DONE")))
    (setq org-todo-keyword-faces
	    '(("TODO" . "red") ("INPROGRESS" . "orange") ("WAITING" . (:foreground "blue" :weight bold))))
(setq org-ellipsis "  ")
(add-hook 'org-mode-hook 'evil-org-mode)

(setq org-agenda-block-separator (string-to-char " "))
(setq org-deadline-warning-days 0)
(setq org-agenda-custom-commands '(("a" "Garrett's Plan"
    ((agenda "" ((org-agenda-span 14)))))))
(global-set-key (kbd "C-c a") 'org-agenda)
(setq org-agenda-files (list "/home/garrett/org-roam/20200915220906-topobaric.org"
    "/home/garrett/org-roam/20200930130018-school.org" 
    "/home/garrett/org-roam/20201002151401-argo_moc.org"
    "/home/garrett/org-roam/20201020103239-daily.org"
    "/home/garrett/org-roam/20201008200919-deep_inverse_modeling.org"
    "/home/garrett/org-roam/20200915230739-gradapps.org"))
'(org-agenda-prefix-format "   %-6:c ~>  ")
'(org-agenda-show-all-dates nil)
'(org-agenda-skip-timestamp-if-deadline-is-shown t)
'(org-agenda-todo-ignore-with-date t)

(setq org-roam-completion-system 'ivy)
(defconst org-roam-packages
 '(org-roam org-roam-bibtex))

(setq dashboard-items '((recents . 10)))
(setq dashboard-set-footer nil)
(setq dashboard-center-content t)
(setq dashboard-set-init-info nil)

(setq org-ref-default-bibliography (list "/home/garrett/Zotero/library.bib")
    org-ref-get-pdf-filename-function 'org-ref-get-pdf-filename-helm-bibtex)
(setq bibtex-completion-bibliography (list "/home/garrett/Zotero/library.bib")
			bibtex-completion-pdf-field "file")

;; (add-hook 'org-mode-hook 'variable-pitch-mode)
;; (add-hook 'org-agenda-finalize-hook 'variable-pitch-mode)
 (add-hook 'text-mode-hook 'olivetti-mode)
 (add-hook 'org-mode-hook 'olivetti-mode)
 (add-hook 'org-agenda-finalize-hook 'olivetti-mode)
 (defun org-line-wrap () (setq-local word-wrap nil))

 (add-hook 'org-mode-hook 'org-line-wrap)
 (add-hook 'org-mode-hook 'org-bullets-mode)
 (setq olivetti-body-width 80)

(setq eradio-channels '(("def con - soma fm" . "https://somafm.com/defcon256.pls")
                      ("cafe - lainon"     . "https://lainon.life/radio/cafe.ogg.m3u")
                      ("deep space one"     . "http://somafm.com/m3u/deepspaceone130.m3u")
                      ("7 inch soul"     . "http://somafm.com/m3u/7soul130.m3u")
		      ("left coast 70s" . "http://somafm.com/m3u/seventies130.m3u")
		      ("jazz24" . "https://live.wostreaming.net/playlist/ppm-jazz24aac256-ibc1.m3u")))

(ivy-mode 1)
(global-display-line-numbers-mode)
(global-undo-tree-mode)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq org-return-follows-link t)
(add-to-list 'default-frame-alist
	    '(font . "Source Code Pro"))
