from PIL import Image, ImageDraw, ImageFont

def create_icon():
    # Create a 512x512 image
    img = Image.new('RGBA', (512, 512), (0, 153, 255, 255)) # Blue background
    draw = ImageDraw.Draw(img)
    
    # Draw a white circle
    draw.ellipse((50, 50, 462, 462), fill='white')
    
    # Draw some "circuit" lines (simplified logo)
    draw.line((256, 150, 256, 362), fill='#0099FF', width=20)
    draw.line((256, 256, 350, 180), fill='#0099FF', width=20)
    draw.line((256, 256, 162, 180), fill='#0099FF', width=20)
    
    # Save
    img.save('assets/icons/launcher_icon.png')

if __name__ == '__main__':
    create_icon()
