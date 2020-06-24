IMAGE_FAMILY=tf-1-14-cu100
ZONE=us-central1-a
INSTANCE_NAME=${MACHINE_NAME}

create-machine:
	gcloud compute instances create $(INSTANCE_NAME) \
	  --zone=$(ZONE) \
	  --image-family=$(IMAGE_FAMILY) \
	  --image-project=deeplearning-platform-release \
	  --maintenance-policy=TERMINATE \
	  --accelerator="type=nvidia-tesla-v100,count=1" \
	  --metadata="install-nvidia-driver=True" \
	  --machine-type=n1-standard-2
	gcloud compute instances attach-disk $(INSTANCE_NAME) \
	  --disk=disk-1 \
	  --mode=ro \
	  --zone=$(ZONE)

delete-machine:
	gcloud compute instances delete $(INSTANCE_NAME) --zone=$(ZONE)

init-machine:
	gcloud compute ssh $(INSTANCE_NAME) --zone $(ZONE) < init_script.sh

ssh:
	gcloud compute ssh $(INSTANCE_NAME) --zone $(ZONE)

list:
	gcloud compute instances list

upload:
	gcloud compute scp . $(INSTANCE_NAME):~/uploads .

download:
	gcloud compute scp $(INSTANCE_NAME):~/downloads .

train:
	gcloud compute ssh $(INSTANCE_NAME) --zone $(ZONE) < train_script.sh
