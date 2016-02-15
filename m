From: Ike Panhc <ike.pan@canonical.com>
Subject: [PATCH 1/2] ideapad: No hardware switch after 2016
Date: Mon, 15 Feb 2016 18:24:23 +0800
Message-ID: <1455531863-1294-1-git-send-email-ike.pan@canonical.com>
References: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1455531813-1256-1-git-send-email-ike.pan@canonical.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

There are complains on few ideapads that wireless is always hard
blocked but there is no physical radio switch. For now, we need
each user to report its dmi information and ignore hard blocks
on their ideapad. With more and more ideapads available in market
to maintain the dmi table becomes never-ended job.

I've checked lenovo website and for recent design none of the
ideapads has radio switch. I do not believe there will be in the
future. Therefore to disable hard block according to BIOS date is
reasonable approach.

This patch will disable rfkill hardblock if BIOS year > 2015.

Signed-off-by: Ike Panhc <ike.pan@canonical.com>
---
 drivers/platform/x86/ideapad-laptop.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index d78ee15..1b39074d 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -938,7 +938,10 @@ static int ideapad_acpi_add(struct platform_device *pdev)
 	priv->cfg = cfg;
 	priv->adev = adev;
 	priv->platform_device = pdev;
-	priv->has_hw_rfkill_switch = !dmi_check_system(no_hw_rfkill_list);
+	if (!dmi_get_date(DMI_BIOS_DATE, &i, NULL, NULL))
+		i = 2015;
+	priv->has_hw_rfkill_switch = (i < 2016) &&
+		!dmi_check_system(no_hw_rfkill_list);
 
 	ret = ideapad_sysfs_init(priv);
 	if (ret)
-- 
1.9.1
