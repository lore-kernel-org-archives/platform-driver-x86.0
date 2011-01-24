From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 09/14] eeepc-wmi: reorder defines
Date: Mon, 24 Jan 2011 17:23:53 +0100
Message-ID: <1295886238-15961-10-git-send-email-corentincj@iksaif.net>
References: <1295886238-15961-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1295886238-15961-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Chris Bagwell <chris-ZCD0YumhXB+iMFqZbmIluw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Randy Dunlap <rdunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/eeepc-wmi.c |   18 +++++++++---------
 1 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 1fc191b..aa9e1d1 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -60,20 +60,20 @@ MODULE_LICENSE("GPL");
 MODULE_ALIAS("wmi:"EEEPC_WMI_EVENT_GUID);
 MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
-#define NOTIFY_BRNUP_MIN	0x11
-#define NOTIFY_BRNUP_MAX	0x1f
-#define NOTIFY_BRNDOWN_MIN	0x20
-#define NOTIFY_BRNDOWN_MAX	0x2e
+#define NOTIFY_BRNUP_MIN		0x11
+#define NOTIFY_BRNUP_MAX		0x1f
+#define NOTIFY_BRNDOWN_MIN		0x20
+#define NOTIFY_BRNDOWN_MAX		0x2e
 
-#define EEEPC_WMI_METHODID_DEVS	0x53564544
-#define EEEPC_WMI_METHODID_DSTS	0x53544344
-#define EEEPC_WMI_METHODID_CFVS	0x53564643
+#define EEEPC_WMI_METHODID_DSTS		0x53544344
+#define EEEPC_WMI_METHODID_DEVS		0x53564544
+#define EEEPC_WMI_METHODID_CFVS		0x53564643
 
-#define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
-#define EEEPC_WMI_DEVID_TPDLED		0x00100011
 #define EEEPC_WMI_DEVID_WLAN		0x00010011
 #define EEEPC_WMI_DEVID_BLUETOOTH	0x00010013
 #define EEEPC_WMI_DEVID_WWAN3G		0x00010019
+#define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
+#define EEEPC_WMI_DEVID_TPDLED		0x00100011
 
 static bool hotplug_wireless;
 
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
