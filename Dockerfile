# Sử dụng Node.js 18 làm base image
FROM node:18-alpine

# Thiết lập thư mục làm việc
WORKDIR /app

# Copy package.json và package-lock.json để cài đặt dependencies
COPY package*.json ./

# Cài đặt dependencies
RUN npm install --production

# Copy toàn bộ mã nguồn vào image
COPY . .

# Build ứng dụng (nếu cần)
RUN npm run build

# Mở port 9000 (port mặc định của Medusa)
EXPOSE 9000

# Chạy migrations và khởi động Medusa
CMD ["sh", "-c", "medusa migrations run && medusa start"]
