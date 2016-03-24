BUILT_RAMDISK_CPIO := $(PRODUCT_OUT)/ramdisk-recovery.cpio
COMPRESS_COMMAND :=  xz --check=crc32 --lzma2=dict=2MiB
KERNEL := $(PRODUCT_OUT)/kernel
INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): $(recovery_ramdisk)
	@echo "------- Compressing recovery ramdisk -------"
	$(hide) $(COMPRESS_COMMAND) "$(BUILT_RAMDISK_CPIO)"
	@echo "------- Making recovery image -------"
	$(hide) $(MKBOOTIMG) \
		--kernel $(KERNEL) \
		--ramdisk $(BUILT_RAMDISK_CPIO).xz \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		$(BOARD_MKBOOTIMG_ARGS) \
		-o $(INSTALLED_RECOVERYIMAGE_TARGET)
	@echo "------- Made recovery image: $@ -------"