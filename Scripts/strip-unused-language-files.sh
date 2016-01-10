#!/bin/sh


usage() {
cat << EOF >&2

Strips language bundles for all languages not in the project itself from iOS/OSX projects. 

Usage:
  $(basename $0) [options] [folder]

Options:
  -l, --list                Lists the supported languages in a given folder
  -s, --supported_langs	    Supported languages
  -t, --target              The target path to use to strip languages from
  -h, --help                Displays this help text
  -q, --quiet               Supress output

Notes:
  - If no options are given, the the supported languages are listed in the current folder

Example:
  - ./strip-unused-language-files.sh  -t ~/Flipboard-iOS/3rdParty/Helpshift/HSLocalization -s "en-GB en-CA en-AU de"

EOF
}

list_languages()
{
    local lproj_list=`find "${1:-$source_path}" -maxdepth 1 -name "*.lproj" -exec basename {} \;`
    language_list=""
    for lproj in $lproj_list; do
        language_list="${lproj%%.*} $language_list"
    done
}

list_strip()
{
    local source_languages="$supported_languages"

    # get languages in the target path
    list_languages "${1:-$target_path}"
    local target_languages="$language_list"

    strip_list="$target_languages "
    for item in $source_languages; do 
        strip_list=`echo "${strip_list}" | sed s:"${item}\ "::g`
    done
}

list()
{
    echo "Supported languages: ${supported_languages}"
}

strip() {
    list_strip "${1:-$target_path}"

    # re-list the source languages for info purpose
    if [ $should_info == true ]; then
        echo "Supported languages: $supported_languages"
    fi

    local stripped_list=""
    for dir in $strip_list; do
        local strip_dir="${1:-$target_path}/${dir}.lproj"
        stripped_list="${dir} $stripped_list"
        rm -rf "$strip_dir"
    done

    if [ $should_info == true ]; then
        echo "Target path: ${1:-$target_path}"
        echo "Stripped languages: $stripped_list"
    fi

    # remove lines in xcode generated Pod project file - Pods/Pods.xcodeproj/project.pbxproj
    for locale in $strip_list; do
        local remove_line="${locale}.lproj"
        sed -i "" "/.*$locale.lproj.*/d" ./Pods/Pods.xcodeproj/project.pbxproj
	echo "Remove line in project.pbxproj containing string $locale.lproj"
   	##echo "sed -i \"\" \"/.*$locale.lproj.*/d\" ./Pods/Pods.xcodeproj/project.pbxproj"
     done   

    # remove lines in xcode generated copy Pods-resources.sh file
    for locale in $strip_list; do
        local remove_line="${locale}.lproj"
        sed -i "" "/.*$locale.lproj.*/d" ./Pods/Target\ Support\ Files/Pods/Pods-resources.sh 
        echo "Remove line in Pods-resources.sh containing string $locale.lproj"
        ##echo "sed -i \"\" \"/.*$locale.lproj.*/d\" ./Pods/Target\ Support\ Files/Pods/Pods-resources.sh"
     done
 
}

# Set default values.
target_path=
should_strip=false
should_info=true
supported_languages=

# If we don't have any options, just list languages
if [ $# == 0 ]; then
    list "${supported_languages}"
    exit 0
fi

# Parse command line options.
while [ $# -gt 0 ]; do
    # Check parameters.
    case $1 in
        -t | --target )
            target_path="$2"
            should_strip=true
            shift;;
	-s | --supported_langs )
	    supported_languages="$2"
	    shift;;
        -l | --list )
            should_strip=false
            shift;;
        -q | --quiet )
            should_info=false
            shift;;
        -h | --help )
            usage
            exit 1;;
        -v | --version )
            version
            exit 1;;
        * ) # Unknown option
            echo "Error: Unknown option '$1'" 1>&2
            usage
            exit 1;;
    esac    
    shift
done

if [ ! -d "${target_path}" ]; then
    echo "Error: Target path could not be found: ${target_path}" 1>&2
    exit 1
fi

strip "${target_path}"

