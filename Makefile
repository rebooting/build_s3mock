build:
	podman build -t s3mock .
run:
	podman run --rm -it --name s3mock -p 8000:8000 s3mock /bin/bash
rm_image:
	podman rmi s3mock
