From: Mike Travis <mike.travis@hpe.com>
Subject: [PATCH 03/12] x86/platform/uv: Adjust references in UV kernel modules
Date: Mon, 07 Sep 2020 13:54:33 -0500
Message-ID: <20200907185430.685975987@hpe.com>
References: <20200907185430.363197758@hpe.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>, Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@suse.de>
Cc: Dimitri Sivanich <dimitri.sivanich@hpe.com>, "H. Peter Anvin" <hpa@zytor.com>, Russ Anderson <russ.anderson@hpe.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Alexandre Chartre <alexandre.chartre@oracle.com>, Jian Cai <caij2003@gmail.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There is a symbol clash from the auto-generated uv_mmrs.h file that
clashes with code in the UV kernel modules (is_uv() is the symbol).
Change those prior to the symbol clash so as to not cause a compile error.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
Reviewed-by: Steve Wahl <steve.wahl@hpe.com>
---
 drivers/misc/sgi-xp/xp.h            |   11 ++++++-----
 drivers/misc/sgi-xp/xp_main.c       |    7 ++++---
 drivers/misc/sgi-xp/xp_uv.c         |    9 ++++++---
 drivers/misc/sgi-xp/xpc_main.c      |    9 +++++----
 drivers/misc/sgi-xp/xpc_partition.c |    5 +++--
 drivers/misc/sgi-xp/xpnet.c         |    5 +++--
 6 files changed, 27 insertions(+), 19 deletions(-)

--- linux.orig/drivers/misc/sgi-xp/xp.h
+++ linux/drivers/misc/sgi-xp/xp.h
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (C) 2004-2008 Silicon Graphics, Inc. All rights reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -17,11 +18,11 @@
 
 #if defined CONFIG_X86_UV || defined CONFIG_IA64_SGI_UV
 #include <asm/uv/uv.h>
-#define is_uv()		is_uv_system()
+#define is_uv_sys()		is_uv_system()
 #endif
 
-#ifndef is_uv
-#define is_uv()		0
+#ifndef is_uv_sys
+#define is_uv_sys()		0
 #endif
 
 #ifdef USE_DBUG_ON
@@ -79,7 +80,7 @@
 
 #define XPC_MSG_SIZE(_payload_size) \
 				ALIGN(XPC_MSG_HDR_MAX_SIZE + (_payload_size), \
-				      is_uv() ? 64 : 128)
+				      is_uv_sys() ? 64 : 128)
 
 
 /*
--- linux.orig/drivers/misc/sgi-xp/xp_main.c
+++ linux/drivers/misc/sgi-xp/xp_main.c
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (c) 2004-2008 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -233,7 +234,7 @@ xp_init(void)
 	for (ch_number = 0; ch_number < XPC_MAX_NCHANNELS; ch_number++)
 		mutex_init(&xpc_registrations[ch_number].mutex);
 
-	if (is_uv())
+	if (is_uv_sys())
 		ret = xp_init_uv();
 	else
 		ret = 0;
@@ -249,7 +250,7 @@ module_init(xp_init);
 void __exit
 xp_exit(void)
 {
-	if (is_uv())
+	if (is_uv_sys())
 		xp_exit_uv();
 }
 
--- linux.orig/drivers/misc/sgi-xp/xp_uv.c
+++ linux/drivers/misc/sgi-xp/xp_uv.c
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (c) 2008 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -148,7 +149,9 @@ xp_restrict_memprotect_uv(unsigned long
 enum xp_retval
 xp_init_uv(void)
 {
-	BUG_ON(!is_uv());
+	WARN_ON(!is_uv_sys());
+	if (!is_uv_sys())
+		return xpUnsupported;
 
 	xp_max_npartitions = XP_MAX_NPARTITIONS_UV;
 #ifdef CONFIG_X86
@@ -168,5 +171,5 @@ xp_init_uv(void)
 void
 xp_exit_uv(void)
 {
-	BUG_ON(!is_uv());
+	WARN_ON(!is_uv_sys());
 }
--- linux.orig/drivers/misc/sgi-xp/xpc_main.c
+++ linux/drivers/misc/sgi-xp/xpc_main.c
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (c) 2004-2009 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -1043,7 +1044,7 @@ xpc_do_exit(enum xp_retval reason)
 
 	xpc_teardown_partitions();
 
-	if (is_uv())
+	if (is_uv_sys())
 		xpc_exit_uv();
 }
 
@@ -1226,7 +1227,7 @@ xpc_init(void)
 	dev_set_name(xpc_part, "part");
 	dev_set_name(xpc_chan, "chan");
 
-	if (is_uv()) {
+	if (is_uv_sys()) {
 		ret = xpc_init_uv();
 
 	} else {
@@ -1312,7 +1313,7 @@ out_2:
 
 	xpc_teardown_partitions();
 out_1:
-	if (is_uv())
+	if (is_uv_sys())
 		xpc_exit_uv();
 	return ret;
 }
--- linux.orig/drivers/misc/sgi-xp/xpc_partition.c
+++ linux/drivers/misc/sgi-xp/xpc_partition.c
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (c) 2004-2008 Silicon Graphics, Inc.  All Rights Reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -433,7 +434,7 @@ xpc_discovery(void)
 	 */
 	region_size = xp_region_size;
 
-	if (is_uv())
+	if (is_uv_sys())
 		max_regions = 256;
 	else {
 		max_regions = 64;
--- linux.orig/drivers/misc/sgi-xp/xpnet.c
+++ linux/drivers/misc/sgi-xp/xpnet.c
@@ -3,7 +3,8 @@
  * License.  See the file "COPYING" in the main directory of this archive
  * for more details.
  *
- * Copyright (C) 1999-2009 Silicon Graphics, Inc. All rights reserved.
+ * Copyright (c) 2018-2020 Hewlett Packard Enterprise Development LP
+ * Copyright (c) 2008-2017 Silicon Graphics, Inc.  All Rights Reserved.
  */
 
 /*
@@ -515,7 +516,7 @@ xpnet_init(void)
 {
 	int result;
 
-	if (!is_uv())
+	if (!is_uv_sys())
 		return -ENODEV;
 
 	dev_info(xpnet, "registering network device %s\n", XPNET_DEVICE_NAME);
