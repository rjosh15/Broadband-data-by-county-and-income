df1 <- read.csv("est08all.csv")
head(df1)

library(sqldf) 
## To get median income and the var that we need
df1n <- df1[c('State.FIPS','County.FIPS','Postal','Name','Poverty.Percent.All.Ages','Median.Household.Income' )]
colnames(df1)
head(df1n)
## To rename so that on merging with FCC var names are same
library(dplyr)
df1r <- rename(df1n, state = State.FIPS , county = County.FIPS, poverty =  Poverty.Percent.All.Ages, medianincome = Median.Household.Income)
df1r$year <- 2008
head(df1r)

df2 <- read.csv("est09all.csv")
df2n <- df2[c('State.FIPS','County.FIPS','Postal','Name','Poverty.Percent.All.Ages','Median.Household.Income' )]
df2r <- rename(df2n, state = State.FIPS , county = County.FIPS, poverty =  Poverty.Percent.All.Ages, medianincome = Median.Household.Income)
df2r$year <- 2009
head(df2r)

df3 <- read.csv("est10all.csv")
df3n <- df3[c('State.FIPS','County.FIPS','Postal','Name','Poverty.Percent.All.Ages','Median.Household.Income' )]
df3r <- rename(df3n, state = State.FIPS , county = County.FIPS, poverty =  Poverty.Percent.All.Ages, medianincome = Median.Household.Income)
df3r$year <- 2010
head(df3r)

df4 <- read.csv("est11all.csv")
df4n <- df4[c('State.FIPS','County.FIPS','Postal','Name','Poverty.Percent.All.Ages','Median.Household.Income' )]
df4r <- rename(df4n, state = State.FIPS , county = County.FIPS, poverty =  Poverty.Percent.All.Ages, medianincome = Median.Household.Income)
df4r$year <- 2011
head(df4r)

