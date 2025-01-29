#!/bin/bash

# 保存するディレクトリ
BAG_DIR=~/rosbag

# 保存するBagファイルの名前（日時付き）
BAG_NAME="rosbag2_$(date +%Y%m%d_%H%M%S)"

# 記録するトピックのリスト
TOPICS=(
    "/vectornav/pose"
    "/zed/zed_node/point_cloud/cloud_registered"
    "/zed/zed_node/rgb/image_rect_color"
)

# 保存先ディレクトリを作成（存在しない場合のみ）
mkdir -p "$BAG_DIR"

# フルパスを設定
BAG_PATH="$BAG_DIR/$BAG_NAME"

echo "Recording ROS2 bag to: $BAG_PATH"
echo "Topics: ${TOPICS[@]}"

# ros2 bag recordの実行
ros2 bag record -o "$BAG_PATH" ${TOPICS[@]}
