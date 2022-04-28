'''
Code for producing a heat map of reported Ebola bases in the DRC from 2018 - 2020. 
Authors: Devyn Escalanti
University of Central Florida 
Email: dtescalanti@gmail.com
'''

df<-read.csv("Data_ DRC Ebola Outbreak, North Kivu, Ituri and Équateur - MOH-By-Health-Zone.csv")
df$time <- format(as.Date(df$date, "%m/%d/%y"), format = "%m/%y")
df$time <- factor(df$time, levels = (unique(df$time)), ordered=TRUE)

ggplot(df, aes(x = time, y = Nom, fill = total_cases)) +
  geom_tile(color = "white") +
  scale_fill_gradient(low = "cornsilk2", high = "indianred") +
  labs(x = "Date (month/year)", y = "Health Zones") +
  guides(fill = guide_legend(title = "Number of Ebola cases")) +
  theme_minimal() +
  theme(text = element_text(family = "Times New Roman", size = 17)) +
  scale_x_discrete(guide = guide_axis(angle = 65)) +
  labs(
    title = "DRC Ebola Cases by Health Zone: 2018-2020",
    y = "Nord Kivu and Ituri Province Health Zones",
    x = "Date (month/year)",
    caption = "Data source: Humanitarian Data Exchange (2020)"
  )
