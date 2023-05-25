VERSION = 0
PATCHLEVEL = 0
SUBLEVEL = 1
EXTRAVERSION =
NAME = openos

MAKEFLAGS += -rR --no-print-directory

# 为了更加关注警告，默认情况下不那么冗长
# 使用'make V=1'查看完整命令
ifdef V
  ifeq ("$(origin V)", "command line")
    KBUILD_VERBOSE = $(V)
  endif
endif
ifndef KBUILD_VERBOSE
  KBUILD_VERBOSE = 0
endif

KBUILD_CHECKSRC = 0

# 美化输出
ifeq ($(KBUILD_VERBOSE),1)
  quiet =
  Q =
else
  quiet=quiet_
  Q = @
endif

export quiet Q KBUILD_VERBOSE

# 如果这是 make 的最终调用，我们处理 Makefile 的其余部分
ifeq ($(skip-makefile),)

# 如果构建一个外部模块，我们不关心 all: 规则
# 但是 _all 依赖于模块
PHONY += all
_all: all

srctree		:= $(if $(KBUILD_SRC),$(KBUILD_SRC),$(CURDIR))
TOPDIR		:= $(srctree)
# FIXME -TOPDIR 已过时，请使用 srctree/objtree
objtree		:= $(CURDIR)
src		:= $(srctree)
obj		:= $(objtree)

VPATH		:= $(srctree)

export srctree objtree VPATH TOPDIR


# SUBARCH 告诉用户模式构建底层架构是什么。

SUBARCH := arm64
SUBARCH_CROSS_COMPILE := aarch64-linux-gnu-

ARCH		?= $(SUBARCH)
CROSS_COMPILE	?= $(SUBARCH_CROSS_COMPILE)

# compile.h 中的架构
SRCARCH         := $(ARCH)
UTS_MACHINE := $(ARCH)

KCONFIG_CONFIG	?= .config

# kbuild 使用的 SHELL
CONFIG_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
	  else if [ -x /bin/bash ]; then echo /bin/bash; \
	  else echo sh; fi ; fi)

HOSTCC       = gcc
HOSTCXX      = g++
HOSTINCLUDE  = -Iinclude
HOSTCFLAGS   = -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer $(HOSTINCLUDE)
HOSTCXXFLAGS = -O2

# 决定是构建内置的、模块化的还是两者兼而有之。
# 通常，只做内置的.

KBUILD_BUILTIN := 1

export KBUILD_BUILTIN
export KBUILD_CHECKSRC KBUILD_SRC


hdr-arch  := $(SRCARCH)

# 寻找相对于内核 src 根目录的 make include 文件
MAKEFLAGS += --include-dir=$(srctree)

# 我们需要一些通用的定义。
#include $(srctree)/arch/$(ARCH)/Kbuild.include
include $(srctree)/scripts/Kbuild.include

# 当必须引用 include/目录时使用 TARGETINCLUDE。
# 需要与 O= 选项兼容
TARGETINCLUDE   := -Iinclude -Iinclude/std \
                   -include $(srctree)/include/target/config.h \
                   $(if $(KBUILD_SRC),-Iinclude2 -I$(srctree)/include)

# 当你必须只引用 UAPI 目录时使用 USERINCLUDE。
USERINCLUDE    := \
		-I$(srctree)/arch/$(hdr-arch)/include/uapi \
		-Iarch/$(hdr-arch)/include/generated/uapi \
		-I$(srctree)/include/uapi \
		-Iinclude/generated/uapi

# 当必须引用 include/目录时使用 LINUXINCLUDE。
# 需要与 O= 选项兼容
LINUXINCLUDE    := \
		-I$(srctree)/arch/$(hdr-arch)/include \
		-Iarch/$(hdr-arch)/include/generated/uapi \
		-Iarch/$(hdr-arch)/include/generated \
		-Iarch/$(hdr-arch)/include/asm \
		$(if $(KBUILD_SRC), -I$(srctree)/include) \
		-Iinclude \
		$(USERINCLUDE)

export LINUXINCLUDE

# 生成变量（CC 等...）

