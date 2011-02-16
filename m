From: Randy Dunlap <randy.dunlap@oracle.com>
Subject: [PATCH -next] platform/x86: intel_mid_powerbutton needs INPUT
Date: Wed, 16 Feb 2011 14:31:02 -0800
Message-ID: <20110216143102.04bc6754.randy.dunlap@oracle.com>
References: <20110216165321.c8238ed5.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20110216165321.c8238ed5.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Hong Liu <hong.liu@intel.com>
Cc: linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Randy Dunlap <randy.dunlap@oracle.com>

intel_mid_powerbtn.c uses input interfaces, so it should depend
on INPUT to fix build errors when CONFIG_INPUT is not enabled:

intel_mid_powerbtn.c:(.text+0x56ca8f): undefined reference to `input_event'
intel_mid_powerbtn.c:(.devinit.text+0x2e7b4): undefined reference to `input_allocate_device'
intel_mid_powerbtn.c:(.devinit.text+0x2e7ff): undefined reference to `input_set_capability'
intel_mid_powerbtn.c:(.devinit.text+0x2e84a): undefined reference to `input_register_device'
intel_mid_powerbtn.c:(.devinit.text+0x2e88b): undefined reference to `input_free_device'
intel_mid_powerbtn.c:(.devexit.text+0x42f0): undefined reference to `input_unregister_device'

Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Hong Liu <hong.liu@intel.com>
---
 drivers/platform/x86/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20110216.orig/drivers/platform/x86/Kconfig
+++ linux-next-20110216/drivers/platform/x86/Kconfig
@@ -607,7 +607,7 @@ config INTEL_MFLD_THERMAL
 
 config INTEL_MID_POWER_BUTTON
 	tristate "power button driver for Intel MID platforms"
-	depends on INTEL_SCU_IPC
+	depends on INTEL_SCU_IPC && INPUT
 	help
 	  This driver handles the power button on the Intel MID platforms.
 
