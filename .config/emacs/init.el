;; disable tool bar
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(setq-default truncate-lines t)
;; Windows will not respect default-directory if the startup screen is enabled
(setq inhibit-startup-message t)
;; Set the default directory that emacs should launch in to $HOME
(setq default-directory (getenv "HOME"))

;; Disable xxx~ backup files
(setq make-backup-files nil)

;; Fix temp directory on Windows
(when (eq system-type 'windows-nt)
    (setq temporary-file-directory
      (concat (getenv "HOME") "/AppData/Local/Temp/Emacs/")))

;; Make autosave work like in every other editor
(auto-save-visited-mode)

;; Show Line Numbers
(global-display-line-numbers-mode t)
(setq display-line-numbers 'relative)

;; Highlight cursor row
(hl-line-mode)

;; Enable loading themes from .emacs.d/themes
(add-to-list 'custom-theme-load-path (concat (getenv "HOME") "/.config/emacs/themes"))

;; Enable MELPA for package.el
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(setq refreshed-packages nil)

;; Package Installation wrapper, don't contact MELPA if all packages are already installed or MELPA metadata is already fetched
(defun ensure-installed (package)
  (interactive "The package to install: ")
  (unless (package-installed-p package)
    (unless refreshed-packages
    (setq refreshed-packages t)
    (package-refresh-contents))
    (package-install package)))

;; theme
(ensure-installed 'atom-one-dark-theme)
(require 'atom-one-dark-theme)
(load-theme 'atom-one-dark t)

;; impatient
(ensure-installed 'impatient-mode)
(require 'impatient-mode)
(defun markdown-html (buffer)
(princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://ndossougbe.github.io/strapdown/dist/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
(current-buffer)))

;; evil-mode
(ensure-installed 'evil)
(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

;; magit
(ensure-installed 'magit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(impatient-mode neotree magit evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
