
import matplotlib.pyplot as plt

days=["Mon" , "Tues" , "Wed" , "Thur" , "Fri" , "Sat" , "Sun"]  # mon tue wed thurs fri sat sun
college=[4,6,5,5,4,0,0]
skills=[5,6,5,4,6,7,2]
studying=[1,2,1,2,3,3,2]
sleeping=[6,7,6,8,7,7,9]
timepass=[2,2,1,2,3,2,3]

activities = ["College" , "Working on skills" , "Studying for college" , "Sleeping" , "Timepass"]
colors = ["#11224E" , "#F87B1B" , "#CBD99B" , "#84994F" , "#A72703"]

plt.stackplot(days,college,skills,studying,sleeping,timepass,labels=activities, colors=colors,alpha=0.7)
plt.legend(loc="best")
plt.xlabel("Days")
plt.ylabel("Hours")
plt.grid(True)
plt.tight_layout()
plt.show()