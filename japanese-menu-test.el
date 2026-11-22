;;; japanese-menu-test.el --- tests for japanese-menu  -*- lexical-binding: t; -*-

(require 'ert)
(require 'cl-lib)
(require 'japanese-menu)

(defun japanese-menu-test--strings (tree)
  "Collect all strings in TREE, without descending into cycles."
  (let ((seen (make-hash-table :test 'eq)) (acc nil))
    (cl-labels ((walk (x)
                  (cond ((stringp x) (push x acc))
                        ((and (consp x) (not (gethash x seen)))
                         (puthash x t seen)
                         (walk (car x))
                         (walk (cdr x))))))
      (walk tree))
    acc))

(ert-deftest japanese-menu-translates-menubar ()
  (japanese-menu-setup)
  (japanese-menu-translate-global-menubar)
  (let ((strs (japanese-menu-test--strings (lookup-key global-map [menu-bar]))))
    (should (cl-some (lambda (s) (string-match-p "[ぁ-んァ-ヶ一-龠]" s)) strs))))

(ert-deftest japanese-menu-dictionary-has-customize ()
  (should (equal (cdr (assoc "Customize" japanese-menu-label->jp)) "カスタマイズ")))

(ert-deftest japanese-menu-no-conflicting-duplicates ()
  "Same English key must not map to different Japanese labels."
  (let ((seen (make-hash-table :test 'equal)) conflicts)
    (dolist (e japanese-menu-label->jp)
      (when (consp e)
        (let ((old (gethash (car e) seen)))
          (if (and old (not (equal old (cdr e))))
              (push (car e) conflicts)
            (puthash (car e) (cdr e) seen)))))
    (should-not conflicts)))

(provide 'japanese-menu-test)
;;; japanese-menu-test.el ends here
