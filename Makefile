#

HACK=APP_ARGS=--write-verification-metadata $$APP_ARGS
HACKED=android/gradlew

.PHONY:	love
love:	all

.PHONY:	all
all:
	flutter build apk --target-platform android-x64

.PHONY:	clean
clean:
	-fgrep -qx '$(HACK)' '$(HACKED)' && mv -f $(HACKED).orig $(HACKED)
	flutter clean

# WTF workaround as I found no way to pass --write-verification-metadata to Gradle if called via flutter
.PHONY:	checksums
checksums:
	-fgrep -qx '$(HACK)' $(HACKED) || sed -i.orig '/^APP_ARGS/a$(HACK)' $(HACKED)
	bash -c "trap 'mv -f $(HACKED).orig $(HACKED)' 0; make all"

