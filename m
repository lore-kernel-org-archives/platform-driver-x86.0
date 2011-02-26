From: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
Subject: [PATCH 04/14] asus-wmi: introduce struct
	asus_rfkill
Date: Sat, 26 Feb 2011 10:20:33 +0100
Message-ID: <1298712045-17671-5-git-send-email-corentincj@iksaif.net>
References: <1298712045-17671-1-git-send-email-corentincj@iksaif.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1298712045-17671-1-git-send-email-corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=acpi4asus-user>
List-Post: <mailto:acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/acpi4asus-user>,
	<mailto:acpi4asus-user-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: acpi4asus-user-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Matthew Garrett <mjg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Dmitry Torokhov <dmitry.torokhov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <acpi4asus-user-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, "open list:ASUS NOTEBOOKS AN..." <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

First, this allow use to remove the custom asusrfkill_wlan_query,
but this will also allow us to give struct asus_wmi * to
get_devstate/set_devstate later.

Signed-off-by: Corentin Chary <corentincj-EjuBZuxMvz2sTnJN9+BGXg@public.gmane.org>
---
 drivers/platform/x86/asus-wmi.c |  115 ++++++++++++++++++++-------------------
 1 files changed, 59 insertions(+), 56 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 4c3f68a..d0f0931 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -114,6 +114,12 @@ struct asus_wmi_debug {
 	u32 ctrl_param;
 };
 
