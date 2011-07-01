From: Corentin Chary <corentin.chary@gmail.com>
Subject: [PATCH 01/16] asus-wmi: fix hwmon/pwm1
Date: Fri,  1 Jul 2011 11:34:26 +0200
Message-ID: <1309512881-2901-2-git-send-email-corentin.chary@gmail.com>
References: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1309512881-2901-1-git-send-email-corentin.chary@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: platform-driver-x86@vger.kernel.org
Cc: Corentin Chary <corentin.chary@gmail.com>, stable@kernel.org, Corentin Chary <corentincj@iksaif.net>, Matthew Garrett <mjg@redhat.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, open list <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

The code was completly broken, and should never had been sent
to the kernel. That's what happens when you write code without
hardware to test it.

Cc: stable@kernel.org
Signed-off-by: Corentin Chary <corentin.chary@gmail.com>
---
 drivers/platform/x86/asus-wmi.c |    9 +++++----
 1 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 00460cb..d1ddb4a 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -797,8 +797,8 @@ exit:
  * Hwmon device
  */
 static ssize_t asus_hwmon_pwm1(struct device *dev,
-			    struct device_attribute *attr,
-			    char *buf)
+			       struct device_attribute *attr,
+			       char *buf)
 {
 	struct asus_wmi *asus = dev_get_drvdata(dev);
 	u32 value;
@@ -809,7 +809,7 @@ static ssize_t asus_hwmon_pwm1(struct device *dev,
 	if (err < 0)
 		return err;
 
-	value |= 0xFF;
+	value &= 0xFF;
 
 	if (value == 1) /* Low Speed */
 		value = 85;
@@ -869,7 +869,7 @@ static mode_t asus_hwmon_sysfs_is_visible(struct kobject *kobj,
 		 * - reverved bits are non-zero
 		 * - sfun and presence bit are not set
 		 */
-		if (value != ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
+		if (value == ASUS_WMI_UNSUPPORTED_METHOD || value & 0xFFF80000
 		    || (!asus->sfun && !(value & ASUS_WMI_DSTS_PRESENCE_BIT)))
 			ok = false;
 	}
@@ -904,6 +904,7 @@ static int asus_wmi_hwmon_init(struct asus_wmi *asus)
 		pr_err("Could not register asus hwmon device\n");
 		return PTR_ERR(hwmon);
 	}
+	dev_set_drvdata(hwmon, asus);
 	asus->hwmon_device = hwmon;
 	result = sysfs_create_group(&hwmon->kobj, &hwmon_attribute_group);
 	if (result)
-- 
1.7.3.4
