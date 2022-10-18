Dynamic nft
so in this project we are goin to host an nft onchain which will be dynamic 

so the function svgToImageUri()converts svg in to base64 code
base64 code is used to imbed images and binary assets into textual assets
sucah as html and css
heres the link to know more about base64 https://en.wikipedia.org/wiki/Base64
in your browser you can view base64 coded assets like
data:image/svg+xml;base64,thenthecode
this will bring out the exact image encoded

there are two images here..a smiley face pic and a frowny face pic
 the nft will change based on how much the user input ie
 if payment greater than x -> smile
 if payment lower than x-> frown

 normal images take up way too much data and hosting them in the blockchain
 is prettty expensive
 so we make use of light pics and images known as svgs(scalable vector graphics)
 for more info on svgs go here https://www.w3schools.com/graphics/svg_intro.asp

 