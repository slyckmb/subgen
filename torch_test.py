import torch

# Check if CUDA is available
if torch.cuda.is_available():
    print("CUDA is available!")
    print(f"CUDA device count: {torch.cuda.device_count()}")
    print(f"Current CUDA device: {torch.cuda.current_device()}")
    print(f"CUDA device name: {torch.cuda.get_device_name(torch.cuda.current_device())}")

    # Create a tensor and move it to the GPU
    tensor = torch.tensor([1.0, 2.0, 3.0])
    tensor = tensor.to('cuda')
    print("Tensor on CUDA:", tensor)

    # Perform a simple operation on the GPU
    result = tensor * 2
    print("Result on CUDA:", result)
else:
    print("CUDA is not available.")
