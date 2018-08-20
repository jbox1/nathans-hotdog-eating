# Nathan's Hotdog Eating Contest: Time Series Bar Chart in R
# nathans-hotdog-eating.r
#
# Jesse Bockstedt
# bockstedt.com
# For ISOM 675 Data Visualization, Goizueta Business School, Emory University
#
# Description:
# Tutorial on creating well designed bar charts using ggplot2 using 
# Nathans Hot Dog Eating Contest Data. Based on the example in Nathan
# Yau's book Visualize This: The FlowingData Guide to Design, Visualization
# and Statistics (https://www.amazon.com/Visualize-This-FlowingData-Visualization-Statistics/dp/0470944889)

require(ggplot2)
#Assumes datafile is in the current working directory
hotdogs <- read.csv('hot-dog-contest-winners.csv',sep=',', header=TRUE)
head(hotdogs)

# initial bar chart
p1 <- ggplot(hotdogs, aes(x=Year, y=Dogs.eaten)) + geom_bar(stat="identity")
p1

# highlight years when record was set

p1 <- ggplot(hotdogs, aes(x=Year, y=Dogs.eaten, fill=New.record)) + 
  geom_bar(stat="identity")
p1

# instead of gradient coloring, cast into a factor variable
p1 <- ggplot(hotdogs, aes(x=Year, y=Dogs.eaten, fill=factor(New.record))) + 
geom_bar(stat="identity")
p1

# Start formatting with changes to scales, labels, colors, titles
p1 <- ggplot(hotdogs, aes(x=Year, y=Dogs.eaten, fill=factor(New.record))) + 
  geom_bar(stat="identity") + 
  scale_fill_manual(values = c("#a8a8a8", "#00572e"), guide=FALSE) +
  scale_x_continuous("", breaks=seq(1980,2010,2)) +
  scale_y_continuous("Hot Dogs and Buns (HDB) Eaten", breaks=seq(0,60,10)) +
  labs(title="Hot Dog Eating", subtitle="Nathan's hot fog eating contest every July 4th has been going on since the early 1900s, \nbut it wasn't until 2001 when things got serious. Takeru Kobayashi from Japan raised the bar, \nmore than doubling the previous world record. Highlighted bars indicate new record.", caption="Data source:Wikipedia. \nPlot based on Nathan Yau's similar plot in his book Visualize This!")
p1

# use the extrafont library to have mor control over font formatting
require(extrafont)
loadfonts(device="win")

# finish formatting and add an annotation
p1 + annotate("text", label="In 2001, Takeru Kobayashi gets his \nfirst win in the competition. He went on \nto win five more years in a row.", x = 1995, y = 62, size=3, family="Georgia", hjust=0, lineheight=1) +
  annotate("segment", x=2001, y=56, xend=2001, yend=50, size=0.5 ) + 
  theme_bw() +
  theme(text=element_text(size=12, family="Georgia"), plot.title = element_text(size=20, face="bold"), plot.subtitle=element_text(size=10), plot.caption = element_text(size=8), panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), panel.border = element_blank(), axis.line.x = element_line(colour = "black"), axis.line.y = element_blank())