AS		= $(CROSS_COMPILE)as
LD		= $(CROSS_COMPILE)ld
CC		= $(CROSS_COMPILE)gcc
CPP		= $(CROSS_COMPILE)cpp
AR		= $(CROSS_COMPILE)ar
NM		= $(CROSS_COMPILE)nm
STRIP		= $(CROSS_COMPILE)strip
OBJCOPY		= $(CROSS_COMPILE)objcopy
CPPFLAGS        := -g -D__KERNEL__ $(TARGETINCLUDE) $(LINUXINCLUDE)
CFLAGS          := -g -Wall -DKBUILD_CONF $(TARGETINCLUDE) $(LINUXINCLUDE)
AFLAGS          := -D__ASSEMBLY__
SYMLINK		:= ln -fsn
#SYMLINK		:= cp -rf
AWK		= awk
PERL		= perl
CHECK		= sparse

CHECKFLAGS     := -D__STDC__ $(CF)
CFLAGS_KERNEL	=
AFLAGS_KERNEL	=

# 从 include/config/kernel.release 读取 KERNELRELEASE（如果它存在）
KERNELRELEASE = $(shell cat include/config/kernel.release 2> /dev/null)
KERNELVERSION = $(VERSION).$(PATCHLEVEL).$(SUBLEVEL)$(EXTRAVERSION)

export VERSION PATCHLEVEL SUBLEVEL KERNELRELEASE KERNELVERSION
export ARCH  SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS HOSTINCLUDE CROSS_COMPILE
export AS LD CC CPP AR NM STRIP OBJCOPY MAKE AWK PERL
export UTS_MACHINE HOSTCXX HOSTCXXFLAGS CHECK CHECKFLAGS

export CPPFLAGS NOSTDINC_FLAGS TARGETINCLUDE OBJCOPYFLAGS LDFLAGS
export CFLAGS CFLAGS_KERNEL
export AFLAGS AFLAGS_KERNEL

# 在 find ... 语句中忽略的文件

RCS_FIND_IGNORE := \( -name SCCS -o -name BitKeeper -o -name .svn -o -name CVS -o -name .pc -o -name .hg -o -name .git \) -prune -o
export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn --exclude CVS --exclude .pc --exclude .hg --exclude .git

# ===========================================================================
PHONY += scripts_basic
scripts_basic:
	$(Q)$(MAKE) $(build)=scripts/basic

scripts/basic/%: scripts_basic ;

PHONY += outputmakefile
# outputmakefile 在输出目录中生成一个 Makefile，如果使用
# 单独的输出目录。这允许在
# 输出目录。
outputmakefile:
ifneq ($(KBUILD_SRC),)
	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile \
	    $(srctree) $(objtree) $(VERSION) $(PATCHLEVEL)
endif

# 确保我们不为任何 *config 目标包含 .config
# 尽早捕获它们，并将它们交给 scripts/kconfig/Makefile
# 调用make时允许指定更多的目标，包括
# 混合 *config 目标和构建目标。
# 例如'make oldconfig all'。
# 检测何时指定了混合目标，并进行第二次调用
# of make so .config 也不包括在这种情况下（对于 *config）。

no-dot-config-targets := clean mrproper distclean \
			 cscope TAGS tags help %docs check% \
			 include/target/version.h headers_% \
			 kernelrelease kernelversion

config-targets := 0
mixed-targets  := 0
dot-config     := 1

ifneq ($(filter $(no-dot-config-targets), $(MAKECMDGOALS)),)
	ifeq ($(filter-out $(no-dot-config-targets), $(MAKECMDGOALS)),)
		dot-config := 0
	endif
endif

ifneq ($(filter config %config,$(MAKECMDGOALS)),)
        config-targets := 1
        ifneq ($(filter-out config %config,$(MAKECMDGOALS)),)
                mixed-targets := 1
        endif
endif

ifeq ($(mixed-targets),1)
# ===========================================================================
# 我们被称为混合目标（*配置和构建目标）。
# 一一处理。

%:: FORCE
	$(Q)$(MAKE) -C $(srctree) KBUILD_SRC= $@

else
ifeq ($(config-targets),1)
# ===========================================================================
# *仅配置目标 -确保先决条件已更新，然后下降
# 在 scripts/kconfig 中创建 *config 目标

# 阅读 arch 特定的 Makefile 以根据需要设置 KBUILD_DEFCONFIG。
# KBUILD_DEFCONFIG 可能会指出一个替代的默认配置
# 用于'make defconfig'
include $(srctree)/arch/$(ARCH)/Makefile
export KBUILD_DEFCONFIG

config: scripts_basic outputmakefile FORCE
	$(Q)mkdir -p include/target include/config
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

