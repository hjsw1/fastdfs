#!/bin/bash

cd base && docker build -t ypzhuang/fastdfs_base . && cd ..
cd tracker && docker build -t ypzhuang/tracker . && cd ..
cd storage && docker build -t ypzhuang/storage . && cd ..
cd monitor && docker build -t ypzhuang/monitor . && cd ..
