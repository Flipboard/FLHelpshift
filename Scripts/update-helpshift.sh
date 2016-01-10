# Get Helpshift SDK from Cocoapods
echo -e "\nStarting pod install of Helpshift SDK..."
echo "---------------------------------------------"

rm -R Podfile.lock FLHelpShift.xcworkspace Pods
pod install

# Remove localization files that aren't supported by Flipboard.

supported_languages="zh-Hant zh-Hant-TW zh-Hant-HK zh-Hans tr ru pt pt-BR nl ko ja it fr es es-ES en en-IN en-GB en-CA en-AU de"

echo -e "\nRemoving unsupported localization files..."
echo "---------------------------------------------"

helpshift_localization_dir=$(find . -name "helpshift-sdk-ios-*-support" -type d -print | head -n1)

./Scripts/strip-unused-language-files.sh -t $helpshift_localization_dir/HSLocalization -s "$supported_languages"

# Replace Helpshift strings by customized versions
echo -e "\nReplacing Helpshift strings with customized strings..."
echo "---------------------------------------------------------"

./Scripts/customize-strings.sh $helpshift_localization_dir/HSLocalization 

echo -e "\nBuilding xcode project"
echo "---------------------------------------------------------"

xcodebuild -workspace FLHelpShift.xcworkspace -scheme FLHelpshift  | grep "\*\* BUILD "

echo -e "\n\nUpdate complete. Please check in the files and do a Carthage update."
