import time


def wrapper(func):
    def inner(*args, **kwargs):
        start = time.time()
        res =  func(*args, **kwargs)
        end = time.time()
        print("run time:%.4f"% (end-start))
        return res
    return inner

def read():
    for i in range(10000):
        string = ''
        for i in range(100):
            string = ''.join([string,str(i),"ljw"])
        yield string
@wrapper        
def main():
    res = read()        
    for i in res:
        len(i)
if __name__=="__main__":
    main()        