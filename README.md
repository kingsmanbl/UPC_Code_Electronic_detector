# UPC_Code_Electronic_detector
For this project, I was given a prompt where there are six products being sold. 

With the rules given, there are four cases for the stolen light logic to consider:
• An expensive item with the mark is not stolen.
• An expensive item without the mark is stolen.
• A non-expensive item without the mark is not stolen.
• A non-expensive item with the mark will never occur, so is a Don’t Care

There are six products being sold. The UPC code for each is shown, as well as whether it was
ever on sale (i.e. sold at a discounted price), and whether it is expensive, and thus is marked
when sold.
Item Name UPC Code Discounted? Expensive?
Shoes 0 0 0 No Yes
Costume Jewelry 0 0 1 No No
Christmas Ornament 0 1 0 Yes No
Business Suit 1 0 0 No Yes
Winter Coat 1 0 1 Yes Yes
Socks 1 1 1 Yes No

Through this project, I was able to recreate this electronic detector using DE1_SoC by utilizing K-maps and Boolean Algebra to optimize the design in SystemVerilog
