From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v9 14/20] usb: typec: mux: Convert the Intel PMC Mux driver to use new SCU IPC API
Date: Thu, 16 Apr 2020 11:15:46 +0300
Message-ID: <20200416081552.68083-15-mika.westerberg@linux.intel.com>
References: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20200416081552.68083-1-mika.westerberg@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Lee Jones <lee.jones@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Zha Qipeng <qipeng.zha@intel.com>, "David E . Box" <david.e.box@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

From: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Convert the driver to use the new SCU IPC API. This allows us to get rid
of the duplicate PMC IPC implementation which is now covered in SCU IPC
driver.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/usb/typec/mux/Kconfig         |  2 +-
 drivers/usb/typec/mux/intel_pmc_mux.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
index 77eb97b2aa86..a4dbd11f8ee2 100644
--- a/drivers/usb/typec/mux/Kconfig
+++ b/drivers/usb/typec/mux/Kconfig
@@ -11,7 +11,7 @@ config TYPEC_MUX_PI3USB30532
 
 config TYPEC_MUX_INTEL_PMC
 	tristate "Intel PMC mux control"
-	depends on INTEL_PMC_IPC
+	depends on INTEL_SCU_IPC
 	select USB_ROLE_SWITCH
 	help
 	  Driver for USB muxes controlled by Intel PMC FW. Intel PMC FW can
diff --git a/drivers/usb/typec/mux/intel_pmc_mux.c b/drivers/usb/typec/mux/intel_pmc_mux.c
index f5c5e0aef66f..fce255e28a00 100644
--- a/drivers/usb/typec/mux/intel_pmc_mux.c
+++ b/drivers/usb/typec/mux/intel_pmc_mux.c
@@ -15,7 +15,7 @@
 #include <linux/usb/typec_dp.h>
 #include <linux/usb/typec_tbt.h>
 
-#include <asm/intel_pmc_ipc.h>
+#include <asm/intel_scu_ipc.h>
 
 #define PMC_USBC_CMD		0xa7
 
@@ -96,6 +96,7 @@ struct pmc_usb_port {
 struct pmc_usb {
 	u8 num_ports;
 	struct device *dev;
+	struct intel_scu_ipc_dev *ipc;
 	struct pmc_usb_port *port;
 };
 
@@ -107,9 +108,8 @@ static int pmc_usb_command(struct pmc_usb_port *port, u8 *msg, u32 len)
 	 * Error bit will always be 0 with the USBC command.
 	 * Status can be checked from the response message.
 	 */
-	intel_pmc_ipc_command(PMC_USBC_CMD, 0, msg, len,
-			      (void *)response, 1);
-
+	intel_scu_ipc_dev_command(port->pmc->ipc, PMC_USBC_CMD, 0, msg, len,
+				  response, sizeof(response));
 	if (response[2]) {
 		if (response[2] & BIT(1))
 			return -EIO;
@@ -370,6 +370,10 @@ static int pmc_usb_probe(struct platform_device *pdev)
 	if (!pmc->port)
 		return -ENOMEM;
 
+	pmc->ipc = devm_intel_scu_ipc_dev_get(&pdev->dev);
+	if (!pmc->ipc)
+		return -ENODEV;
+
 	pmc->dev = &pdev->dev;
 
 	/*
-- 
2.25.1
