## A script that returns the amount of digits deep one must go into Pi
## to find all pins of a given length

# Read in pi
library(readr)
dp <- read_file("./Pi_data/Pi100KDP.txt")
pi <- sub(" ", "", paste("3",dp))

# Setting up an empty unique pins vector
# should be length of 10^(number of digits)
pin_length <- 4
pins <- vector(mode="character", length=10^pin_length)

# Set count to 0: counts how many unique pins have been stored
# Set index to 1: increases each loop to look in the next sub-string in Pi for unique pin
count <- 0
index <- 1

# while count is less than the length of the pins vector i.e. pins vector isn't full
while(count < length(pins)) {
        # new pin from sub-string of pi
        pin <- substr(pi,index,index+(pin_length-1))
        if(pin %in% pins) {
                # do nothing
        } else {
                # append this new unique pin to pins
                # increase the count by 1
                pins[count] <- pin
                count <- count + 1
        }
        # increase search index by 1 each loop
        index <- index + 1
}

cat("Figures of pi needed to find all pins of length", pin_length, "is", index+3,"\n",
"The last pin found was", tail(pins, n=2))