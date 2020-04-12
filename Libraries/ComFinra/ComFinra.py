import subprocess
import logging
import json
import requests
from robot.api import logger
from robot.api.deco import keyword

class ComFinra(object):
    def __init__(self):
        self.finraresp=None
        self.respbody=None
    #Http Get API
    def Http_Get_Robot(self, URL, PARAMS=None):
        #calling python request api Get call
        r = requests.get(url=URL, params=PARAMS)
        #retrieving statuscode
        self.finraresp=r.status_code
        #Errorhandling scenario
        if self.finraresp != 500:
            data = r.json()
            self.respbody=data
            return data
     #Validating the Http status codes
    def Http_Get_Status(self,scode=None):
        print("statuscode:",self.finraresp)
        if int(scode)==self.finraresp:
            return True
        else:
            logger.info("Improper status")
            return status
       #Validating responsebody     
    def Http_Responsebody_Should_Contain(self, valrespbody):

        if str(valrespbody) in str(self.respbody):
            return True
        else:
            logger.info("responsebody doesn't contain")
            logger.info(str(valrespbody))
            return Getrespbody
        