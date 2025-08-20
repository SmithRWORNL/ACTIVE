from active.testing.decorators import ActiveTestStep

@ActiveTestStep("my test")
def test(controller=None):
    '''
    Attempt to test the data logger.
    '''
    
    # Get the test value from the logger
    test_value = controller.get_test_value()
    
    # Intentiontally fail to demonstrate the behavior of a failing test. The real test value will be Test Value 1
    if test_value == "Test Value 3":
        return []
    else: 
        return ["Failed"]