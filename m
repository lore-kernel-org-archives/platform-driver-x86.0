From: Alan Cox <alan@linux.intel.com>
Subject: [PATCH 01/11] intel_scu_ipc: detect CPU type automatically
Date: Mon, 26 Jul 2010 10:02:25 +0100
Message-ID: <20100726090222.12329.19653.stgit@localhost.localdomain>
References: <20100726090031.12329.53555.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mga03.intel.com ([143.182.124.21]:46606 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753835Ab0GZJfv (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 26 Jul 2010 05:35:51 -0400
In-Reply-To: <20100726090031.12329.53555.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org, mjg@redhat.com

From: Sreedhara DS <sreedhara.ds@intel.com>

Intel SCU message formats depend upon the processor type. Replace the
module option with automatic detection of the processor type.

Signed-off-by: Sreedhara DS <sreedhara.ds@intel.com>
---

 drivers/platform/x86/intel_scu_ipc.c |   19 ++++++++++++-------
 1 files changed, 12 insertions(+), 7 deletions(-)


diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index bb2f1fb..b6a0344 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -23,7 +23,7 @@
 #include <linux/pm.h>
 #include <linux/pci.h>
 #include <linux/interrupt.h>
-#include <asm/setup.h>
+#include <asm/mrst.h>
 #include <asm/intel_scu_ipc.h>
 
 /* IPC defines the following message types */
@@ -78,12 +78,9 @@ struct intel_scu_ipc_dev {
 
 static struct intel_scu_ipc_dev  ipcdev; /* Only one for now */
 
-static int platform = 1;
-module_param(platform, int, 0);
-MODULE_PARM_DESC(platform, "1 for moorestown platform");
-
-
-
+#define PLATFORM_LANGWELL 1
+#define PLATFORM_PENWELL 2
+static int platform;		/* Platform type */
 
 /*
  * IPC Read Buffer (Read Only):
@@ -817,6 +814,14 @@ static struct pci_driver ipc_driver = {
 
 static int __init intel_scu_ipc_init(void)
 {
+	if (boot_cpu_data.x86 == 6 &&
+		boot_cpu_data.x86_model == 0x27 &&
+		boot_cpu_data.x86_mask == 1)
+			platform = PLATFORM_PENWELL;
+	else if (boot_cpu_data.x86 == 6 &&
+		boot_cpu_data.x86_model == 0x26)
+			platform = PLATFORM_LANGWELL;
+
 	return  pci_register_driver(&ipc_driver);
 }
 
