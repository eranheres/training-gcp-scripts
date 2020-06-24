Several helpers to operate remote instances on GCP, targeted for machine learning training.

The script uses gcloud, so it should be installed before operating the scripts. Installation guide can be found [here](https://cloud.google.com/sdk/install)
Instance name is defined for all commands using environment variable
```
export INSTANCE_NAME=mymachine
```
Create a new instance
```
make create-machine
```
After the machine is created, it should be initialized. It might take few minutes until SSH is available (you will get [/usr/bin/ssh] exited with return code [255]), so just retry util command succeed
```
make init-machine
```
Delete existing machine
```
make delete-machine
```
You can ssh a machine using
```
make ssh 
```
Or list the existing machines with names
```
make list 
```
Upload to upload folder and download from download folder
```
make upload
make download 
```
And finally you can remotely run script for training (this is a bit unstable and stuck sometimes so it is better to ssh and run the command)
```
make train
```




