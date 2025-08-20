from active.strategy.decorators import ActiveStrategy

@ActiveStrategy("My Strategy")
class MyStrategy():
    '''
    Example strategy
    
    '''
    
    def __init__(self, api=None):
        '''
        Default constructor.
        
        ACTIVE environment file prototype:
        
        {
            "api": "!ACTIVE:my-controller"
        }
        
        Args:
            api: Controller 
        '''
        
        self.api = api
    
    def step(self, final_episode=False):
        '''
        Perform one step of the strategy by printing out the value gotten from the Controller.
        '''
        
        print ("Ran My Strategy", flush=True)
        print ("Got test value from API: " + self.api.get_test_value(), flush=True)
