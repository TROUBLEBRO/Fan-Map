#! /usr/bin/env Rscript

# using twitterR with twitter application
library(twitteR)
setup_twitter_oauth("sLpv96SKCZHF7UXEkN1XM2VAk", "SDpkaYI0PjS22FPlhE6LqMcOcA6RMJvLlP7HE7xrPVA7ovbKNp")


# obtain user id and processing
table <- read.csv("e:\\com6235\\user.csv",header = T,sep=",")
row<-nrow(table)

# generate 1*N arrary
for(i in 1:row)
{
	if (i == 1){
    twitter_user_id <- table[i,1]
    i <- i + 1
    }

    else{
    	twitter_user_id <- data.frame(twitter_user_id,table[i,1])
    	i <- i + 1

    }
}


# obtain correspoding location and put them on 1*N arrary
for(j in 1:row)
{
	if (j == 1){
		user <- getUser(twitter_user_id[j])
		user_location <- user$location
		j <- j + 1
	}

	else{
    user <- getUser(twitter_user_id[j])
    user_location <- data.frame(user_location,user$location)
    j <- j + 1
    }
}


# saving data on reqiured csv formart
for(k in 1:row){
	if (k==1){
		output <- data.frame(twitter_user_id[k],user_location[k])
	    result <- output
	    k <- k + 1
	}
	else{
			output <- data.frame(twitter_user_id[k],user_location[k])
	        result <- data.frame(result,output)
	        k <- k + 1
	}

}

 
write.csv(result,"e:\\com6235\\Data.csv",row.names = FALSE)  