df5 <- read.csv("est12all.csv")
head(df5)
df5n <- df5[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df5r <- rename(df5n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df5r$year <- 2012
head(df5r)

df6 <- read.csv("est13all.csv")
head(df6)
df6n <- df6[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df6r <- rename(df6n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df6r$year <- 2013
head(df6r)

df7 <- read.csv("est14all.csv")
head(df7)
df7n <- df7[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df7r <- rename(df7n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df7r$year <- 2014
head(df7r)

df8 <- read.csv("est15all.csv")
head(df8)
df8n <- df8[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df8r <- rename(df8n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df8r$year <- 2015
head(df8r)

df9 <- read.csv("est16all.csv")
head(df9)
df9n <- df9[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df9r <- rename(df9n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df9r$year <- 2016
head(df9r)

df10 <- read.csv("est17all.csv")
head(df10)
df10n <- df10[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df10r <- rename(df10n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df10r$year <- 2017
head(df10r)

df11 <- read.csv("est18all.csv")
head(df11)
df11n <- df11[c('State.FIPS.Code','County.FIPS.Code','Postal.Code','Name','Poverty.Percent..All.Ages','Median.Household.Income' )]
df11r <- rename(df11n, state = State.FIPS.Code , county = County.FIPS.Code, postal = Postal.Code, poverty =  Poverty.Percent..All.Ages, medianincome = Median.Household.Income)
df11r$year <- 2018
head(df11r)
## Union to get all the values 2008-18

df_final_income <- sqldf("SELECT state, county, poverty, medianincome, year from df1r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df2r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df3r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df4r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df5r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df6r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df7r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df8r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df9r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df10r
                         UNION
                         SELECT state, county, poverty, medianincome, year from df11r;")
                        
head(df_final_income)
df_income_update <- sqldf("SELECT state , county, poverty, medianincome, year from df_final_income where county != 0;")
head(df_income_update)
head(df1r)     

df_updated_population <- read.csv("df_data_final.csv")
head(df_updated_population)
nrow(df_updated_population)
df_updated_population_r <- df_updated_population[-1]

df_final_income_population <- sqldf("SELECT a.* , CAST(IFNULL(b.poverty,0) AS FLOAT) AS poverty_percentage, b.medianincome AS median_income from df_updated_population_r a
                                    LEFT JOIN df_income_update b
                                    ON a.state = b.state
                                    AND a.county = b.county
                                    AND a.year = b.year
                                    GROUP BY 1,2,3,4,5,7,8")   

head(df_final_income_population)
nrow(df_final_income_population)
summary(df_final_income_population$median_income)
summary(df_final_income_population)
df_final_income_population
df_final_income_population$absolute_penetration <- df_final_income_population$ratio*df_final_income_population$est_population
write.csv(df_final_income_population, "df_final_income_population_updated.csv" )
head(df_final_income_population,21)

### Correlation Matrix

df_corr <- read.csv("df_final_income_population_updated.csv")
df_corr <- df_corr[-1]
head(df_corr)
## To change Char value to numeric/float
df_corr$median_income <- gsub(",","",df_corr$median_income)

library(tidyr)

df_corr_updated <- df_corr %>% drop_na(ratio, est_population, poverty_percentage, median_income, absolute_penetration)
nrow(df_corr_updated)


summary(df_corr_updated)
df_corr_updated <- transform(df_corr_updated, median_income = as.numeric(median_income))
colnames(df_corr_updated)
library(sqldf)
df_new <- sqldf("SELECT countycode, state, county, statename, countyname, ratio, month, year, est_population, poverty_percentage, CAST(median_income AS FLOAT) AS median_income, absolute_penetration  FROM df_corr_updated;")
str(df_new)
### Clean data drop NA
df_new <- df_new %>% drop_na(ratio, est_population, poverty_percentage, median_income, absolute_penetration)
summary(df_new)

head(df_corr_updated)
str(df_new)
cor(df_new[c('ratio', 'est_population', 'poverty_percentage', 'median_income', 'absolute_penetration')])

install.packages("corrplot")                      # Install corrplot package
library("corrplot") 
corrplot(cor(df_new[c('ratio', 'est_population', 'poverty_percentage', 'median_income', 'absolute_penetration')], method = "pearson"))    
# Apply corrplot function
### OLS Reg:

lm_model <- lm(df_new$absolute_penetration~df_new$median_income+df_new$est_population+df_new$ratio+df_new$poverty_percentage, dataset = df_new )

summary(lm_model)

head(df_new)
nrow(df_new)

##---------- Validation only code----------

null_df <- sqldf("SELECT distinct state, county FROM df_data_final where est_population is NULL; ")
print(null_df)

check_df <- sqldf("SELECT * FROM df_data_final where county in (201,232,270,280,113,515) and state in (2,46,51); ")
print(check_df)

check_df <- sqldf("SELECT * FROM df_data_final where countyname like '%Lakota County%' and state in (46); ")
print(check_df)

***********barplot(table(df_new$countyname), col = "blue")
head(df_new)
nrow(df_new) 
write.csv(df_new, "df_new.csv" )
-----------------------------------------------------------------
library(tidyverse)
library(sqldf)
df_new$multiple_income<- df_new$est_population*df_new$median_income



df_new2 <- sqldf("SELECT *, ((SUM(multiple_income) OVER(PARTITION BY STATE,YEAR,MONTH))) AS total_income/(SUM(est_population) OVER(PARTITION BY STATE, YEAR, MONTH)) AS total_population
                 FROM df_new where 1=1
                 AND month = 12 
                 AND statename in ('California','Florida','Texas');")
head(df_new2)
df_new2$avg_median <- df_new2$total_income/df_new2$total_population

ggplot(df_new2, aes(x= year, group = statename)) +
  facet_grid(.~statename,scales="free")+

  geom_line( aes(y= absolute_penetration, color ='green')) + 
  geom_line( aes(y= avg_median, color = 'red')) + 
  scale_y_continuous(
    
    # Features of the first axis
    name = "First Axis",
    
    # Add a second axis and specify its features
    sec.axis = sec_axis(~./100, name="Second Axis")
    
  )
