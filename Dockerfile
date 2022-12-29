FROM node

# Create app directory
WORKDIR /src/app


COPY app_sample/ .
RUN npm install



EXPOSE 3000
CMD ["node", "index.js"]
