From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 10/14] eeepc-wmi: use the presence bit
	correctly
Date: Mon, 24 Jan 2011 17:23:54 +0100
Message-ID: <1295886238-15961-11-git-send-email-corentincj@iksaif.net>
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

I checked some more DSDT, and it seems that I wasn't
totally right about the meaning of DSTS return value.
Bit 0 is clearly the status of the device, and I discovered
that bit 16 is set when the device is present.

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/eeepc-wmi.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index aa9e1d1..391c32b 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -75,6 +75,9 @@ MODULE_ALIAS("wmi:"EEEPC_WMI_MGMT_GUID);
 #define EEEPC_WMI_DEVID_BACKLIGHT	0x00050012
 #define EEEPC_WMI_DEVID_TPDLED		0x00100011
 
+#define EEEPC_WMI_DSTS_STATUS_BIT	0x00000001
+#define EEEPC_WMI_DSTS_PRESENCE_BIT	0x00010000
+
 static bool hotplug_wireless;
 
 module_param(hotplug_wireless, bool, 0444);
@@ -265,16 +268,10 @@ static int eeepc_wmi_get_devstate_simple(u32 dev_id)
 	if (ACPI_FAILURE(status))
 		return -EINVAL;
 
-	/* If the device is present, DSTS will always set some bits
-	 * 0x00070000 - 1110000000000000000 - device supported
-	 * 0x00060000 - 1100000000000000000 - not supported
-	 * 0x00020000 - 0100000000000000000 - device supported
-	 * 0x00010000 - 0010000000000000000 - not supported / special mode ?
-	 */
-	if (!retval || retval == 0x00060000)
+	if (!(retval & EEEPC_WMI_DSTS_PRESENCE_BIT))
 		return -ENODEV;
 
-	return retval & 0x1;
+	return retval & EEEPC_WMI_DSTS_STATUS_BIT;
 }
 
 /*
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
