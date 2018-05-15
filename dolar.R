library(ggplot2)
library(lubridate) # for working with dates
library(scales)   # to access breaks/formatting functions
library(plotly)

dolar <- read.table("CotizacionesBCRA.csv", sep = "\t", header = TRUE)

dolar$fecha <- as.Date(dolar$fecha, "%d/%m/%Y")


p <- ggplot(dolar, aes(x = fecha, y = valor)) + geom_line(color = "#00AFBB", size = 2) +
     scale_x_date(name="Fecha", breaks = date_breaks("2 months") ) + 
      theme(axis.text.x = element_text(angle = 90, hjust = 1))
p
p2 <- ggplotly(p)
p2