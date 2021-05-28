import os

print('Running nvidia-smi')
os.system('nvidia-smi')

import tensorflow as tf
device_name = tf.test.gpu_device_name()
result = 'CUDA' if device_name else 'CPU'
print(f'Tensorflow device name = [{device_name}] (expected not empty) [{result}]')

import torch
is_available = torch.cuda.is_available()
result = 'CUDA' if is_available else 'CPU'
print(f'Torch is_available = [{is_available}] (expected True) [{result}]')

device_count = torch.cuda.device_count()
result = 'CUDA' if device_count > 0 else 'CPU'
print(f'Torch device_count = [{device_count}] (expected > 0) [{result}]')


# try:
#     current_device = torch.cuda.current_device()
# except RuntimeError:
#     current_device = None
# result = 'CUDA' if current_device is not None else 'CPU'
# print(f'Torch current_device: {current_device} (expected not None) [{result}]')
# multiple RuntimeError lead to python hang

try:
    device_name = torch.cuda.get_device_name(0)
except RuntimeError:
    device_name = ''
result = 'CUDA' if device_name else 'CPU'

print(f'Torch device_name = [{device_name}] (expected not empty) [{result}]')


