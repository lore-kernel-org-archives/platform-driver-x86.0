From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 12/14] eeepc-wmi: add wimax support
Date: Mon, 24 Jan 2011 17:23:56 +0100
Message-ID: <1295886238-15961-13-git-send-email-corentincj@iksaif.net>
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
 drivers/platform/x86/eeepc-wmi.c |   20 +++++++++++++++++++-
 1 files changed, 19 insertions(+), 1 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index 83415dd..0db7009 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -71,6 +71,7 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 
 #define EEEPC_WMI_DEVID_WLAN		0x00010011
 #define EEEPC_WMI_DEVID_BLUETOOTH	0x00010013
+#define EEEPC_WMI_DEVID_WIMAX		0x00010017
 #define EEEPC_WMI_DEVID_WWAN3G		0x00010019
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
 #define EEEPC_WMI_DEVID_CAMERA		0x00060013
@@ -138,6 +139,7 @@ struct eeepc_wmi {
 
 	struct rfkill *wlan_rfkill;
 	struct rfkill *bluetooth_rfkill;
+	struct rfkill *wimax_rfkill;
 	struct rfkill *wwan3g_rfkill;
 
 	struct hotplug_slot *hotplug_slot;
@@ -691,6 +693,11 @@ static void eeepc_wmi_rfkill_exit(struct eeepc_wmi *eeepc)
 		rfkill_destroy(eeepc->bluetooth_rfkill);
 		eeepc->bluetooth_rfkill = NULL;
 	}
+	if (eeepc->wimax_rfkill) {
+		rfkill_unregister(eeepc->wimax_rfkill);
+		rfkill_destroy(eeepc->wimax_rfkill);
+		eeepc->wimax_rfkill = NULL;
+	}
 	if (eeepc->wwan3g_rfkill) {
 		rfkill_unregister(eeepc->wwan3g_rfkill);
 		rfkill_destroy(eeepc->wwan3g_rfkill);
@@ -719,6 +726,13 @@ static int eeepc_wmi_rfkill_init(struct eeepc_wmi *eeepc)
 	if (result && result != -ENODEV)
 		goto exit;
 
+	result = eeepc_new_rfkill(eeepc, &eeepc->wimax_rfkill,
+				  "eeepc-wimax", RFKILL_TYPE_WIMAX,
+				  EEEPC_WMI_DEVID_WIMAX);
+
+	if (result && result != -ENODEV)
+		goto exit;
+
 	result = eeepc_new_rfkill(eeepc, &eeepc->wwan3g_rfkill,
 				  "eeepc-wwan3g", RFKILL_TYPE_WWAN,
 				  EEEPC_WMI_DEVID_WWAN3G);
@@ -1276,7 +1290,11 @@ static int eeepc_hotk_restore(struct device *device)
 	if (eeepc->bluetooth_rfkill) {
 		bl = !eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_BLUETOOTH);
 		rfkill_set_sw_state(eeepc->bluetooth_rfkill, bl);
-}
+	}
+	if (eeepc->wimax_rfkill) {
+		bl = !eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_WIMAX);
+		rfkill_set_sw_state(eeepc->wimax_rfkill, bl);
+	}
 	if (eeepc->wwan3g_rfkill) {
 		bl = !eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_WWAN3G);
 		rfkill_set_sw_state(eeepc->wwan3g_rfkill, bl);
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
