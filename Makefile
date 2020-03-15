#

.PHONY:	love
love:	all

.PHONY:	all
all:
	flutter build apk --target-platform android-x64

.PHONY:	clean
clean:
	flutter clean

