import urllib
import twurl
import json
#Twitter API
TWITTER_URL = 'https://api.twitter.com/1.1/followers/list.json'

while True:
    acct = raw_input('Enter Twitter Account:')
    if ( len(acct) < 1 ) : break
    url = twurl.augment(TWITTER_URL,
        {'screen_name': acct, 'count': '5'} )
    connection = urllib.urlopen(url)
    data = connection.read()
    headers = connection.info().dict
    js = json.loads(data)
    for u in js['users'] :
        print u['screen_name']
 
