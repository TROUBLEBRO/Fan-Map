library(twitteR)
library(ROAuth)
library(bitops)
library(RCurl)
setup_twitter_oauth(consumer_key = "9hMclZK9Db7qYkF0vFZmYiheH",
			consumer_secret = "tGUSGroWTSpPntztb17etVDi2qPTRve4jFvXaEnoWgm7G9Oqny",
			access_token = "928256978656333825-iqfl3rQTPzjOT5PpDc4n0GtjtXJEnqX",
			access_secret = "fwFXmX2NEqtKE0wbAhZ8ZgYUUe6ooydaAvSjyqWLNcDw2")
#change it by yourself

MyData ='@NigelWG5'#@KrisDunn3
#@JarrettAllen55，@nolimittb31，NigelWG5

# 2016:@B_Ingram13, @FCHWPO, @BenSimmons25,@DBender03,@buddyhield,BeMore27,@quese,@ivicazubac ,@ThonMaker14
#@Dsabonis11,@taureanprince,@G_P_06,@denzelvalentine,@juanchohg14,@The_Fourth_Wade,@HenryEllenson13
#@Mbeasy5,@CarisLeVert
#2017:MarkelleF,ZO2_, jaytatum0, j_josh11,swipathefox, jisaac_01,MarkkanenLauri,FrankLikina,Dennis1SmithJr,zcollins_33
#AhmadMonk,LukeKennard5,spidadmitchell,Bam1of1,JJacks_44,JustinPatton17,Lanky_Smoove,leafsquad22,jcollins20_,HGizzle1
#the2kferguson,JarrettAllen55,OAnunoby,Tyler_Lydon14,calebswanigan50, kylekuzma,ToBrad1,Dwhite921, joshhart
#FWJackson15,ClutchREED_5,_Iwundu25,FrankMason0,YoungIvee, Jonahbolden43, Semi, 1jordanbell, j3vans1_, BaconDwayne1000
# TDORSEY_1,nolimittb31, Ipjh55,staytuned21,dbrookz8,IkePostrs_,Sin_City_803,ThiasLsf
#MonteMorris11,EdmondSumner,petersalec,NigelWG5,JaronBgame



len <- length(MyData)
user=getUser(MyData)
#change string to get different users infomation

user_follower_IDs=lookupUsers(user$getFollowerIDs())
#get users' followers' information

length(user_follower_IDs)
#length of users' followers data
#the number of followers

result<- sapply(user_follower_IDs, function(x) c(x$name, x$location))
#only keep name and location data

write.csv(t(result),paste('../Data/',paste(MyData, '.csv')),row.names = FALSE, fileEncoding = 'UTF-16LE')
#write data into a file

