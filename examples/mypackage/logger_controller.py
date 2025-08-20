import requests

from active.controller.decorators import ActiveController
from active.controller.http_controller_base import HTTPControllerBase

@ActiveController("HTTP")
class LoggerController(HTTPControllerBase):
    '''
    BackendController for using a REST API.
    
    '''
    
    def __init__(self, url=""):
        '''
        Default constructor.
        
        Args:
            url String url of the API
        '''
        
        super().__init__(url=url)
     
    def get_test_value(self):
        '''
        Get the test value from the API.
        '''
        
        return self.get("/test")
