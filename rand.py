import random
import time
import json
rand_dic = {}

while (True):
    for i in range(1,11):
        rand = random.uniform(0,100)
        rand_dic[i] = rand
    time.sleep(5)
    with open('values.json','w') as jFile:
        json.dump(rand_dic,jFile)