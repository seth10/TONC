export PATH=/Users/setht/Desktop/Development/GBA/devkitARM/bin:$PATH
# name of the directory this shell script resides in
name=$(basename $(cd $(dirname $0) && pwd))

arm-none-eabi-gcc -mthumb -mthumb-interwork -c ${name}.c
arm-none-eabi-gcc -specs=gba.specs -mthumb -mthumb-interwork ${name}.o -o ${name}.elf
arm-none-eabi-objcopy -v -O binary ${name}.elf ${name}.gba
gbafix ${name}.gba

rm ${name}.{elf,o}
#read -rsp $'Press any key to continue...\n' -n 1 key
open -a /Applications/visualboyadvance-m.app/Contents/MacOS/visualboyadvance-m ${name}.gba
