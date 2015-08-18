#lang pollen

◊article{
◊title{Tufte CSS}
◊subtitle{Sample documentation}

◊section{
◊heading{Usage}

◊newthought{Beautiful documentation} comes to here. ◊a{◊href{http://www.google.com} ◊code{Tufte.css}} provides useful tools to create the document. The tool provides several useful markups to decorate a document in semantics. ◊sn{This is sidenote why there is no sidenote} is required ◊sans{Some text is  sans}

◊code{itself indicates start point of markup}

There are margin note ◊mn{Check margin note, the note is a little bit higher than } which is useful not disturbing reading flow. 

Figure is ◊figure{◊imgsrc{https://dl.dropboxusercontent.com/u/254812/5fan-logo-66.png} Figure a b cdefg}

A margin note may have figure inside its area. ◊mn{This is a margin note with figure ◊figure{◊imgsrc{https://dl.dropboxusercontent.com/u/254812/5fan-logo-66.png} Figure for fivefan logo}}

Where is margin◊mn{Margin note please ◊imgsrc{https://dl.dropboxusercontent.com/u/254812/5fan-logo-66.png} This one looks awesome.} note. 

Figure can be placed with fulllength. ◊figurefull{◊imgsrc{https://dl.dropboxusercontent.com/u/254812/7.jpg} And there is also cpation alongside with figure }. 
}

◊section{
◊heading{Code}
Code can also be written in ◊newthought{TufteCSS}. Use ◊code{code tag}. Thanks

◊codeblock{
;; tufte.css
(defun)
}

}

}
