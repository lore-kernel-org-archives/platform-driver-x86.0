From: Lyude <lyude@redhat.com>
Subject: [PATCH] thinkpad_acpi: Add support for X1 Yoga (2016) Tablet Mode
Date: Tue, 25 Oct 2016 18:12:23 -0400
Message-ID: <1477433543-14915-1-git-send-email-lyude@redhat.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:58954 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750967AbcJYWMg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Oct 2016 18:12:36 -0400
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi-devel@lists.sourceforge.net
Cc: Lyude <lyude@redhat.com>, Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org

For whatever reason, the X1 Yoga doesn't support the normal method of
querying for tablet mode. Instead of providing the MHKG method under the
hotkey handle, we're instead given the CMMD method under the EC handle.
Values on this handle are either 0x1, laptop mode, or 0x6, tablet mode.

Signed-off-by: Lyude <lyude@redhat.com>
---
So HOPEFULLY I actually did this right. There was some discussion here
previously about supporting this, and it was previously mentioned that the IOST
method was responsible for holding the current tablet status. However, it
really doesn't seem like this is the case:

    Method (_Q2E, 0, NotSerialized)  // _Qxx: EC Query
    {
	Local0 = \_SB.PCI0.LPC.EC.CMMD
	If ((Local0 != 0x00) && (Local0 <= 0x06))
	{
	    If (Local0 != \PMMD)
	    {
		\PMMD = Local0
		\_SB.PCI0.LPC.EC.HKEY.MHKQ (0x60C0)
	    }
	}

	If ((Local0 == 0x00) || (Local0 >= 0x07))
	{
	    Local1 = 0x01
	}
	ElseIf ((Local0 == 0x02) || (Local0 == 0x03))
	{
	    Local1 = 0x02
	}
	Else
	{
	    Local1 = 0x03
	}

	If (Local1 != \LVMD)
	{
	    \LVMD = Local1
	    Sleep (0x0A)
	    \_SB.PCI0.LPC.EC.HKEY.MHKQ (0x60F0)
	}
    }

IOST seems to be present in the decompiled DSDT from my Yoga, however it's
quite far from the spot that actually sends the 0x60C0 hotkey event. Let me
know if you guys want to verify this against the full decompiled DSDT for this
machine.

 drivers/platform/x86/thinkpad_acpi.c | 36 +++++++++++++++++++++++++++++++++---
 1 file changed, 33 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index b65ce75..8082dc9 100644
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
@@ -303,6 +306,7 @@ static struct {
 	u32 hotkey_mask:1;
 	u32 hotkey_wlsw:1;
 	u32 hotkey_tablet:1;
+	u32 hotkey_tablet_cmmd:1;
 	u32 kbdlight:1;
 	u32 light:1;
 	u32 light_status:1;
@@ -2059,6 +2063,8 @@ static void hotkey_poll_setup(const bool may_warn);
 
 /* HKEY.MHKG() return bits */
 #define TP_HOTKEY_TABLET_MASK (1 << 3)
+/* ThinkPad X1 Yoga (2016) */
+#define TP_EC_CMMD_TABLET_MODE 0x6
 
 static int hotkey_get_wlsw(void)
 {
@@ -2083,10 +2089,18 @@ static int hotkey_get_tablet_mode(int *status)
 {
 	int s;
 
-	if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
-		return -EIO;
+	if (tp_features.hotkey_tablet_cmmd) {
+		if (!acpi_evalf(ec_handle, &s, "CMMD", "d"))
+			return -EIO;
+
+		*status = (s == TP_EC_CMMD_TABLET_MODE);
+	} else {
+		if (!acpi_evalf(hkey_handle, &s, "MHKG", "d"))
+			return -EIO;
+
+		*status = ((s & TP_HOTKEY_TABLET_MASK) != 0);
+	}
 
-	*status = ((s & TP_HOTKEY_TABLET_MASK) != 0);
 	return 0;
 }
 
@@ -3475,6 +3489,18 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 				&dev_attr_hotkey_tablet_mode.attr);
 	}
 
+	/* For X1 Yoga (2016) */
+	if (!res && acpi_evalf(ec_handle, &status, "CMMD", "qd")) {
+		tp_features.hotkey_tablet = 1;
+		tp_features.hotkey_tablet_cmmd = 1;
+		tabletsw_state = (status == TP_EC_CMMD_TABLET_MODE);
+
+		pr_info("Possible tablet mode switch found; ThinkPad in %s mode\n",
+			(tabletsw_state) ? "tablet" : "laptop");
+		res = add_to_attr_set(hotkey_dev_attributes,
+				      &dev_attr_hotkey_tablet_mode.attr);
+	}
+
 	if (!res)
 		res = register_attr_set_with_sysfs(
 				hotkey_dev_attributes,
@@ -3899,6 +3925,10 @@ static bool hotkey_notify_6xxx(const u32 hkey,
 		*ignore_acpi_ev = true;
 		return true;
 
+	case TP_HKEY_EV_TABLET_CHANGED:
+		tpacpi_input_send_tabletsw();
+		break;
+
 	default:
 		pr_warn("unknown possible thermal alarm or keyboard event received\n");
 		known = false;
-- 
2.7.4
