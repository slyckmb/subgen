Well, after setting up a subgen server on my windows gaming laptop, I finally got it working:

If anyone else is interested in setting up subgen in Windows:

I used Anaconda to setup a Python 3.11 Environment, 

installed the CUDA 12.4 NVIDIA Drivers (https://developer.nvidia.com/cuda-12-4-0-download-archive), and 

used a command from https://pytorch.org/get-started/locally/ to install PyTorch in the Anaconda Python 3.11 environment.

I also needed to download and extract a missing NVIDIA cuDNN dll that wasn't installed with CUDA.  Go to https://developer.nvidia.com/rdp/cudnn-archive and try the latest file for your CUDA rev, which is 12.x for me.  I just tried the most recent one for CUDA 12.4 and it worked.  It was "cuDNN v8.9.7 (December 5th, 2023), for CUDA 12.x"  I extracted all the dlls into "C:\Program Files\NVIDIA GPU Computing Toolkit\CUDA\v12.4\bin"

I also installed gitforwindows so I could git the subgen repo into my environment.  

Then kicked it off with `python launcher.py -u -i -s`

Got this error:  Could not locate cudnn_ops64_9.dll. Please make sure it is in your library path!

        ultimateft
        — 
        11/22/24, 5:44 PM
        ok, will do, getting a different error now, says 'Could not locate cudnn_ops64_9.dll. Please make sure it is in your library path!' but I just re-installed CUDNN and added C:\Program Files\NVIDIA\CUDNN\v9.5\bin to my PATH like it says to do.. not sure what I'm missing there now..You may have upgraded too far, faster-whisper requires cuBLAS for CUDA 12 & cuDNN 9 for CUDA 12
        or your path just isn't working

        ultimateft
        — 
        11/22/24, 5:51 PM
        yeah it's cuDNN 9.5
        I remember this vaguely from the first time I set it up.. I feel like I ended up putting these .dll's somewhere else ultimately, I just can't remember where
        blargy
        — 
        11/22/24, 5:53 PM
        if you put them straight in your subgen folder, it should pick them up


        https://developer.nvidia.com/downloads/compute/cudnn/secure/8.9.7/local_installers/12.x/cudnn-windows-x86_64-8.9.7.29_cuda12-archive.zip/

cudnn/windows-x86_64/cudnn-windows-x86_64-9.0.0.312_cuda12-archive.zip

https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/windows-x86_64/

https://developer.download.nvidia.com/compute/cudnn/redist/cudnn/windows-x86_64/cudnn-windows-x86_64-9.0.0.312_cuda12-archive.zip

Run PowerShell as Administrator:

    Right-click on the PowerShell icon and select Run as administrator.
    
To create the directory C:\Program Files\NVIDIA\CUDNN\v9 if it doesn't already exist using PowerShell, you can use the following command with elevated privileges:

    New-Item -Path "C:\Program Files\NVIDIA\CUDNN\v9" -ItemType Directory

Execute the Extraction Command with elevated privileges:

    Expand-Archive -Path "C:\Users\braba\Downloads\cudnn-windows-x86_64-9.0.0.312_cuda12-archive.zip" -DestinationPath "C:\Program Files\NVIDIA\CUDNN\v9"

Then, you can re-check your PATH environment variable:

    [System.Environment]::SetEnvironmentVariable('PATH', $env:PATH + ';C:\Program Files\NVIDIA\CUDNN\v9\bin', [System.EnvironmentVariableTarget]::Machine)


pip install --upgrade pip
pip install --upgrade nvidia-cudnn-cu12==9.5.0.50
pip install --upgrade nvidia-cuda-nvrtc-cu12==12.4.127
pip install --upgrade nvidia-cuda-runtime-cu12==12.4.127
pip install --upgrade nvidia-cublas-cu12==12.4.5.8
pip install --upgrade torch==2.5.0+cu124 torchvision==0.13.0+cu124 torchaudio==2.5.0+cu124 -f https://download.pytorch.org/whl/cu124/torch_stable.html

