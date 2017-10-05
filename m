From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/6] platform/x86: intel_ips: Use PCI_VDEVICE() macro
Date: Thu,  5 Oct 2017 14:54:17 +0300
Message-ID: <20171005115420.2786-3-andriy.shevchenko@linux.intel.com>
References: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171005115420.2786-1-andriy.shevchenko@linux.intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Intel vendor ID is defined globally, thus we may use PCI_VDEVICE().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel_ips.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 6f6900065bc2..489ff6fff9f9 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1482,8 +1482,7 @@ ips_link_to_i915_driver(void)
 EXPORT_SYMBOL_GPL(ips_link_to_i915_driver);
 
 static const struct pci_device_id ips_id_table[] = {
-	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL,
-		     PCI_DEVICE_ID_INTEL_THERMAL_SENSOR), },
+	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_INTEL_THERMAL_SENSOR), },
 	{ 0, }
 };
 
-- 
2.14.2
