From: Yisheng Xie <xieyisheng1@huawei.com>
Subject: [PATCH v3 09/27] platform/x86: replace devm_ioremap_nocache with devm_ioremap
Date: Sat, 23 Dec 2017 18:58:59 +0800
Message-ID: <1514026739-33006-1-git-send-email-xieyisheng1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from szxga04-in.huawei.com ([45.249.212.190]:2721 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1757168AbdLWLHu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 23 Dec 2017 06:07:50 -0500
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Cc: ysxie@foxmail.com, Yisheng Xie <xieyisheng1@huawei.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, platform-driver-x86@vger.kernel.org

Default ioremap is ioremap_nocache, so devm_ioremap has the same
function with devm_ioremap_nocache, which can just be killed to
save the size of devres.o

This patch is to use use devm_ioremap instead of devm_ioremap_nocache,
which should not have any function change but prepare for killing
devm_ioremap_nocache.

Cc: Darren Hart <dvhart@infradead.org>
Cc: Andy Shevchenko <andy@infradead.org>
Cc: platform-driver-x86@vger.kernel.org
Signed-off-by: Yisheng Xie <xieyisheng1@huawei.com>
---
 drivers/platform/x86/intel_pmc_core.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
index 17e08b4..fe30bb9 100644
--- a/drivers/platform/x86/intel_pmc_core.c
+++ b/drivers/platform/x86/intel_pmc_core.c
@@ -532,9 +532,8 @@ static int pmc_core_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pmcdev->base_addr &= PMC_BASE_ADDR_MASK;
 	dev_dbg(&dev->dev, "PMC Core: PWRMBASE is %#x\n", pmcdev->base_addr);
 
-	pmcdev->regbase = devm_ioremap_nocache(ptr_dev,
-					      pmcdev->base_addr,
-					      SPT_PMC_MMIO_REG_LEN);
+	pmcdev->regbase = devm_ioremap(ptr_dev, pmcdev->base_addr,
+				       SPT_PMC_MMIO_REG_LEN);
 	if (!pmcdev->regbase) {
 		dev_dbg(&dev->dev, "PMC Core: ioremap failed.\n");
 		return -ENOMEM;
-- 
1.8.3.1
