
# repro for bash_kernel prompt issue

To use:


``` bash
# Build a kernelspec using the bash_kernel in Nixpkgs
nix build .#kernelspec -o jupyter_path/kernels/bash/kernel.json

export JUPYTER_PATH=$(pwd)/jupyter_path

# Run Papermill on the provided notebook
cd home
nix run .#papermill -- --kernel bash notebook.ipynb out.ipynb
```
