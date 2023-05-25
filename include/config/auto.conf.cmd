deps_config := \
	lab/rlk/Kconfig \
	lab/Kconfig \
	init/Kconfig \
	arch/arm64/Kconfig

include/config/auto.conf: \
	$(deps_config)

$(deps_config): ;
