THEOS_DEVICE_IP=192.168.1.14
DEBUG=0
FINALPACKAGE=1
include /var/theos/makefiles/common.mk

export ARCHS = armv7 armv7s arm64 arm64e
TWEAK_NAME = BeRealUnblur
BeRealUnblur_FILES = Tweak.xm

include /var/theos/makefiles/tweak.mk