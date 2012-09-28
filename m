From: Lv Zheng <lv.zheng@intel.com>
Subject: [RESEND PATCH v4 0/2] ACPI: DBGP/DBG2 early console support for LPIA.
Date: Fri, 28 Sep 2012 13:36:35 +0800
Message-ID: <cover.1348652044.git.lv.zheng__27410.249823197$1348810716$gmane$org@intel.com>
References: <cover.1347453194.git.zetalog@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:1189 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750900Ab2I1FhS (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 28 Sep 2012 01:37:18 -0400
In-Reply-To: <cover.1347453194.git.zetalog@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Len Brown <len.brown@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Jason Wessel <jason.wessel@windriver.com>, Feng Tang <feng.tang@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, x86@kernel.org, platform-driver-x86@vger.kernel.org, Lv Zheng <lv.zheng@intel.com>

Microsoft Debug Port Table (DBGP or DBG2) is used by the Windows SoC
platforms to describe their debugging facilities.
Recent Low Power Intel Architecture (LPIA) platforms have utilized
this for the SPI UART debug ports that are resident on their debug
boards.

This patch set enables the DBGP/DBG2 debug ports as an Linux early
console launcher.
The SPI UART debug ports support is also refined to co-exist with this
new usage model.

To use this facility on LPIA platforms, you need to enable the following
kernel configurations:
  CONFIG_EARLY_PRINTK_ACPI=y
  CONFIG_EARLY_PRINTK_INTEL_MID_SPI=y
Then you need to append the following kernel parameter to the kernel
command line in your the boot loader configuration file:
  earlyprintk=acpi

There is a dilemma in designing this patch set.  Let me describe it in
details.

There should be three steps to enable an early console for an operating
system:
1. Probe: In this stage, the Linux kernel can detect the early consoles
          and the base address of their register block can be determined.
          This can be done by parsing the descriptors in the ACPI DBGP/DBG2
          tables.  Note that acpi_table_init() must be called before
          parsing.
2. Setup: In this stage, the Linux kernel can apply user specified
          configuration options (ex. baudrate of serial ports) for the
          early consoles.  This is done by parsing the early parameters
          passed to the kernel from the boot loaders.  Note that
          parse_early_params() is called very early to allow parameters to
          be passed to other kernel subsystems.
3. Start: In this stage, the Linux kernel can make the consoles ready to
          output logs.  Since the early consoles are always used for the
          kernel boot up debugging, this must be done as early as possible
          to arm the kernel with the highest testability for other kernel
          subsystems.  Note that, this stage happens when the
          register_console() is called.
The preferred sequence for the above steps is:
   +-----------------+    +-------------------+    +--------------------+
   | ACPI DBGP PROBE | -> | EARLY_PARAM SETUP | -> | EARLY_RPINTK START |
   +-----------------+    +-------------------+    +--------------------+
But unfortunately, in the current x86 implementation, early parameters and
early printk initialization are called before acpi_table_init() which
depends on the early memory mapping facility.
There are some choices for me to design this patch set:
1. Invoking acpi_table_init() before parse_early_param() to maintain the
   sequence:
   +-----------------+    +-------------------+    +--------------------+
   | ACPI DBGP PROBE | -> | EARLY_PARAM SETUP | -> | EARLY_RPINTK START |
   +-----------------+    +-------------------+    +--------------------+
   This requires other subsystem maintainers' review to ensure no
   regressions will be introduced.  At the first glance, I found there
   might be problems for the EFI subsystsm:
   The EFI boot services and runtime services are mixed up in the x86
   specific initialization process before the ACPI table initialization.
   Things are much worse that you even cannot disable the runtime services
   while still allow the boot services codes to be executed in the kernel
   compilation stage.  Enabling the early consoles after the ACPI table
   initialization will make it difficult to debug the runtime BIOS bugs.
   If any progress is made to the kernel boot sequences, please let me
   know.  I'll be willing to redesign the ACPI DBGP/DBG2 console probing
   facility.  You can reach me at <lv.zheng@intel.com> and
   <zetalog@gmail.com>.
2. Modifying the above sequece to make it look like:
   +-------------------+    +-----------------+    +--------------------+
   | EARLY_PARAM SETUP | -> | ACPI DBGP PROBE | -> | EARLY_RPINTK START |
   +-------------------+    +-----------------+    +--------------------+
   Early consoles started in this style will lose part of the testability
   in the kernel boot up sequence.  If the system does not crash very
   early, developers still can see the bufferred kernel outputs when the
   register_console() is called.
   Current early console implementations need to be modified to be
   compatible with this design.  The original codes need to be split up
   into tow parts:
   1. Detecting hardware.  This part can be called in the PROBE stage.
   2. Applying user parameters.  This part can be called in the SETUP
      stage.
   Individual early console drver maintainers need to be involved to avoid
   regressions that might occur if we do things in this way.  And the
   maintainers can offer better tests than I can do. 
3. Introducing a brand new debugging facility that does not relate to the
   current early console implementation to allow the early consoles to be
   automatically detected.
   +-------------------+    +--------------------+
   | EARLY_PARAM SETUP | -> | EARLY_RPINTK START |
   +-------------------+    +--------------------+
   +-----------------+    +--------------------+
   | ACPI DBGP PROBE | -> | EARLY_RPINTK START |
   +-----------------+    +--------------------+
   Early consoles started in this style will lose part of the testability
   in the kernel boot up sequence.  If the system does not crash very
   early, developers still can see the bufferred kernel outputs when the
   register_console() is called.
   Comparing to the solution 2, we can notice that the user configuration
   can not be applied to the registered early consoles in this way as the
   acpi_table_init() is still called after the parse_early_param().
   Instead, the early consoles should derive the hardware settings used in
   the BIOS/bootloaders.
   This is what the patch set has done to enable this new usage model.
   It is known as "ACPI early console launcher mode".
   As a launcher, ACPI DBGP will not actually output kernel messages
   without the real early console drivers, that's why the
   CONFIG_EARLY_PRINTK_INTEL_MID_SPI still need to be enabled along with
   the CONFIG_EARLY_PRINTK_ACPI.
   In order to disable this facility by default and enable it at runtime,
   an kernel parameter "earlyprintk=acpi" is introduced.  This makes the
   actual sequence look like:
   +-------------------+    +--------------------+
   | EARLY_PARAM SETUP | -> | EARLY_RPINTK START |
   +-------------------+    +....................+
                            | ACPI DBGP LAUNCH   | ->
                            +--------------------+
      +-----------------+    +--------------------+
   -> | ACPI DBGP PROBE | -> | EARLY_PRINTK START |
      +-----------------+    +--------------------+

Version 3 of this patch set is the first version that will be published
in the Linux community.  Earlier versions are reviewed internally in
Intel.  This patch set keeps the version number to track the history
that is known to Intel internal developers.
Version 4 of this patch set fixed bunch of CodingStyle issues.

Lv Zheng (2):
  ACPI: Add early console framework for DBGP/DBG2.
  ACPI: Add Intel MID SPI early console support.

 Documentation/kernel-parameters.txt        |    2 +
 arch/x86/Kconfig.debug                     |   38 +++++
 arch/x86/include/asm/mrst.h                |    2 +-
 arch/x86/kernel/acpi/boot.c                |    1 +
 arch/x86/kernel/early_printk.c             |   25 +++-
 arch/x86/platform/mrst/early_printk_mrst.c |  186 +----------------------
 drivers/acpi/Makefile                      |    2 +
 drivers/acpi/early_printk.c                |  201 +++++++++++++++++++++++++
 drivers/platform/x86/Makefile              |    2 +
 drivers/platform/x86/early/Makefile        |    5 +
 drivers/platform/x86/early/intel_mid_spi.c |  220 ++++++++++++++++++++++++++++
 include/acpi/actbl2.h                      |    1 +
 include/linux/acpi.h                       |   24 +++
 include/linux/intel_mid_early.h            |   12 ++
 14 files changed, 540 insertions(+), 181 deletions(-)
 create mode 100644 drivers/acpi/early_printk.c
 create mode 100644 drivers/platform/x86/early/Makefile
 create mode 100644 drivers/platform/x86/early/intel_mid_spi.c
 create mode 100644 include/linux/intel_mid_early.h

-- 
1.7.10