%config: scripts_basic outputmakefile FORCE
	$(Q)mkdir -p include/target include/config
	$(Q)$(MAKE) $(build)=scripts/kconfig $@

else
# ===========================================================================
# 仅构建目标 -这包括内核、arch 特定目标、clean
# 目标和其他。一般来说，除了 *config 目标之外的所有目标。

# 内置脚本的额外助手/
# 仔细列出依赖项，这样我们就不会尝试构建脚本两次
# 在平行下
PHONY += scripts
scripts: scripts_basic include/config/auto.conf
	$(Q)$(MAKE) $(build)=$(@)

# 我们将链接到我们需要访问的内核/子目录的对象
init-y		:= init/
lab-y 		:= lab/
#libs-y		:= lib/
#drivers-y	:= drivers/
core-y		:=

ifeq ($(dot-config),1)
# 读入配置
-include include/config/auto.conf

# 读取所有 Kconfig*文件的依赖关系，确保运行
# oldconfig 如果检测到更改。
-include include/config/auto.conf.cmd

# 为避免任何隐式规则生效，定义一个空命令
$(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;

# 如果 .config 比 include/config/auto.conf 更新，有人修改过
# 用它忘了运行 make oldconfig。
# 如果 auto.conf.cmd 丢失那么我们可能在一个干净的树中所以
# 我们执行配置步骤以确保捕获更新的 Kconfig 文件
include/config/auto.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig

else
# 需要虚拟目标，因为用作先决条件
include/config/auto.conf: ;
endif # $(dot-config)

# all: target 是默认的，当没有给定目标时
# 命令行。
# 这允许用户仅发出“make”来构建内核
# 默认 openos 但它通常在 arch makefile 中被覆盖
all: openos

include $(srctree)/arch/$(ARCH)/Makefile
ifdef CONFIG_CC_OPT_SIZE
CFLAGS		+= -Os
endif
ifdef CONFIG_CC_OPT_SPEED
CFLAGS		+= -O2
endif

ifdef CONFIG_FRAME_POINTER
CFLAGS		+= -fno-omit-frame-pointer -fno-optimize-sibling-calls
else
CFLAGS		+= -fomit-frame-pointer
endif

ifdef CONFIG_CC_GEN_DEBUG
CFLAGS		+= -g
endif

NOSTDINC_FLAGS += -nostdinc -nostdlib

CHECKFLAGS     += $(NOSTDINC_FLAGS)

# 未指定特定目标时要构建的默认 openos 映像。
# KBUILD_IMAGE 可以在命令行或
# 在环境中设置
export KBUILD_IMAGE ?= openos

#
# INSTALL_PATH 指定放置更新内核和映射的位置
# 图片。默认为 /boot，但您可以将其设置为其他值
export	INSTALL_PATH ?= /boot

core-y		+= # kernel/ mm/

openos-dirs	:= $(patsubst %/,%,$(filter %/, $(init-y) $(init-m) \
		     $(libs-y) $(libs-m) \
		     $(core-y) $(core-m) \
		     $(drivers-y) $(drivers-m)))

openos-alldirs	:= $(sort $(openos-dirs) $(patsubst %/,%,$(filter %/, \
		     $(lib-n) $(lib-) \
		     $(init-n) $(init-) \
		     $(core-n) $(core-) \
		     $(drivers-n) $(drivers-))))

init-y		:= $(patsubst %/, %/built-in.lib, $(init-y))
libs-y		:= $(patsubst %/, %/built-in.lib, $(libs-y))
core-y		:= $(patsubst %/, %/built-in.lib, $(core-y))
drivers-y	:= $(patsubst %/, %/built-in.lib, $(drivers-y))

# 构建内核
# ---------------------------------------------------------------------------
# openos 是根据 $(openos-init) 和选择的对象构建的
# $(openos-main).大多数是顶级目录中的 built-in.lib 文件
# 在内核树中，其他在arch/$(ARCH)/Makefile中指定。
# 链接时的顺序很重要，$(openos-init) 必须在第一位。
#
# openos
#   ^
#   |
#   +-< $(openos-init)
#   |   +--< init/version.o + more
#   |
#   +--< $(openos-main)
#        +--< driver/built-in.lib mm/built-in.lib + more
#
# 内核版本（uname -v）在正常情况下无法更新
# descending-into-subdirs 阶段，因为我们还不知道是否需要
# 更新内核。
# 因此这一步被延迟到内核的最终链接之前。
#
# 生成System.map记录所有内核符号的地址

openos-init := $(head-y) $(init-y)
openos-main := $(core-y) $(libs-y) $(drivers-y)
openos-all  := $(openos-init) $(openos-main)
openos-lds  := arch/$(ARCH)/kernel/openos.lds
openos-map  := openos.map
export KBUILD_VMLINUX_OBJS := $(openos-all)

# 生成新的内核版本
quiet_cmd_openos_version = GEN     .version
      cmd_openos_version = set -e;                        \
	if [ ! -r .version ]; then			\
	  rm -f .version;				\
	  echo 1 >.version;				\
	else						\
	  mv .version .old_version;			\
	  expr 0$$(cat .old_version) + 1 >.version;	\
	fi;						\
	$(MAKE) $(build)=init

# 最终链接的内核。
quiet_cmd_openos = LD      $@
      cmd_openos = $(LD) $(LDFLAGS) $(LDFLAGS_openos) -o $@ \
	-T $(openos-lds) -Map $(openos-map) $(openos-init) \
	--start-group $(openos-main) --end-group \
	$(filter-out $(openos-lds) $(openos-init) $(openos-main) FORCE ,$^)
define rule_openos
	:
	+$(call cmd,openos)
	$(Q)echo 'cmd_$@ := $(cmd_openos)' > $(dot-target).cmd
endef

# 内核映像——包括更新的内核符号
openos: $(openos-lds) $(openos-init) $(openos-main) FORCE
	$(call if_changed_rule,openos)
	$(Q)rm -f .old_version

# 实际对象是在下降时生成的，
# 确保没有隐式规则启动
$(sort $(openos-init) $(openos-main) $(openos-lds)): $(openos-dirs) ;

# 处理下降到 $(openos-dirs) 中列出的子目录
# 预设语言环境变量以加快构建过程。限制语言环境
# 调整这个位置以避免运行时错误的语言设置
# 制作菜单配置等
# 错误信息仍然以原始语言显示

PHONY += $(openos-dirs)
$(openos-dirs): prepare scripts
	$(Q)$(MAKE) $(build)=$@

# 构建内核发布字符串
pattern = ".*/localversion[^~]*"
string  = $(shell cat /dev/null \
	   `find $(objtree) $(srctree) -maxdepth 1 -regex $(pattern) | sort -u`)

localver = $(subst $(space),, $(string) \
			      $(patsubst "%",%,$(CONFIG_LOCALVERSION)))

#如果设置了 CONFIG_LOCALVERSION_AUTO scripts/setlocalversion 被调用
#如果 SCM 已知，则附加来自 SCM 的标签。
#附加标签由使用的 SCM 决定。
#
#目前，仅支持 git。
#其他 SCM 可以编辑 scripts/setlocalversion 添加合适的
#根据需要检查。
ifdef CONFIG_LOCALVERSION_AUTO
	_localver-auto = $(shell $(CONFIG_SHELL) \
	                  $(srctree)/scripts/setlocalversion $(srctree))
	localver-auto  = $(LOCALVERSION)$(_localver-auto)
endif

localver-full = $(localver)$(localver-auto)

# 在 include/config/kernel.release 中存储（新的）KERNELRELASE 字符串
kernelrelease = $(KERNELVERSION)$(localver-full)
include/config/kernel.release: include/config/auto.conf FORCE
	$(Q)rm -f $@
	$(Q)echo $(kernelrelease) > $@

# 按依赖顺序列出
PHONY += prepare archprepare prepare0 prepare1 prepare2 prepare3

# prepare3 用于检查我们是否在单独的输出目录中构建，
# 如果是这样的话：
# 1) 检查内核src中是否没有执行make $(srctree)
# 2) 创建 include2 目录，用于第二个 asm 符号链接
prepare3: include/config/kernel.release
ifneq ($(KBUILD_SRC),)
	@echo '  Using $(srctree) as source for kernel'
	$(Q)if [ -f $(srctree)/.config -o -d $(srctree)/include/config ]; then \
		echo "  $(srctree) is not clean, please run 'make mrproper'";\
		echo "  in the '$(srctree)' directory.";\
		/bin/false; \
	fi;
	$(Q)if [ ! -d include2 ]; then mkdir -p include2; fi;
	$(Q)ln -fsn $(srctree)/include/asm-$(ARCH) include2/asm
endif

# 如果使用单独的输出目录，prepare2 会创建一个 makefile
prepare2: prepare3 outputmakefile

prepare1: prepare2 include/target/version.h include/target/utsrelease.h \
                   include/asm include/config/auto.conf

archprepare: prepare1

prepare0: archprepare FORCE
	$(Q)$(MAKE) $(build)=.

# 所有的准备..
prepare: prepare0

# 将其保留为预处理 openos.lds.S 的默认值，现在
# 在 arch/$(ARCH)/kernel/Makefile 中完成

export CPPFLAGS_openos.lds += -P -C -U$(ARCH)

# FIXME: 当 $(ARCH) 改变时，asm 符号链接改变。那是
# 很难检测到，但我想“make mrproper”是个好主意
# 无论如何在拱门之间切换之前。
# FIXME: SDCC 无法识别 cygwin 的符号链接

include/asm:
	@echo '  SYMLINK $@ -> arch/$(ARCH)/include/asm'
	$(Q)if [ ! -d include ]; then mkdir -p include; fi;
	@$(SYMLINK) $(TOPDIR)/arch/$(ARCH)/include/asm $@

# 生成一些文件
# ---------------------------------------------------------------------------

# KERNELRELEASE 可以从几个不同的地方改变，意思是 version.h
# 需要更新，因此对所有构建强制执行此检查

uts_len := 64
define filechk_utsrelease.h
	if [ `echo -n "$(KERNELRELEASE)" | wc -c ` -gt $(uts_len) ]; then \
	  echo '"$(KERNELRELEASE)" exceeds $(uts_len) characters' >&2;    \
	  exit 1;                                                         \
	fi;                                                               \
	(echo \#define UTS_RELEASE \"$(KERNELRELEASE)\";)
endef

define filechk_version.h
	(echo \#define LINUX_VERSION_CODE $(shell                             \
	expr $(VERSION) \* 65536 + $(PATCHLEVEL) \* 256 + $(SUBLEVEL));     \
	echo '#define KERNEL_VERSION(a,b,c) (((a) << 16) + ((b) << 8) + (c))';)
endef

include/target/version.h: $(srctree)/Makefile FORCE
	$(call filechk,version.h)

include/target/utsrelease.h: include/config/kernel.release FORCE
	$(call filechk,utsrelease.h)

###
# set up env for OpenOS。
# add by xddcore
# test pss at ubuntu
.PHONY:setenv
#以下makefile主要干两个活:
# 1.构建OpenOS编译环境
# 2.利用github上面的树莓派4b patch重新编译安装qemu-system-aarch64
setenv:
	sudo apt-get update
	sudo apt-get install -y qemu-system-arm libncurses5-dev gcc-aarch64-linux-gnu build-essential git bison flex libssl-dev
	sudo apt-get install -y ninja-build pkg-config libglib2.0-dev libmount-dev libpixman-1-dev
	git clone https://github.com/0xMirasio/qemu-patch-raspberry4.git; \
	cd qemu-patch-raspberry4; \
	mkdir build; \
	cd build; \
	../configure; \
	make; \
	make install; \


###
# 清洁分三层进行。
# make clean 删除大部分生成的文件
# make distclean 删除编辑器备份文件、补丁遗留文件等

# 使用“make clean”删除的目录和文件
CLEAN_FILES +=	openos openos.strip openos.map \
                .tmp_version .tmp_openos* .tmp_openos.map
CLEAN_DIRS += include/asm

# 使用“make mrproper”删除的目录和文件
MRPROPER_DIRS  += include/config include2 usr/include
MRPROPER_FILES += .config .config.old .version .old_version \
                  include/target/autoconf.h include/target/version.h      \
                  include/target/utsrelease.h                            \
		  Module.symvers tags TAGS cscope*

# clean -删除大部分，但留下足够的空间来构建外部模块
#
clean: rm-dirs  := $(CLEAN_DIRS)
clean: rm-files := $(CLEAN_FILES)
clean-dirs      := $(addprefix _clean_,$(srctree) $(openos-alldirs))

PHONY += $(clean-dirs) clean archclean
$(clean-dirs):
	$(Q)$(MAKE) $(clean)=$(patsubst _clean_%,%,$@)

clean: archclean $(clean-dirs)
	$(call cmd,rmdirs)
	$(call cmd,rmfiles)
	@find . $(RCS_FIND_IGNORE) \
		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
		-o -name '*.rel' -o -name '*.sym' -o -name '*.lst' \
		-o -name '*.hex' -o -name '*.mem' -o -name '*.lnk' \
		-o -name '*.asm' -o -name '*.rst' -o -name '*.lib' \
		-o -name '*.adb' \
		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \) \
		-type f -print | xargs rm -f

