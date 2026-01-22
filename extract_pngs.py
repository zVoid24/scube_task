import os
import xml.etree.ElementTree as ET
import base64

directory = r'c:\Users\rabbi\OneDrive\Desktop\SCUBE\assets\icons\total_values'

for filename in os.listdir(directory):
    if filename.endswith(".svg"):
        filepath = os.path.join(directory, filename)
        try:
            tree = ET.parse(filepath)
            root = tree.getroot()
            
            # Namespace map
            namespaces = {'svg': 'http://www.w3.org/2000/svg', 'xlink': 'http://www.w3.org/1999/xlink'}
            
            # Find image tag
            image = root.find('.//svg:image', namespaces)
            if image is not None:
                href = image.get('{http://www.w3.org/1999/xlink}href')
                if href and href.startswith('data:image/png;base64,'):
                    base64_data = href.split(',')[1]
                    png_data = base64.b64decode(base64_data)
                    
                    png_filename = filename.replace('.svg', '.png')
                    # Remove (1) if present to clean up names
                    png_filename = png_filename.replace(' (1)', '')
                    
                    with open(os.path.join(directory, png_filename), 'wb') as f:
                        f.write(png_data)
                    print(f"Extracted {png_filename}")
        except Exception as e:
            print(f"Failed to extract from {filename}: {e}")
