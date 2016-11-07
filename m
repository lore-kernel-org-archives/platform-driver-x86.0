From: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v4 3/3] thinkpad_acpi: Add support for X1
	Yoga (2016) Tablet Mode
Date: Mon,  7 Nov 2016 12:10:32 -0500
Message-ID: <1478538633-11450-3-git-send-email-lyude@redhat.com>
References: <1478538633-11450-1-git-send-email-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1478538633-11450-1-git-send-email-lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
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

For whatever reason, the X1 Yoga doesn't support the normal method of
querying for tablet mode. Instead of providing the MHKG method under the
hotkey handle, we're instead given the CMMD method under the EC handle.
Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.

Cc: Daniel Martin <consume.noise-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Lyude <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
---
Changes since v1:
- Clarify kernel output when finding the tablet mode switch
Changes since v2:
- Rebase on top of previous patch
- Use an enum for hotkey_tablet. This does make a bit more sense then
  just adding another flag.
- Call hotkey_tablet_mode_notify_change() when getting TABLET_CHANGED
  event.
Changes since v3:
- Move changelog below ---

 drivers/platform/x86/thinkpad_acpi.c | 37 ++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index ad93c41..c60701e 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -190,6 +190,9 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_LID_OPEN		= 0x5002, /* laptop lid opened */
 	TP_HKEY_EV_TABLET_TABLET	= 0x5009, /* tablet swivel up */
 	TP_HKEY_EV_TABLET_NOTEBOOK	= 0x500a, /* tablet swivel down */
+	TP_HKEY_EV_TABLET_CHANGED	= 0x60c0, /* X1 Yoga (2016):
+						   * enter/leave tablet mode
+						   */
 	TP_HKEY_EV_PEN_INSERTED		= 0x500b, /* tablet pen inserted */
 	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
 	TP_HKEY_EV_BRGHT_CHANGED	= 0x5010, /* backlight control event */
@@ -305,6 +308,7 @@ static struct {
 	enum {
 		TP_HOTKEY_TABLET_NONE = 0,
 		TP_HOTKEY_TABLET_USES_MHKG,
+		TP_HOTKEY_TABLET_USES_CMMD,
 	} hotkey_tablet;
 	u32 kbdlight:1;
 	u32 light:1;
@@ -2062,6 +2066,8 @@ static void hotkey_poll_setup(const bool may_warn);
 
 /* HKEY.MHKG() return bits */
 #define TP_HOTKEY_TABLET_MASK (1 << 3)
+/* ThinkPad X1 Yoga (2016) */
+#define TP_EC_CMMD_TABLET_MODE 0x6
 
 static int hotkey_get_wlsw(void)
 {
@@ -2086,10 +2092,23 @@ static int hotkey_get_tablet_mode(int *status)
 {
 	int s;
 
-	if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
-		return -EIO;
+	switch (tp_features.hotkey_tablet) {
+	case TP_HOTKEY_TABLET_USES_MHKG:
+		if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
+			return -EIO;
+
+		*status = ((s & TP_HOTKEY_TABLET_MASK) != 0);
+		break;
+	case TP_HOTKEY_TABLET_USES_CMMD:
+		if (!acpi_evalf(ec_handle, &s, "CMMD", "d"))
+			return -EIO;
+
+		*status = (s == TP_EC_CMMD_TABLET_MODE);
+		break;
+	default:
+		break;
+	}
 
-	*status = ((s & TP_HOTKEY_TABLET_MASK) != 0);
 	return 0;
 }
 
@@ -3127,10 +3146,14 @@ hotkey_init_tablet_mode(void)
 	char *type;
 	int res;
 
-	/* For X41t, X60t, X61t Tablets... */
 	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
+		/* For X41t, X60t, X61t Tablets... */
 		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
 		type = "MHKG";
+	} else if (acpi_evalf(ec_handle, &res, "CMMD", "qd")) {
+		/* For X1 Yoga (2016) */
+		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_CMMD;
+		type = "CMMD";
 	}
 
 	if (!tp_features.hotkey_tablet)
@@ -3928,6 +3951,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		*ignore_acpi_ev = true;
 		return true;
 
+	case TP_HKEY_EV_TABLET_CHANGED:
+		tpacpi_input_send_tabletsw();
+		hotkey_tablet_mode_notify_change();
+		*send_acpi_ev = false;
+		break;
+
 	default:
 		pr_warn("unknown possible thermal alarm or keyboard event received\n");
 		known = false;
-- 
2.7.4


------------------------------------------------------------------------------
Developer Access Program for Intel Xeon Phi Processors
Access to Intel Xeon Phi processor-based developer platforms.
With one year of Intel Parallel Studio XE.
Training and support from Colfax.
Order your platform today. http://sdm.link/xeonphi