# mrproper -删除所有生成的文件，包括.config
#
mrproper: rm-dirs  := $(wildcard $(MRPROPER_DIRS))
mrproper: rm-files := $(wildcard $(MRPROPER_FILES))
mrproper-dirs      := $(addprefix _mrproper_, scripts)

PHONY += $(mrproper-dirs) mrproper archmrproper
$(mrproper-dirs):
	$(Q)$(MAKE) $(clean)=$(patsubst _mrproper_%,%,$@)

mrproper: clean archmrproper $(mrproper-dirs)
	$(call cmd,rmdirs)
	$(call cmd,rmfiles)

# distclean
#
PHONY += distclean

distclean: mrproper
	@find $(srctree) $(RCS_FIND_IGNORE) \
		\( -name '*.orig' -o -name '*.rej' -o -name '*~' \
		-o -name '*.bak' -o -name '#*#' -o -name '.*.orig' \
		-o -name '.*.rej' -o -size 0 \
		-o -name '*%' -o -name '.*.cmd' -o -name 'core' \) \
		-type f -print | xargs rm -f

help:
	@echo  'Cleaning targets:'
	@echo  '  clean		  - Remove most generated files but keep the config and'
	@echo  '  mrproper	  - Remove all generated files + config + various backup files'
	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
	@echo  ''
	@echo  'Other generic targets:'
	@echo  '  all		  - Build all targets marked with [*]'
	@echo  '  kernelrelease	  - Output the release version string'
	@echo  '  make V=0|1 [targets] 0 => quiet build (default), 1 => verbose build'
	@echo  ''
	@echo  'Execute "make" or "make all" to build all targets marked with [*] '
	@echo  'For further info see the ./README file'

