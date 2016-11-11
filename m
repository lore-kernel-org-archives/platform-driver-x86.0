From: Lyude <lyude@redhat.com>
Subject: [PATCH v5 2/2] thinkpad_acpi: Add support for X1 Yoga (2016) Tablet Mode
Date: Fri, 11 Nov 2016 15:15:03 -0500
Message-ID: <1478895304-31627-2-git-send-email-lyude@redhat.com>
References: <1478895304-31627-1-git-send-email-lyude@redhat.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478895304-31627-1-git-send-email-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Daniel Martin <consume.noise@gmail.com>
Cc: Lyude <lyude@redhat.com>, Jonathan Corbet <corbet@lwn.net>, Darren Hart <dvhart@infradead.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

For whatever reason, the X1 Yoga doesn't support the normal method of
querying for tablet mode. Instead of providing the MHKG method under the
hotkey handle, we're instead given the CMMD method under the EC handle.
Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.

Tested-by: Daniel Martin <consume.noise@gmail.com>
Signed-off-by: Lyude <lyude@redhat.com>
---
Changes since v4:
 - Get rid of patch #2
 - Add BIOS model
 - Update documentation

 Documentation/laptops/thinkpad-acpi.txt |  1 +
 drivers/platform/x86/thinkpad_acpi.c    | 39 +++++++++++++++++++++++++++++----
 2 files changed, 36 insertions(+), 4 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 72a150d..ba2e7d2 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -540,6 +540,7 @@ Events that are propagated by the driver to userspace:
 0x6022		ALARM: a sensor is extremely hot
 0x6030		System thermal table changed
 0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
+0x60C0		X1 Yoga 2016, Tablet mode status changed
 
 Battery nearly empty alarms are a last resort attempt to get the
 operating system to hibernate or shutdown cleanly (0x2313), or shutdown
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index de4e734..700b8c8 100644
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
@@ -305,6 +308,8 @@ static struct {
 	enum {
 		TP_HOTKEY_TABLET_NONE = 0,
 		TP_HOTKEY_TABLET_USES_MHKG,
+		/* X1 Yoga 2016, seen on BIOS N1FET44W */
+		TP_HOTKEY_TABLET_USES_CMMD,
 	} hotkey_tablet;
 	u32 kbdlight:1;
 	u32 light:1;
@@ -2062,6 +2067,8 @@ static void hotkey_poll_setup(const bool may_warn);
 
 /* HKEY.MHKG() return bits */
 #define TP_HOTKEY_TABLET_MASK (1 << 3)
+/* ThinkPad X1 Yoga (2016) */
+#define TP_EC_CMMD_TABLET_MODE 0x6
 
 static int hotkey_get_wlsw(void)
 {
@@ -2086,10 +2093,23 @@ static int hotkey_get_tablet_mode(int *status)
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
 
@@ -3125,11 +3145,16 @@ static int hotkey_init_tablet_mode(void)
 	int in_tablet_mode, res;
 	char *type;
 
-	/* For X41t, X60t, X61t Tablets... */
 	if (acpi_evalf(hkey_handle, &res, "MHKG", "qd")) {
+		/* For X41t, X60t, X61t Tablets... */
 		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_MHKG;
 		in_tablet_mode = !!(res & TP_HOTKEY_TABLET_MASK);
 		type = "MHKG";
+	} else if (acpi_evalf(ec_handle, &res, "CMMD", "qd")) {
+		/* For X1 Yoga (2016) */
+		tp_features.hotkey_tablet = TP_HOTKEY_TABLET_USES_CMMD;
+		in_tablet_mode = res == TP_EC_CMMD_TABLET_MODE;
+		type = "CMMD";
 	}
 
 	if (!tp_features.hotkey_tablet)
@@ -3921,6 +3946,12 @@ static bool hotkey_notify_6xxx(const u32 hkey,
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
