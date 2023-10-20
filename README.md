# GAIHackathon0823

# Using Docker
- Nvidia GPU is required and be able to run the `nvidia-smi` command. 
- See [Nvidia CUDA docs](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html#compute-capability-8-x) and [this Wikipedia](https://en.wikipedia.org/wiki/CUDA#GPUs_supported) for compatibility requirements.

## Container build

This builds a container for the application in the pipelines subdirectory. The image name will be called `gai:latest`

- `docker-compose build`

## Run container

- Create a file with your OpenAI key in a file called `openai.key`
- `docker-compose up`
- Browse to http://localhost:8051
