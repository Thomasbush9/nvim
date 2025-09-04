mport matplotlib.pyplot as plt
import numpy as np

# Ensure Tkinter backend for external window display
plt.switch_backend('TkAgg')

# Generate data
x = np.linspace(0, 4 * np.pi, 500)
y1 = np.sin(x)
y2 = np.sin(2 * x)
print(x)

# Create scatter plot
plt.scatter(x, y1, label='sin(x)', color='b', alpha=0.5)
plt.scatter(x, y2, label='sin(2x)', color='r', alpha=0.5)
plt.title('Scatter Plot of Sine Waves')
plt.xlabel('x')
plt.ylabel('sin(x) and sin(2x)')
plt.legend()

# Show plot in external window
plt.show()


