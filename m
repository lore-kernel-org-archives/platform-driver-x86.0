From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 07/14] eeepc-wmi: add hibernate/resume
	callbacks
Date: Mon, 24 Jan 2011 17:23:51 +0100
Message-ID: <1295886238-15961-8-git-send-email-corentincj@iksaif.net>
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
 drivers/platform/x86/eeepc-wmi.c |   49 ++++++++++++++++++++++++++++++++++++++
 1 files changed, 49 insertions(+), 0 deletions(-)

diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index de501fb..583ba78 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -1183,10 +1183,59 @@ static int eeepc_wmi_remove(struct platform_device *device)
 	return 0;
 }
 
+/*
+ * Platform driver - hibernate/resume callbacks
+ */
+static int eeepc_hotk_thaw(struct device *device)
+{
+	struct eeepc_wmi *eeepc = dev_get_drvdata(device);
+
+	if (eeepc->wlan_rfkill) {
+		bool wlan;
+
+		/*
+		 * Work around bios bug - acpi _PTS turns off the wireless led
+		 * during suspend.  Normally it restores it on resume, but
+		 * we should kick it ourselves in case hibernation is aborted.
+		 */
+		wlan = eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_WLAN);
+		eeepc_wmi_set_devstate(EEEPC_WMI_DEVID_WLAN, wlan, NULL);
+	}
+
+	return 0;
+}
+
+static int eeepc_hotk_restore(struct device *device)
+{
+	struct eeepc_wmi *eeepc = dev_get_drvdata(device);
+	int bl;
+
+	/* Refresh both wlan rfkill state and pci hotplug */
+	if (eeepc->wlan_rfkill)
+		eeepc_rfkill_hotplug(eeepc);
+
+	if (eeepc->bluetooth_rfkill) {
+		bl = !eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_BLUETOOTH);
+		rfkill_set_sw_state(eeepc->bluetooth_rfkill, bl);
+}
+	if (eeepc->wwan3g_rfkill) {
+		bl = !eeepc_wmi_get_devstate_simple(EEEPC_WMI_DEVID_WWAN3G);
+		rfkill_set_sw_state(eeepc->wwan3g_rfkill, bl);
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops eeepc_pm_ops = {
+	.thaw = eeepc_hotk_thaw,
+	.restore = eeepc_hotk_restore,
+};
+
 static struct platform_driver platform_driver = {
 	.driver = {
 		.name = EEEPC_WMI_FILE,
 		.owner = THIS_MODULE,
+		.pm = &eeepc_pm_ops,
 	},
 };
 
-- 
1.7.3.4


------------------------------------------------------------------------------
Special Offer-- Download ArcSight Logger for FREE (a $49 USD value)!
Finally, a world-class log management solution at an even better price-free!
Download using promo code Free_Logger_4_Dev2Dev. Offer expires 
February 28th, so secure your free ArcSight Logger TODAY! 
http://p.sf.net/sfu/arcsight-sfd2d
