From: Kulikov Vasiliy <segooon@gmail.com>
Subject: [PATCH 08/11] x86: intel_ips: do not use PCI resources before pci_enable_device()
Date: Tue,  3 Aug 2010 19:44:16 +0400
Message-ID: <1280850257-6169-1-git-send-email-segooon@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kernel-janitors@vger.kernel.org
Cc: Matthew Garrett <mjg@redhat.com>, Jesse Barnes <jbarnes@virtuousgeek.org>, Jiri Slaby <jslaby@suse.cz>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

IRQ and resource[] may not have correct values until
after PCI hotplug setup occurs at pci_enable_device() time.

The semantic match that finds this problem is as follows:

// <smpl>
@@
identifier x;
identifier request ~= "pci_request.*|pci_resource.*";
@@

(
* x->irq
|
* x->resource
|
* request(x, ...)
)
 ...
*pci_enable_device(x)
// </smpl>

Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
---
 drivers/platform/x86/intel_ips.c |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
index 0344822..90c9549 100644
--- a/drivers/platform/x86/intel_ips.c
+++ b/drivers/platform/x86/intel_ips.c
@@ -1432,6 +1432,12 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	spin_lock_init(&ips->turbo_status_lock);
 
+	ret = pci_enable_device(dev);
+	if (ret) {
+		dev_err(&dev->dev, "can't enable PCI device, aborting\n");
+		goto error_free;
+	}
+
 	if (!pci_resource_start(dev, 0)) {
 		dev_err(&dev->dev, "TBAR not assigned, aborting\n");
 		ret = -ENXIO;
@@ -1444,11 +1450,6 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		goto error_free;
 	}
 
-	ret = pci_enable_device(dev);
-	if (ret) {
-		dev_err(&dev->dev, "can't enable PCI device, aborting\n");
-		goto error_free;
-	}
 
 	ips->regmap = ioremap(pci_resource_start(dev, 0),
 			      pci_resource_len(dev, 0));
-- 
1.7.0.4
