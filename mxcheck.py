
lineList = [line.rstrip('\n') for line in open("mxcheck.txt")]

for host in lineList:
    split = host.split(".")
    count = len(split) -2
    newname = ""
    for i in split:
        newname = newname + i
        if count == 0:
          newname = newname + "-"
        elif count > 0:
          newname = newname + "."
        count = count - 1
    print(newname)
