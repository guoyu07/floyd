#!/bin/sh

###################
# meta.proto
# command.proto
###################
FILE1="meta command"
for file in $FILE1 ; do
  protoc -I=./ --cpp_out=./ ./$file.proto
  mv $file.pb.h $file.pb.cc ../src
done

#####################
# raft/raft.proto
# raft/log_meta.proto
###################

FILE2="raft/raft raft/log_meta"
for file in $FILE2 ; do
  protoc -I=./ --cpp_out=./ ./$file.proto
  mv $file.pb.h $file.pb.cc ../src/raft
done

#####################
# client.proto
###################
FILE3="client"
protoc -I=./ --cpp_out=./ ./$FILE3.proto
cp $file.pb.h $file.pb.cc ../example/sdk
mv $file.pb.h $file.pb.cc ../example/server