+struct asus_rfkill {
+	struct asus_wmi *asus;
+	struct rfkill *rfkill;
+	u32 dev_id;
+};
+
 struct asus_wmi {
 	struct input_dev *inputdev;
 	struct backlight_device *backlight_device;
@@ -124,10 +130,10 @@ struct asus_wmi {
 	struct workqueue_struct *led_workqueue;
 	struct work_struct tpd_led_work;
 
-	struct rfkill *wlan_rfkill;
-	struct rfkill *bluetooth_rfkill;
-	struct rfkill *wimax_rfkill;
-	struct rfkill *wwan3g_rfkill;
+	struct asus_rfkill wlan;
+	struct asus_rfkill bluetooth;
+	struct asus_rfkill wimax;
+	struct asus_rfkill wwan3g;
 
 	struct hotplug_slot *hotplug_slot;
 	struct mutex hotplug_lock;
@@ -377,8 +383,8 @@ static void asus_rfkill_hotplug(struct asus_wmi *asus)
 
 	mutex_lock(&asus->hotplug_lock);
 
-	if (asus->wlan_rfkill)
-		rfkill_set_sw_state(asus->wlan_rfkill, blocked);
+	if (asus->wlan.rfkill)
+		rfkill_set_sw_state(asus->wlan.rfkill, blocked);
 
 	if (asus->hotplug_slot) {
 		bus = pci_find_bus(0, 1);
@@ -570,11 +576,11 @@ error_workqueue:
  */
 static int asus_rfkill_set(void *data, bool blocked)
 {
-	int dev_id = (unsigned long)data;
+	struct asus_rfkill *priv = data;
 	u32 ctrl_param = !blocked;
 	acpi_status status;
 
-	status = asus_wmi_set_devstate(dev_id, ctrl_param, NULL);
+	status = asus_wmi_set_devstate(priv->dev_id, ctrl_param, NULL);
 
 	if (ACPI_FAILURE(status))
 		return -EIO;
@@ -584,20 +590,21 @@ static int asus_rfkill_set(void *data, bool blocked)
 
 static void asus_rfkill_query(struct rfkill *rfkill, void *data)
 {
-	int dev_id = (unsigned long)data;
+	struct asus_rfkill *priv = data;
 	int result;
 
-	result = asus_wmi_get_devstate_simple(dev_id);
+	result = asus_wmi_get_devstate_simple(priv->dev_id);
 
 	if (result < 0)
 		return;
 
-	rfkill_set_sw_state(rfkill, !result);
+	rfkill_set_sw_state(priv->rfkill, !result);
 }
 
 static int asus_rfkill_wlan_set(void *data, bool blocked)
 {
-	struct asus_wmi *asus = data;
+	struct asus_rfkill *priv = data;
+	struct asus_wmi *asus = priv->asus;
 	int ret;
 
 	/*
@@ -608,19 +615,14 @@ static int asus_rfkill_wlan_set(void *data, bool blocked)
 	 * any wmi method
 	 */
 	mutex_lock(&asus->wmi_lock);
-	ret = asus_rfkill_set((void *)(long)ASUS_WMI_DEVID_WLAN, blocked);
+	ret = asus_rfkill_set(data, blocked);
 	mutex_unlock(&asus->wmi_lock);
 	return ret;
 }
 
-static void asus_rfkill_wlan_query(struct rfkill *rfkill, void *data)
-{
-	asus_rfkill_query(rfkill, (void *)(long)ASUS_WMI_DEVID_WLAN);
-}
-
 static const struct rfkill_ops asus_rfkill_wlan_ops = {
 	.set_block = asus_rfkill_wlan_set,
-	.query = asus_rfkill_wlan_query,
+	.query = asus_rfkill_query,
 };
 
 static const struct rfkill_ops asus_rfkill_ops = {
@@ -629,20 +631,24 @@ static const struct rfkill_ops asus_rfkill_ops = {
 };
 
 static int asus_new_rfkill(struct asus_wmi *asus,
-			   struct rfkill **rfkill,
+			   struct asus_rfkill *arfkill,
 			   const char *name, enum rfkill_type type, int dev_id)
 {
 	int result = asus_wmi_get_devstate_simple(dev_id);
+	struct rfkill **rfkill = &arfkill->rfkill;
 
 	if (result < 0)
 		return result;
 
+	arfkill->dev_id = dev_id;
+	arfkill->asus = asus;
+
 	if (dev_id == ASUS_WMI_DEVID_WLAN && asus->driver->hotplug_wireless)
 		*rfkill = rfkill_alloc(name, &asus->platform_device->dev, type,
-				       &asus_rfkill_wlan_ops, asus);
+				       &asus_rfkill_wlan_ops, arfkill);
 	else
 		*rfkill = rfkill_alloc(name, &asus->platform_device->dev, type,
-				       &asus_rfkill_ops, (void *)(long)dev_id);
+				       &asus_rfkill_ops, arfkill);
 
 	if (!*rfkill)
 		return -EINVAL;
@@ -662,10 +668,10 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
 	asus_unregister_rfkill_notifier(asus, "\\_SB.PCI0.P0P5");
 	asus_unregister_rfkill_notifier(asus, "\\_SB.PCI0.P0P6");
 	asus_unregister_rfkill_notifier(asus, "\\_SB.PCI0.P0P7");
-	if (asus->wlan_rfkill) {
-		rfkill_unregister(asus->wlan_rfkill);
-		rfkill_destroy(asus->wlan_rfkill);
-		asus->wlan_rfkill = NULL;
+	if (asus->wlan.rfkill) {
+		rfkill_unregister(asus->wlan.rfkill);
+		rfkill_destroy(asus->wlan.rfkill);
+		asus->wlan.rfkill = NULL;
 	}
 	/*
 	 * Refresh pci hotplug in case the rfkill state was changed after
@@ -677,20 +683,20 @@ static void asus_wmi_rfkill_exit(struct asus_wmi *asus)
 	if (asus->hotplug_workqueue)
 		destroy_workqueue(asus->hotplug_workqueue);
 
-	if (asus->bluetooth_rfkill) {
-		rfkill_unregister(asus->bluetooth_rfkill);
-		rfkill_destroy(asus->bluetooth_rfkill);
-		asus->bluetooth_rfkill = NULL;
+	if (asus->bluetooth.rfkill) {
+		rfkill_unregister(asus->bluetooth.rfkill);
+		rfkill_destroy(asus->bluetooth.rfkill);
+		asus->bluetooth.rfkill = NULL;
 	}
-	if (asus->wimax_rfkill) {
-		rfkill_unregister(asus->wimax_rfkill);
-		rfkill_destroy(asus->wimax_rfkill);
-		asus->wimax_rfkill = NULL;
+	if (asus->wimax.rfkill) {
+		rfkill_unregister(asus->wimax.rfkill);
+		rfkill_destroy(asus->wimax.rfkill);
+		asus->wimax.rfkill = NULL;
 	}
-	if (asus->wwan3g_rfkill) {
-		rfkill_unregister(asus->wwan3g_rfkill);
-		rfkill_destroy(asus->wwan3g_rfkill);
-		asus->wwan3g_rfkill = NULL;
+	if (asus->wwan3g.rfkill) {
+		rfkill_unregister(asus->wwan3g.rfkill);
+		rfkill_destroy(asus->wwan3g.rfkill);
+		asus->wwan3g.rfkill = NULL;
 	}
 }
 
@@ -701,30 +707,27 @@ static int asus_wmi_rfkill_init(struct asus_wmi *asus)
 	mutex_init(&asus->hotplug_lock);
 	mutex_init(&asus->wmi_lock);
 
-	result = asus_new_rfkill(asus, &asus->wlan_rfkill,
-				 "asus-wlan", RFKILL_TYPE_WLAN,
-				 ASUS_WMI_DEVID_WLAN);
+	result = asus_new_rfkill(asus, &asus->wlan, "asus-wlan",
+				 RFKILL_TYPE_WLAN, ASUS_WMI_DEVID_WLAN);
 
 	if (result && result != -ENODEV)
 		goto exit;
 
-	result = asus_new_rfkill(asus, &asus->bluetooth_rfkill,
+	result = asus_new_rfkill(asus, &asus->bluetooth,
 				 "asus-bluetooth", RFKILL_TYPE_BLUETOOTH,
 				 ASUS_WMI_DEVID_BLUETOOTH);
 
 	if (result && result != -ENODEV)
 		goto exit;
 
-	result = asus_new_rfkill(asus, &asus->wimax_rfkill,
-				 "asus-wimax", RFKILL_TYPE_WIMAX,
-				 ASUS_WMI_DEVID_WIMAX);
+	result = asus_new_rfkill(asus, &asus->wimax, "asus-wimax",
+				 RFKILL_TYPE_WIMAX, ASUS_WMI_DEVID_WIMAX);
 
 	if (result && result != -ENODEV)
 		goto exit;
 
-	result = asus_new_rfkill(asus, &asus->wwan3g_rfkill,
-				 "asus-wwan3g", RFKILL_TYPE_WWAN,
-				 ASUS_WMI_DEVID_WWAN3G);
+	result = asus_new_rfkill(asus, &asus->wwan3g, "asus-wwan3g",
+				 RFKILL_TYPE_WWAN, ASUS_WMI_DEVID_WWAN3G);
 
 	if (result && result != -ENODEV)
 		goto exit;
@@ -1277,7 +1280,7 @@ static int asus_hotk_thaw(struct device *device)
 {
 	struct asus_wmi *asus = dev_get_drvdata(device);
 
-	if (asus->wlan_rfkill) {
+	if (asus->wlan.rfkill) {
 		bool wlan;
 
 		/*
@@ -1298,20 +1301,20 @@ static int asus_hotk_restore(struct device *device)
 	int bl;
 
 	/* Refresh both wlan rfkill state and pci hotplug */
-	if (asus->wlan_rfkill)
+	if (asus->wlan.rfkill)
 		asus_rfkill_hotplug(asus);
 
-	if (asus->bluetooth_rfkill) {
+	if (asus->bluetooth.rfkill) {
 		bl = !asus_wmi_get_devstate_simple(ASUS_WMI_DEVID_BLUETOOTH);
-		rfkill_set_sw_state(asus->bluetooth_rfkill, bl);
+		rfkill_set_sw_state(asus->bluetooth.rfkill, bl);
 	}
-	if (asus->wimax_rfkill) {
+	if (asus->wimax.rfkill) {
 		bl = !asus_wmi_get_devstate_simple(ASUS_WMI_DEVID_WIMAX);
-		rfkill_set_sw_state(asus->wimax_rfkill, bl);
+		rfkill_set_sw_state(asus->wimax.rfkill, bl);
 	}
-	if (asus->wwan3g_rfkill) {
+	if (asus->wwan3g.rfkill) {
 		bl = !asus_wmi_get_devstate_simple(ASUS_WMI_DEVID_WWAN3G);
-		rfkill_set_sw_state(asus->wwan3g_rfkill, bl);
+		rfkill_set_sw_state(asus->wwan3g.rfkill, bl);
 	}
 
 	return 0;
-- 
1.7.4


------------------------------------------------------------------------------
Free Software Download: Index, Search & Analyze Logs and other IT data in 
Real-Time with Splunk. Collect, index and harness all the fast moving IT data 
generated by your applications, servers and devices whether physical, virtual
or in the cloud. Deliver compliance at lower cost and gain new business 
insights. http://p.sf.net/sfu/splunk-dev2dev 
