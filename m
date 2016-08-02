From: Baole Ni <baolex.ni@intel.com>
Subject: [PATCH 0110/1285] Replace numeric parameter like 0444 with macro
Date: Tue,  2 Aug 2016 18:41:25 +0800
Message-ID: <20160802104125.21089-1-baolex.ni@intel.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:27602 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754850AbcHBLTR (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 2 Aug 2016 07:19:17 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: arnd@arndb.de, gregkh@linuxfoundation.org, malattia@linux.it, hpa@zytor.com, x86@kernel.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, chuansheng.liu@intel.com, baolex.ni@intel.com, jslaby@suse.cz, peter@korsgaard.com, lee.jones@linaro.org

I find that the developers often just specified the numeric value
when calling a macro which is defined with a parameter for access permission.
As we know, these numeric value for access permission have had the corresponding macro,
and that using macro can improve the robustness and readability of the code,
thus, I suggest replacing the numeric parameter with the macro.

Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
Signed-off-by: Baole Ni <baolex.ni@intel.com>
---
 drivers/char/sonypi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/char/sonypi.c b/drivers/char/sonypi.c
index e496dae..0e206d1 100644
--- a/drivers/char/sonypi.c
+++ b/drivers/char/sonypi.c
@@ -70,36 +70,36 @@ MODULE_PARM_DESC(minor,
 		 "minor number of the misc device, default is -1 (automatic)");
 
 static int verbose;		/* = 0 */
-module_param(verbose, int, 0644);
+module_param(verbose, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(verbose, "be verbose, default is 0 (no)");
 
 static int fnkeyinit;		/* = 0 */
-module_param(fnkeyinit, int, 0444);
+module_param(fnkeyinit, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(fnkeyinit,
 		 "set this if your Fn keys do not generate any event");
 
 static int camera;		/* = 0 */
-module_param(camera, int, 0444);
+module_param(camera, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(camera,
 		 "set this if you have a MotionEye camera (PictureBook series)");
 
 static int compat;		/* = 0 */
-module_param(compat, int, 0444);
+module_param(compat, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(compat,
 		 "set this if you want to enable backward compatibility mode");
 
 static unsigned long mask = 0xffffffff;
-module_param(mask, ulong, 0644);
+module_param(mask, ulong, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(mask,
 		 "set this to the mask of event you want to enable (see doc)");
 
 static int useinput = 1;
-module_param(useinput, int, 0444);
+module_param(useinput, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(useinput,
 		 "set this if you would like sonypi to feed events to the input subsystem");
 
 static int check_ioport = 1;
-module_param(check_ioport, int, 0444);
+module_param(check_ioport, int, S_IRUSR | S_IRGRP | S_IROTH);
 MODULE_PARM_DESC(check_ioport,
 		 "set this to 0 if you think the automatic ioport check for sony-laptop is wrong");
 
-- 
2.9.2
