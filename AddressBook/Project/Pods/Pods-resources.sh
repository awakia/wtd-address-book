#!/bin/sh

RESOURCES_TO_COPY=${PODS_ROOT}/resources-to-copy.txt
touch "$RESOURCES_TO_COPY"

install_resource()
{
  case $1 in
    *.storyboard)
      echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .storyboard`.storyboardc" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.xib)
        echo "ibtool --errors --warnings --notices --output-format human-readable-text --compile ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib ${PODS_ROOT}/$1 --sdk ${SDKROOT}"
      ibtool --errors --warnings --notices --output-format human-readable-text --compile "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename \"$1\" .xib`.nib" "${PODS_ROOT}/$1" --sdk "${SDKROOT}"
      ;;
    *.framework)
      echo "rsync -rp ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      rsync -rp "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${FRAMEWORKS_FOLDER_PATH}"
      ;;
    *.xcdatamodeld)
      echo "xcrun momc ${PODS_ROOT}/$1 ${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename $1 .xcdatamodeld`.momd"
      xcrun momc "${PODS_ROOT}/$1" "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/`basename $1 .xcdatamodeld`.momd"
      ;;
    *)
      echo "${PODS_ROOT}/$1"
      echo "${PODS_ROOT}/$1" >> "$RESOURCES_TO_COPY"
      ;;
  esac
}
install_resource 'FlatUIKit/Resources/Lato-Black.ttf'
install_resource 'FlatUIKit/Resources/Lato-BlackItalic.ttf'
install_resource 'FlatUIKit/Resources/Lato-Bold.ttf'
install_resource 'FlatUIKit/Resources/Lato-BoldItalic.ttf'
install_resource 'FlatUIKit/Resources/Lato-Hairline.ttf'
install_resource 'FlatUIKit/Resources/Lato-HairlineItalic.ttf'
install_resource 'FlatUIKit/Resources/Lato-Italic.ttf'
install_resource 'FlatUIKit/Resources/Lato-Light.ttf'
install_resource 'FlatUIKit/Resources/Lato-LightItalic.ttf'
install_resource 'FlatUIKit/Resources/Lato-Regular.ttf'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubbleSquareIncoming.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubbleSquareIncoming@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubbleSquareOutgoing.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/bubbleSquareOutgoing@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-bar.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-bar@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-field.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/input-field@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleBlue.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleBlue@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleGray.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleGray@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleGreen.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleGreen@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleHighlighted.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleHighlighted@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleTyping.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/messageBubbleTyping@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send-highlighted.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send-highlighted@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Images/send@2x.png'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Sounds/messageReceived.aiff'
install_resource 'JSMessagesViewController/JSMessagesTableViewController/Resources/Sounds/messageSent.aiff'

rsync -avr --no-relative --exclude '*/.svn/*' --files-from="$RESOURCES_TO_COPY" / "${CONFIGURATION_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
rm "$RESOURCES_TO_COPY"
