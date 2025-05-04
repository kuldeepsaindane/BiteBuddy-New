# Step 1: Use the official Node.js image as the base image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if exists)
# This is done to install the dependencies first to leverage Docker cache
COPY package*.json ./

# Step 4: Install the dependencies
RUN npm install

# Step 5: Copy the rest of the project files into the container
COPY . .

# Step 6: Expose the port that Parcel will use
EXPOSE 5173

# Step 7: Run the project with Parcel
CMD ["npm", "run", "dev"]