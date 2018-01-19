From: Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 3/3] platform/x86: GPD pocket fan: Stop work on suspend
Date: Fri, 19 Jan 2018 21:47:09 +0100
Message-ID: <20180119204709.16240-3-hdegoede@redhat.com>
References: <20180119204709.16240-1-hdegoede@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180119204709.16240-1-hdegoede@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

Stop the work on suspend, otherwise it may run between our suspend method
running and the system suspending, possibly restarting the fan which
we've just stopped.

Note we already requeue the work on resume, so that we get a fresh speed
at resume.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/gpd-pocket-fan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
index f7b4980c0aa6..6425c9b49caa 100644
--- a/drivers/platform/x86/gpd-pocket-fan.c
+++ b/drivers/platform/x86/gpd-pocket-fan.c
@@ -177,6 +177,7 @@ static int gpd_pocket_fan_suspend(struct device *dev)
 {
 	struct gpd_pocket_fan_data *fan = dev_get_drvdata(dev);
 
+	cancel_delayed_work_sync(&fan->work);
 	gpd_pocket_fan_set_speed(fan, gpd_pocket_fan_min_speed());
 	return 0;
 }
-- 
2.14.3
