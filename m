From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] platform/x86: intel_mid_powerbtn: fix error return code in
 mid_pb_probe()
Date: Wed, 9 Aug 2017 11:00:54 -0500
Message-ID: <20170809160054.GA27501@embeddedgus>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavo@embeddedor.com>
List-Id: platform-driver-x86.vger.kernel.org

platform_get_irq() returns an error code, but the intel_mid_powerbtn
driver ignores it and always returns -EINVAL. This is not correct and,
prevents -EPROBE_DEFER from being propagated properly.

Print error message and propagate the return value of platform_get_irq
on failure.

This issue was detected with the help of Coccinelle.

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/platform/x86/intel_mid_powerbtn.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel_mid_powerbtn.c b/drivers/platform/x86/intel_mid_powerbtn.c
index 871cfa6..854a16d 100644
--- a/drivers/platform/x86/intel_mid_powerbtn.c
+++ b/drivers/platform/x86/intel_mid_powerbtn.c
@@ -142,8 +142,10 @@ static int mid_pb_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	if (irq < 0)
-		return -EINVAL;
+	if (irq < 0) {
+		dev_err(&pdev->dev, "Failed to get IRQ: %d\n", irq);
+		return irq;
+	}
 
 	input = devm_input_allocate_device(&pdev->dev);
 	if (!input)
-- 
2.5.0
