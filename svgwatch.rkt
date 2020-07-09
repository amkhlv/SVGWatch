#lang racket/gui

(require 
         racket/cmdline
         racket/class
         racket/path
         racket/date
         racket/format
         racket/match
         file-watchers
         json
         rsvg)

(define wait-before-reacting (make-parameter "250"))
(define rest-after-activity (make-parameter "500"))
(define dir-to-watch
  (command-line
   #:program "svgwatch"
   #:once-each
   [("-w" "--wait")
    w
    ((format "Wait milliseconds before loading SVG after detecting its change (default ~a)" (wait-before-reacting)))
    (wait-before-reacting w)]
   [("-s" "--sleep")
    s
    ((format "Sleep milliseconds after each update (default ~a)" (rest-after-activity)))
    (rest-after-activity s)]
   #:args (path-to-SVG-directory)
   path-to-SVG-directory)
  )

(define svgfile #f)

(define bitmap #f)

(define time-of-last-change 0)

(define window
  (new frame%
       [label dir-to-watch]
       [width 400]
       [height 300]))

(define vert
  (new vertical-pane%
       [parent window]
       ))

(define canvas
  (new canvas%
       [parent vert]
       [paint-callback
        (lambda (can dc)
          (when bitmap (send dc draw-bitmap bitmap 0 0))
          )]))


(define (reload-svg p)
  (displayln "-- reloading SVG: ")
  (displayln p)
  (when (and
         ((string-length p) . > . 3)
         (equal? ".svg" (substring p (- (string-length p) 4)))
         (< (+ (string->number (rest-after-activity)) time-of-last-change) (current-inexact-milliseconds))
         )
    (sleep (/ (string->number (wait-before-reacting)) 1000))
    (with-handlers ([exn:fail? (lambda (e)
                                 (displayln "=== got an SVG error ===")
                                 (displayln e)
                                 )
                               ])
      (set! svgfile p)
      (set! bitmap (load-svg-from-file p))
      (set! time-of-last-change (current-inexact-milliseconds))
      (send canvas min-client-width (send bitmap get-width))
      (send canvas min-client-height (send bitmap get-height))
      (send window refresh)
      )
    )
  )
(define watcher
  (watch
   `(,(string->path dir-to-watch))
   (lambda (ev)
     (match ev
       [(list m 'add p)
        (displayln "== added ==")
        (reload-svg (path->string p))
        ]
       [(list m 'change p)
        (displayln "== modified ==")
        (reload-svg (path->string p))
        ]
       [x (displayln "== unknown ==") (displayln x)]
       )
     )
   )
  )

(send window show #t)
