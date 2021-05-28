import tensorflow as tf
device_name = tf.test.gpu_device_name()
result = 'CUDA' if device_name else 'CPU'
print(f'Tensorflow device name: {device_name} (expected not empty) [{result}]')

import torch
is_available = torch.cuda.is_available()
print(f'Torch is_available: {is_available} (expected ) [{result}]')

current_device = torch.cuda.current_device()
print(f'Torch current_device: {current_device} (expected ) [{result}]')

device = torch.cuda.device(0)
print(f'Torch device: {device} (expected ) [{result}]')

device_count = torch.cuda.device_count()
print(f'Torch is_available: {device_count} (expected ) [{result}]')

device_name = torch.cuda.get_device_name(0)
print(f'Torch is_available: {device_name} (expected ) [{result}]')

# >>> 'GeForce GTX 950M'

