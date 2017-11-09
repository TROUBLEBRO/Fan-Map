library(twitteR)
library(ROAuth)
library(RCurl)
setup_twitter_oauth(consumer_key = "1a11c08HYb1oxtlBxRLnAhSVw",
                    consumer_secret = "sy81HBwKoiPspemopDXnuEp3I0Edbny709rYe5eDjhdFXEvb19",
                    access_token = "717540844295688192-qn3zOB1diFNR8QL39UobVuCM8RQ87LT",
                    access_secret = "G18VLbwhEmZZESKKdaSN0RdR25et4rr8f8VQL8uqd2rzX")
user=getUser("MMR8000")
user_follower_IDs=user$getFollowers(retryOnRateLimit=180)
user_follower_IDs = user$getFollowers()
length(user_follower_IDs)
result<- sapply(user_follower_IDs, function(x) c(x$name, x$location))
write.csv(t(result),"G:\\Data.csv",row.names = FALSE)

# df <- do.call("rbind", lapply(s, as.data.frame)) 
# # extract the usernames
# users <- sapply(users, as.character)
# # make a data frame for the loop to work with 
# users.df <- data.frame(users = users, 
#                        followers = "", stringsAsFactors = FALSE)
# # loop to populate users$followers with follower 
# # count obtained from Twitter API
# for (i in 1:nrow(users.df))
# {
#   # tell the loop to skip a user if their account is protected
#   # or some other error occurs
#   result <- try(getUser(users.df$users[i])$followersCount, silent = TRUE);
#   if(class(result) == "try-error") next;
#   # get the number of followers for each user
#   users.df$followers[i] <- getUser(users.df$users[i])$followersCount
#   # tell the loop to pause for 60 s between iterations to
#   # avoid exceeding the Twitter API request limit
#   print('Sleeping for 60 seconds...')
#   Sys.sleep(60);
# }