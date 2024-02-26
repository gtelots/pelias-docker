
# Introduce 

Đây là dự án mã nguồn mở để tạo ra một hệ thống tìm kiếm địa lý. Dự án này tập trung vào việc xây dựng một cơ sở dữ liệu toàn cầu về các địa điểm và địa danh, cũng như cung cấp các công cụ tìm kiếm và định vị để người dùng có thể tìm kiếm và khám phá thông tin địa lý trên toàn thế giới. Pelias được phát triển bởi Mapzen, một công ty công nghệ địa lý, và được phát hành theo giấy phép mã nguồn mở.

# Setup

Vui lòng tham khảo hướng dẫn tại https://github.com/pelias/docker để cài đặt và định cấu hình môi trường docker của bạn.

Hãy đảm bảo rằng tất cả đều hoạt động tốt trước khi tiếp tục.

# Run a Build

Thực hiện các lệnh sau:

```bash
#!/bin/bash
set -x

# Clone 
git clone https://github.com/gtelots/pelias-docker.git && cd pelias-docker

# Cài đặt và set up pelias
sudo ln -s "$(pwd)/pelias" /usr/local/bin/pelias

# cd vào project
cd projects/vietnam

# Tạo thư mục data và các biến môi trường trong .env
mkdir ./data
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=./data' >> .env

# pull và down các thư mục cần thiết 
pelias compose pull
pelias elastic start
pelias elastic wait
pelias elastic create
pelias download all
pelias prepare all

# Chuẩn bị file csv theo định dạng mẫu của pelias bạn có thể xem trong data/csv/example.csv (example.csv sẽ được tạo khi sử dụng pelias download all) 
pelias import csv
pelias compose up

# Có thể chạy kiểm thử 
pelias test run
```

# Make an Example Query

Bây giờ bạn có thể thực hiện truy vấn đối với bản dựng Pelias mới của mình::

http://localhost:4000/v1/search?text=pdx

http://localhost:4000/v1/reverse?point.lon=-122.650095&point.lat=45.533467
