O := UPDATE-AnyKernel3.zip
IMAGE := ../out/android12-5.4/dist/Image

all: $(O)
$(O): $(IMAGE) anykernel.sh $(wildcard tools/*) $(wildcard META-INF/com/google/android/*)
	@if [ "$(IMAGE)" != "Image" ]; then \
		cp -f "$(IMAGE)" "Image"; \
	fi
	@zip -r9 "$(O)" "anykernel.sh" "Image" "tools/" "META-INF/"

clean:
	@if [ "$(IMAGE)" != "Image" ]; then \
		rm -f "Image"; \
	fi
	@rm -f "$(O)"

.PHONY: all clean
