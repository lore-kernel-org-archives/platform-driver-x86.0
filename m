From: Felipe Contreras <felipe.contreras@gmail.com>
Subject: [RESEND/PATCH 2/2] x86: asus-laptop: trivial style cleanups
Date: Mon,  7 Oct 2013 22:08:38 -0500
Message-ID: <1381201718-24698-3-git-send-email-felipe.contreras@gmail.com>
References: <1381201718-24698-1-git-send-email-felipe.contreras@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1381201718-24698-1-git-send-email-felipe.contreras@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Jiri Kosina <trivial@kernel.org>, Felipe Contreras <felipe.contreras@gmail.com>, Corentin Chary <corentin.chary@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user@lists.sourceforge.net>, "open list:ASUS NOTEBOOKS AN..." <platform-driver-x86@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
---
 drivers/platform/x86/asus-laptop.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-laptop.c b/drivers/platform/x86/asus-laptop.c
index 0e9c169..0210cf4 100644
--- a/drivers/platform/x86/asus-laptop.c
+++ b/drivers/platform/x86/asus-laptop.c
@@ -1032,7 +1032,7 @@ static ssize_t store_wlan(struct device *dev, struct device_attribute *attr,
 	return sysfs_acpi_set(asus, buf, count, METHOD_WLAN);
 }
 
-/*e
+/*
  * Bluetooth
  */
 static int asus_bluetooth_set(struct asus_laptop *asus, int status)
@@ -1853,9 +1853,8 @@ static void asus_dmi_check(void)
 		return;
 
 	/* On L1400B WLED control the sound card, don't mess with it ... */
-	if (strncmp(model, "L1400B", 6) == 0) {
+	if (strncmp(model, "L1400B", 6) == 0)
 		wlan_status = -1;
-	}
 }
 
 static bool asus_device_present;
-- 
1.8.4-fc
