
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

# Sao chép mã nguồn của Pelias từ GitHub và chuyển đến thư mục vừa sao chép.
sudo ln -s "$(pwd)/pelias" /usr/local/bin/pelias

# cd vào project
cd projects/vietnam

# Tạo thư mục data và các biến môi trường trong .env
mkdir ./data
sed -i '/DATA_DIR/d' .env
echo 'DATA_DIR=./data' >> .env

# Pull và down các thư mục cần thiết 
pelias compose pull

# khởi động Elasticsearch,
pelias elastic start

# Đợi Elasticsearch hoạt động
pelias elastic wait

# Tạo các chỉ mục Elasticsearch cần thiết cho Pelias
pelias elastic create

# Tải xuống dữ liệu địa lý 
pelias download all

# Chuẩn bị dữ liệu Địa lý tải xuống nhập vào Elasticsearch
pelias prepare all

# Import dữ liệu csv
pelias import csv

# Khởi động các container trong pelias 
pelias compose up

```

# Make an Example Query

Bây giờ bạn có thể thực hiện truy vấn đối với bản dựng Pelias mới của mình::

http://localhost:4000/v1/search?text=47A

http://localhost:4000/v1/reverse?point.lon=106.68298995700007&point.lat=10.7662202410000423
