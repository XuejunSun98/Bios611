# Risk factors for Stroke analysis  

This analysis uses Stroke data and aims to find risk factors for stroke. The data used is from https://www.kaggle.com/datasets/fedesoriano/stroke-prediction-dataset. By fitting logistic regression, increasing age, having hypertension, having heart disease, and having higher blood glucose are risk factors for stroke.  

# How to use this repo  
The docker image used to build this container is "amoselb/rstudio-m1".  
Step 1: Build a docker image
```
docker build . -t bios611
```

Step 2: Create Password  
Create a .password file you would like to use  

Step 3: Create a docker container
```
docker run -v $(pwd):/home/rstudio/work\
           -p 8787:8787\
           -e PASSWORD="$(cat .password)"\
           -it bios611
```
Step 4: Open the Rstudio server in the browser  
visit http://localhost:8787. The user name is "rstudio", the password is the password you created.  

Step 5: Open the terminal in Rstudio  
```
cd work
```

Step 6: Generate the report  
```
make clean
make report.html
```
