with open("variables.txt",'w')as fp:
    fp.write("wire ")
    for i in range(0,8):
        for j in range(0,8):
            fp.write("p"+str(i)+str(j))
            fp.write(",")
            
    fp.write(";\n")
    
with open("variables.txt",'a')as fp:
    fp.write("wire ")
    for i in range(0,33):
        fp.write("c"+str(i))
        fp.write(",")