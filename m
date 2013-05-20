From: Libo Chen <clbchenlibo.chen@huawei.com>
Subject: [PATCH 3/3] x86 platform drivers: fix gpio leak
Date: Mon, 20 May 2013 10:30:10 +0800
Message-ID: <51998AB2.4080909@huawei.com>
References: <1368889004-5520-4-git-send-email-libo.chen@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1368889004-5520-4-git-send-email-libo.chen@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: matthew.garrett@nebula.com
Cc: platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Li Zefan <lizefan@huawei.com>
List-Id: platform-driver-x86.vger.kernel.org


when request_irq faild, we should release gpiochip

Signed-off-by: Libo Chen <libo.chen@huawei.com>
---
 drivers/platform/x86/intel_pmic_gpio.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
 mode change 100644 => 100755 drivers/platform/x86/intel_pmic_gpio.c

diff --git a/drivers/platform/x86/intel_pmic_gpio.c b/drivers/platform/x86/intel_pmic_gpio.c
old mode 100644
new mode 100755
index 6f4b728..478c3a5
--- a/drivers/platform/x86/intel_pmic_gpio.c
+++ b/drivers/platform/x86/intel_pmic_gpio.c
@@ -288,7 +288,7 @@ static int platform_pmic_gpio_probe(struct platform_device *pdev)
 	retval = request_irq(pg->irq, pmic_irq_handler, 0, "pmic", pg);
 	if (retval) {
 		pr_warn("Interrupt request failed\n");
-		goto err;
+		goto fail_request_irq;
 	}

 	for (i = 0; i < 8; i++) {
@@ -299,6 +299,9 @@ static int platform_pmic_gpio_probe(struct platform_device *pdev)
 		irq_set_chip_data(i + pg->irq_base, pg);
 	}
 	return 0;
+
+fail_request_irq:
+	gpiochip_remove(&pg->chip);
 err:
 	iounmap(pg->gpiointr);
 err2:
-- 
1.8.1.2
