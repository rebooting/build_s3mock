build:
	podman build -t s3mock .
rm_image:
	podman rmi s3mock
