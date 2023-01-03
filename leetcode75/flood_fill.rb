# https://leetcode.com/problems/flood-fill/?envType=study-plan&id=level-1

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  # Return the image if the starting pixel is out of bounds or if it already has the new color
  return image if sr < 0 || sr >= image.length || sc < 0 || sc >= image[0].length || image[sr][sc] == new_color

  # Get the color of the starting pixel
  color = image[sr][sc]
  # Set the color of the starting pixel to the new color
  image[sr][sc] = new_color

  # Recursively flood fill the 4-connected pixels with the same color as the starting pixel
  flood_fill(image, sr + 1, sc, new_color) if sr + 1 < image.length && image[sr + 1][sc] == color # down
  flood_fill(image, sr - 1, sc, new_color) if sr - 1 >= 0 && image[sr - 1][sc] == color # up
  flood_fill(image, sr, sc + 1, new_color) if sc + 1 < image[0].length && image[sr][sc + 1] == color # right
  flood_fill(image, sr, sc - 1, new_color) if sc - 1 >= 0 && image[sr][sc - 1] == color # left

  # Return the modified image
  image
end