From: Alex Hung <alex.hung@canonical.com>
Subject: [PATCH] asus-wmi: use ASUS_WMI_METHODID_DSTS2 as default DSTS ID.
Date: Wed, 20 Jun 2012 11:47:35 +0800
Message-ID: <1340164055-1062-1-git-send-email-alex.hung@canonical.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: alex.hung@canonical.com, corentincj@iksaif.net, mjg@redhat.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

According to responses from the BIOS team, ASUS_WMI_METHODID_DSTS2
(0x53545344) will be used as future DSTS ID. In addition, calling
asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL) returns
ASUS_WMI_UNSUPPORTED_METHOD in new ASUS laptop PCs. This patch fixes
no DSTS ID will be assigned in this case.

Signed-off-by: Alex Hung <alex.hung@canonical.com>
---
 drivers/platform/x86/asus-wmi.c |    7 +------
 1 files changed, 1 insertions(+), 6 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 25e3093..0f69a97 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1461,14 +1461,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
 	 */
 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
-	else if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL))
+	else
 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
 
-	if (!asus->dsts_id) {
-		pr_err("Can't find DSTS");
-		return -ENODEV;
-	}
-
 	/* CWAP allow to define the behavior of the Fn+F2 key,
 	 * this method doesn't seems to be present on Eee PCs */
 	if (asus->driver->quirks->wapf >= 0)
-- 
1.7.0.4