endif #ifeq ($(config-targets),1)
endif #ifeq ($(mixed-targets),1)

PHONY += kernelrelease kernelversion
kernelrelease:
	$(if $(wildcard include/config/kernel.release), $(Q)echo $(KERNELRELEASE), \
		$(error kernelrelease not valid - run 'make prepare' to update it))
kernelversion:
	@echo $(KERNELVERSION)

# FIXME 应该进入 make.lib 或其他东西
# ===========================================================================

quiet_cmd_rmdirs = $(if $(wildcard $(rm-dirs)),CLEAN   $(wildcard $(rm-dirs)))
      cmd_rmdirs = rm -rf $(rm-dirs)

quiet_cmd_rmfiles = $(if $(wildcard $(rm-files)),CLEAN   $(wildcard $(rm-files)))
      cmd_rmfiles = rm -f $(rm-files)


a_flags = -Wp,-MD,$(depfile) $(AFLAGS) $(AFLAGS_KERNEL) \
	  $(NOSTDINC_FLAGS) $(CPPFLAGS) \
	  $(modkern_aflags) $(EXTRA_AFLAGS) $(AFLAGS_$(basetarget).o)

quiet_cmd_as_o_S = AS      $@
cmd_as_o_S       = $(CC) $(a_flags) -c -o $@ $<

# 读取所有保存的命令行

targets := $(wildcard $(sort $(targets)))
cmd_files := $(wildcard .*.cmd $(foreach f,$(targets),$(dir $(f)).$(notdir $(f)).cmd))

ifneq ($(cmd_files),)
  $(cmd_files): ;	# 不要尝试更新包含的依赖文件
  include $(cmd_files)
endif

# $(Q)$(MAKE) -f scripts/Makefile.clean obj=dir 的简写
# 用法：
# $(Q)$(MAKE) $(clean)=dir
clean := -f $(if $(KBUILD_SRC),$(srctree)/)scripts/Makefile.clean obj

endif	# skip-makefile

PHONY += FORCE
FORCE:

# Cancel implicit rules on top Makefile, `-rR' will apply to sub-makes.
Makefile: ;

# Declare the contents of the .PHONY variable as phony.  We keep that
# information in a variable se we can use it in if_changed and friends.
.PHONY: $(PHONY)
