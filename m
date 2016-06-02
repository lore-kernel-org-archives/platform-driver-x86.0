From: Dave Hansen <dave@sr71.net>
Subject: [PATCH 15/20] x86, intel_telemetry: use Intel family name macros for telemetry driver
Date: Wed, 01 Jun 2016 17:12:18 -0700
Message-ID: <20160602001218.D3434548@viggo.jf.intel.com>
References: <20160602001157.D8BE59D7@viggo.jf.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160602001157.D8BE59D7@viggo.jf.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: x86@kernel.org, Dave Hansen <dave@sr71.net>, dave.hansen@linux.intel.com, souvik.k.chakravarty@intel.com, dvhart@infradead.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


From: Dave Hansen <dave.hansen@linux.intel.com>

Another straightforward replacement of magic numbers.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
---

 b/drivers/platform/x86/intel_telemetry_debugfs.c |    3 ++-
 b/drivers/platform/x86/intel_telemetry_pltdrv.c  |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff -puN drivers/platform/x86/intel_telemetry_debugfs.c~x86-intel-families-telemetry drivers/platform/x86/intel_telemetry_debugfs.c
--- a/drivers/platform/x86/intel_telemetry_debugfs.c~x86-intel-families-telemetry	2016-06-01 15:45:08.962162099 -0700
+++ b/drivers/platform/x86/intel_telemetry_debugfs.c	2016-06-01 15:45:08.967162327 -0700
@@ -32,6 +32,7 @@
 #include <linux/suspend.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
 #include <asm/intel_pmc_ipc.h>
 #include <asm/intel_punit_ipc.h>
 #include <asm/intel_telemetry.h>
@@ -331,7 +332,7 @@ static struct telemetry_debugfs_conf tel
 };
 
 static const struct x86_cpu_id telemetry_debugfs_cpu_ids[] = {
-	TELEM_DEBUGFS_CPU(0x5c, telem_apl_debugfs_conf),
+	TELEM_DEBUGFS_CPU(INTEL_FAM6_MODEL_ATOM_GOLDMONT, telem_apl_debugfs_conf),
 	{}
 };
 
diff -puN drivers/platform/x86/intel_telemetry_pltdrv.c~x86-intel-families-telemetry drivers/platform/x86/intel_telemetry_pltdrv.c
--- a/drivers/platform/x86/intel_telemetry_pltdrv.c~x86-intel-families-telemetry	2016-06-01 15:45:08.964162191 -0700
+++ b/drivers/platform/x86/intel_telemetry_pltdrv.c	2016-06-01 15:45:08.968162373 -0700
@@ -28,6 +28,7 @@
 #include <linux/platform_device.h>
 
 #include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
 #include <asm/intel_pmc_ipc.h>
 #include <asm/intel_punit_ipc.h>
 #include <asm/intel_telemetry.h>
@@ -163,7 +164,7 @@ static struct telemetry_plt_config telem
 };
 
 static const struct x86_cpu_id telemetry_cpu_ids[] = {
-	TELEM_CPU(0x5c, telem_apl_config),
+	TELEM_CPU(INTEL_FAM6_MODEL_ATOM_GOLDMONT, telem_apl_config),
 	{}
 };
 
_
