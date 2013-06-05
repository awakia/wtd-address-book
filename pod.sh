#!/bin/sh

cd AddressBook/Project/
pod install
cd ../../
ln -s AddressBook/Project/AddressBook.xcworkspace AddressBook.xcworkspace
