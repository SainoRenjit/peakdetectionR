#' This function to determine where a peak or bottom points is located  in a time series, from beginning to end.
#'
#' @title Peak Detection
#'
#' @description Find peak and bottom points of a time series signal.
#'
#' @param x Input signal
#'
#' @param m minimum peak-to-peak separation distance ( in indices)
#'
#' @examples t<-seq(0,1,.001)
#'
#' @examples x<-sin(2*pi*20*t)
#'
#' @examples peak_DETE(x, 30)
#'
#' @examples peak_DETE(-x, 30)
#'
#' @examples ## Not run:
#'
#' @examples t<-seq(0,1,.001)
#' @examples x<-sin(2*pi*20*t)
#' @examples plot(x, type="l", col="navy")
#' @examples peaks <- peak_DETE(x, 30)
#' @examples bottom<- peak_DETE(-x, 30)
#' @examples points(peaks,x[peaks],pch=19,col=2)
#' @examples points(bottom,x[bottom],pch=19,col=3)
#'
#' @examples ## End(Not run)
#'
#' @return Array representing  peak points
#'
#' @import wmtsa
#'
#' @export peak_DETE
#'
#'
peak_DETE<- function (x,m){

  thresh <- seq(1,20,length=20)
  ws <- lapply(thresh, function(k,x) wavShrink(x, wavelet="s8",shrink.fun="hard", thresh.fun="universal",
                                               thresh.scale=k, xform="modwt"), x=x)
  ecgvalue <- ws[[3]][1:length(ws[[3]])]
  input<-ecgvalue
  #-------------------------------------------------------------
   # input<-x
  shape <- diff(sign(diff(input, na.pad = FALSE)))
  pks <- sapply(which(shape < 0), FUN = function(i6){
    z <- i6 - m + 1
    z <- ifelse(z > 0, z, 1)
    w <- i6 + m + 1
    w <- ifelse(w < length(input), w, length(input))
    if(all(input[c(z : i6, (i6 + 2) : w)] <= input[i6 + 1])) return(i6 + 1) else return(numeric(0))
  })
  pks <- unlist(pks)
  return(pks)
}
