From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/3] thinkpad_acpi: Move tablet detection
	into separate function
Date: Mon, 31 Oct 2016 18:55:32 -0400
Message-ID: <1477954535-12536-2-git-send-email-lyude@redhat.com>
References: <1477954535-12536-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1477954535-12536-1-git-send-email-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
	<mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Henrique de Moraes Holschuh <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Darren Hart <dvhart-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

Suggested by Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Lenovo's having a bit of fun randomly changing what hotkey events and
acpi handles they use for reporting tablet mode, so unfortunately this
means we're definitely going to need to probe for multiple types of
tablet mode support. Since the hotkey_init() is already a lot larger
then it should be, let's split up this detection into it's own function
to make things a little easier to read.

As well, since we're going to have multiple types of tablet modes, make
hotkey_tablet into an enum so we can also use it to indicate the type of
tablet mode reporting the machine supports.

Signed-off-by: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/platform/x86/thinkpad_acpi.c | 50 +++++++++++++++++++++++++++---------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..369b483 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -302,7 +302,10 @@ static struct {
 	u32 hotkey:1;
 	u32 hotkey_mask:1;
 	u32 hotkey_wlsw:1;
-	u32 hotkey_tablet:1;
+	enum {
+		TP_HOTKEY_TABLET_NONE = 0,
+		TP_HOTKEY_TABLET_USES_MHKG = 1,
+	} hotkey_tablet;
 	u32 kbdlight:1;
 	u32 light:1;
 	u32 light_status:1;
@@ -3117,6 +3120,34 @@ static const struct tpacpi_quirk tpacpi_hotkey_qtable[] __initconst = {
 typedef u16 tpacpi_keymap_entry_t;
 typedef tpacpi_keymap_entry_t tpacpi_keymap_t[TPACPI_HOTKEY_MAP_LEN];
 
+static int
+hotkey_init_tablet_mode(void)
+{
+	int res;
+	char *type;
+	bool in_tablet_mode;
+
+	/* For X41t, X60t, X61t Tablets... */
+	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
+		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
+		in_tablet_mode = !!(res & TP_HOTKEY_TABLET_MASK);
+		type = "MHKG";
+	}
+
+	if (!tp_features.hotkey_tablet)
+		return 0;
+
+	pr_info("Tablet mode switch found (type: %s), currently in %s mode\n",
+		type, in_tablet_mode ? "tablet" : "laptop");
+
+	res = add_to_attr_set(hotkey_dev_attributes,
+			      &dev_attr_hotkey_tablet_mode.attr);
+	if (res)
+		return -1;
+
+	return in_tablet_mode;
+}
+
 static int __init hotkey_init(struct ibm_init_struct *iibm)
 {
 	/* Requirements for changing the default keymaps:
@@ -3464,17 +3495,6 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		res = add_to_attr_set(hotkey_dev_attributes,
 				&dev_attr_hotkey_radio_sw.attr);
 
-	/* For X41t, X60t, X61t Tablets... */
-	if (!res && acpi_evalf(hkey_handle, &status, "MHKG", "qd")) {
-		tp_features.hotkey_tablet = 1;
-		tabletsw_state = !!(status & TP_HOTKEY_TABLET_MASK);
-		pr_info("possible tablet mode switch found; "
-			"ThinkPad in %s mode\n",
-			(tabletsw_state) ? "tablet" : "laptop");
-		res = add_to_attr_set(hotkey_dev_attributes,
-				&dev_attr_hotkey_tablet_mode.attr);
-	}
-
 	if (!res)
 		res = register_attr_set_with_sysfs(
 				hotkey_dev_attributes,
@@ -3482,6 +3502,12 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 	if (res)
 		goto err_exit;
 
+	res = hotkey_init_tablet_mode();
+	if (res < 0)
+		goto err_exit;
+
+	tabletsw_state = res;
+
 	/* Set up key map */
 	hotkey_keycode_map = kmalloc(TPACPI_HOTKEY_MAP_SIZE,
 					GFP_KERNEL);
-- 
2.7.4


------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
