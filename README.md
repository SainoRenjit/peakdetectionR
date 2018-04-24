# peakdetectionR

Find Peak and Bottom Points of a Time Series Signal

## Getting Started

This function to determine where a peak or bottom points is located in a time series, from beginning to end.

### Dependencies

Install the packages from CRAN.

```
install.packages("devtools")

options(unzip="internal")

install.packages("curl")

install.packages("wmtsa")

```

### Installation

After installing the dependacies, clone the repository and run the setup file using the following command.
```
install_github('SainoRenjit/peakdetectionR')
```
Now the package is ready to be used in any python program.

### Example

```
t<-seq(0,1,.001) 
x<-sin(2*pi*20*t) 
plot(x, type="l", col="navy") 
peaks <- peak_DETE(x, 30) 
bottom<- peak_DETE(-x, 30) 
points(peaks,x[peaks],pch=19,col=2) 
points(bottom,x[bottom],pch=19,col=3) 
```
