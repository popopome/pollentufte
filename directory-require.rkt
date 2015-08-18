#lang racket/base

(require racket/file setup/xref scribble/xref rackunit racket/string)
(require txexpr sugar/coerce)
(require pollen/decode pollen/tag)

(provide (all-defined-out))


(define (root . items)
  (decode `(decoded-root ,@items)
          #:txexpr-elements-proc (compose1 detect-paragraphs)
          #:string-proc (compose1 smart-quotes smart-dashes)
          )
  )


#|
Tag functions
|#

(define article-tag 'article)
(define (article . xs) `(,article-tag ,@xs))

(define title-tag `h1)
(define (title . xs) `(,title-tag ,@xs))

(define subtitle-tag `p)
(define subtitle-class "subtitle")
(define (subtitle . xs) `(,subtitle-tag ((class ,subtitle-class)) ,@xs))

(define section-tag `section)
(define (section . xs) `(,section-tag ,@xs))

(define heading-tag 'h2)
(define (heading . xs) `(,heading-tag ,@xs))

(define subheading-tag 'h3)
(define (subheading . xs) `(,subheading-tag ,@xs))

(define newthought-tag `span)
(define newthought-class "newthought")
(define (newthought . xs) `(,newthought-tag ((class ,newthought-class))
                                            ,@xs
                                            ))

(define sans-tag `span)
(define sans-class "sans")
(define (sans . xs) `(,sans-tag ((class ,sans-class))
                                ,@xs
                                ))


(define sn-tag `span)
(define sn-label-tag `label)
(define sn-check-tag `input)
(define sn-note-tag `span)
(define (sn . xs)
  (let ([snid (number->string (current-milliseconds))])
    `(,sn-tag (,sn-label-tag ((for ,snid) (class "margin-toggle sidenote-number")))
              (,sn-check-tag ((type "checkbox")
                              (id ,snid)
                              (class "margin-toggle")))
              (,sn-note-tag ((class "sidenote"))
                            ,@xs)
              ))
  )


(define mn-tag `span)
(define mn-label-tag `label)
(define mn-check-tag `input)
(define mn-note-tag `span)
(define (mn . xs)
  (let ([mnid (number->string (current-milliseconds))])
    `(,mn-tag (,mn-label-tag ((for ,mnid) (class "margin-toggle"))
                             &#8853\;)
              (,mn-check-tag ((type "checkbox")
                              (id ,mnid)
                              (class "margin-toggle")))
              (,mn-note-tag ((class "marginnote"))
                            ,@xs)
              ))
  )


(define figure-tag `figure)
(define (figure . xs)
  `(,figure-tag (figurecaption ,@xs))
  )

(define (figurefull . xs)
  `(,figure-tag ((class "fullwidth"))(figurecaption ,@xs))
  )

(define (imgsrc srcurl)
  `(img ((src ,srcurl)))
  )

(define (code . xs)
  `(span ((class "code")) ,@xs))
(define (codeblock . xs)
  `(pre ((class "code")) ,@xs)
  )

(define (href x)
  `,x
  )
(define (a href . xs)
  `(a ((href ,href)) ,@xs))



