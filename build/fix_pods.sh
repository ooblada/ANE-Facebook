#!/bin/bash

# Pods Header directory structure is completely broken
# Get a fresh copy of the FB ios SDK from github in your $HOME/Documents directory
# then use that script to copy files where they should be and regenerate the symlinks in the HEADER directory

# Adjust those path to your working environment
SRC_PATH="$HOME/Documents/FacebookSDK"
DST_PATH="$HOME/workcopies/ANE-Facebook/ios/Pods"

function symlink_headers {
  SRC_DIR="$1"
  DST_DIR="$2"

  echo "FUNC_SRC is $SRC_DIR"
  echo "FUNC_DST is $DST_DIR"
  echo

  rm -Rf "$DST_DIR"/*
  #for f in $(ls "$SRC_DIR"/*.h); do echo "Linking $f to $DST_DIR/$(basename "$f")"; done
  for f in $(ls "$SRC_DIR"/*.h); do ln -s "$f" $DST_DIR/$(basename "$f"); done
}

#echo "SRC is $SRC_PATH"
#echo "DST is $DST_PATH"

# FBSDKCoreKit
CORE_SRC="$SRC_PATH/FBSDKCoreKit/FBSDKCoreKit"
CORE_DST="$DST_PATH/FBSDKCoreKit/FBSDKCoreKit/FBSDKCoreKit"
CORE_H_PUB="$DST_PATH/Headers/Public/FBSDKCoreKit"
CORE_H_PRI="$DST_PATH/Headers/Private/FBSDKCoreKit"

#echo
#echo "CORE_SRC is $CORE_SRC"
#echo "CORE_DST is $CORE_DST"

rm -Rf "$CORE_DST"/*
cp -Rf "$CORE_SRC" "$CORE_DST/.."
rm -Rf "$CORE_DST/Swift"
rm -Rf "$CORE_DST/Internal_NoARC"
rm -Rf "$CORE_DST/Info.plist"
rm -Rf "$CORE_DST/FBSDKCoreKit.modulemap"

symlink_headers "$CORE_DST" "$CORE_H_PUB"
symlink_headers "$CORE_DST"/AppEvents "$CORE_H_PUB"
symlink_headers "$CORE_DST"/AppLink "$CORE_H_PUB"
# symlink_headers "$CORE_DST"/Basics "$CORE_H_PUB"

symlink_headers "$CORE_DST"/Internal "$CORE_H_PRI"


# FBSDKLoginKit
LOGIN_SRC="$SRC_PATH/FBSDKLoginKit/FBSDKLoginKit"
LOGIN_DST="$DST_PATH/FBSDKLoginKit/FBSDKLoginKit/FBSDKLoginKit"
LOGIN_H_PUB="$SRC_PATH"/Headers/Public/FBSDKLoginKit
LOGIN_H_PRI="$DST_PATH"/Headers/Private/FBSDKLoginKit

#echo
#echo "LOGIN_SRC is $LOGIN_SRC"
#echo "LOGIN_DST is $LOGIN_DST"

rm -Rf "$LOGIN_DST"/*
cp -Rf "$LOGIN_SRC" "$LOGIN_DST/.."
rm -Rf "$LOGIN_DST/Swift"
rm -Rf "$LOGIN_DST/Internal_NoARC"
rm -Rf "$LOGIN_DST/Info.plist"
rm -Rf "$LOGIN_DST/FBSDKLoginKit.modulemap"

symlink_headers "$LOGIN_DST" "$LOGIN_H_PUB"
symlink_headers "$LOGIN_DST"/Internal "$LOGIN_H_PRI"


# FBSDKShareKit
SHARE_SRC="$SRC_PATH/FBSDKShareKit/FBSDKShareKit"
SHARE_DST="$DST_PATH/FBSDKShareKit/FBSDKShareKit/FBSDKShareKit"
LOGIN_H_PUB="$SRC_PATH"/Headers/Public/FBSDKShareKit/FBSDKShareKit
LOGIN_H_PRI="$DST_PATH"/Headers/Private/FBSDKShareKit/FBSDKShareKit

#echo
#echo "SHARE_SRC is $SHARE_SRC"
#echo "SHARE_DST is $SHARE_DST"

rm -Rf "$SHARE_DST"/*
cp -Rf "$SHARE_SRC" "$SHARE_DST/.."
rm -Rf "$SHARE_DST/Swift"
rm -Rf "$SHARE_DST/Internal_NoARC"
rm -Rf "$SHARE_DST/Info.plist"
rm -Rf "$SHARE_DST/FBSDKShareKit.modulemap"

symlink_headers "$LOGIN_DST" "$LOGIN_H_PUB"
symlink_headers "$LOGIN_DST"/Internal "$LOGIN_H_PRI"
