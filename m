From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 1/2] thinkpad-acpi: handle some new HKEY 0x60xx events
Date: Sun,  5 Jun 2011 16:22:34 -0300
Message-ID: <1307301755-13742-2-git-send-email-hmh@hmh.eng.br>
References: <1307301755-13742-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:48015 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753715Ab1FETWp (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 15:22:45 -0400
In-Reply-To: <1307301755-13742-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Handle some user interface events from the newer Lenovo models.  We are likely
to do something smart with these events in the future, for now, hide the ones
we are already certain about from the user and userspace both.

* Events 0x6000 and 0x6005 are key-related.  0x6005 is not properly identified
  yet.  Ignore these events, and do not report them.

* Event 0x6040 has not been properly identified yet, and we don't know if it
  is important (looks like it isn't, but still...).  Keep reporting it.

* Change the message the driver outputs on unknown 0x6xxx events, as all
  recent events are not related to thermal alarms.  Degrade log level from
  ALERT to WARNING.

Thanks to all users who reported these events or asked about them in a number
of mailing lists.  Your help is highly appreciated, even if I did took a lot of
time to act on them.  For that I apologise.

I will list those that identified the reasons for the events as "reported-by",
and I apologise in advance if I leave anyone out: it was not done on purpose, I
made the mistake of not properly tagging all event report emails separately,
and might have missed some.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Reported-by: Markus Malkusch <markus@malkusch.de>
Reported-by: Peter Giles <g1l3sp@gmail.com>
---
 Documentation/laptops/thinkpad-acpi.txt |    3 +++
 drivers/platform/x86/thinkpad_acpi.c    |   28 +++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 1565eef..4bc92ea 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -534,6 +534,8 @@ Events that are never propagated by the driver:
 0x2404		System is waking up from hibernation to undock
 0x2405		System is waking up from hibernation to eject bay
 0x5010		Brightness level changed/control event
+0x6000		KEYBOARD: Numlock key pressed
+0x6005		KEYBOARD: Fn key pressed (TO BE VERIFIED)
 
 Events that are propagated by the driver to userspace:
 
@@ -552,6 +554,7 @@ Events that are propagated by the driver to userspace:
 0x6021		ALARM: a sensor is too hot
 0x6022		ALARM: a sensor is extremely hot
 0x6030		System thermal table changed
+0x6040		Nvidia Optimus/AC adapter related (TO BE VERIFIED)
 
 Battery nearly empty alarms are a last resort attempt to get the
 operating system to hibernate or shutdown cleanly (0x2313), or shutdown
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 77f6e70..cdcd238 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -194,6 +194,10 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_PEN_REMOVED		= 0x500c, /* tablet pen removed */
 	TP_HKEY_EV_BRGHT_CHANGED	= 0x5010, /* backlight control event */
 
+	/* Key-related user-interface events */
+	TP_HKEY_EV_KEY_NUMLOCK		= 0x6000, /* NumLock key pressed */
+	TP_HKEY_EV_KEY_FN		= 0x6005, /* Fn key pressed? E420 */
+
 	/* Thermal events */
 	TP_HKEY_EV_ALARM_BAT_HOT	= 0x6011, /* battery too hot */
 	TP_HKEY_EV_ALARM_BAT_XHOT	= 0x6012, /* battery critically hot */
@@ -201,6 +205,10 @@ enum tpacpi_hkey_event_t {
 	TP_HKEY_EV_ALARM_SENSOR_XHOT	= 0x6022, /* sensor critically hot */
 	TP_HKEY_EV_THM_TABLE_CHANGED	= 0x6030, /* thermal table changed */
 
+	TP_HKEY_EV_UNK_6040		= 0x6040, /* Related to AC change?
+						     some sort of APM hint,
+						     W520 */
+
 	/* Misc */
 	TP_HKEY_EV_RFKILL_CHANGED	= 0x7000, /* rfkill switch changed */
 };
@@ -3547,13 +3555,13 @@ static bool hotkey_notify_usrevent(const u32 hkey,
 
 static void thermal_dump_all_sensors(void);
 
-static bool hotkey_notify_thermal(const u32 hkey,
+static bool hotkey_notify_6xxx(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
 {
 	bool known = true;
 
-	/* 0x6000-0x6FFF: thermal alarms */
+	/* 0x6000-0x6FFF: thermal alarms/notices and keyboard events */
 	*send_acpi_ev = true;
 	*ignore_acpi_ev = false;
 
@@ -3582,8 +3590,17 @@ static bool hotkey_notify_thermal(const u32 hkey,
 			 "a sensor reports something is extremely hot!\n");
 		/* recommended action: immediate sleep/hibernate */
 		break;
+
+	case TP_HKEY_EV_KEY_NUMLOCK:
+	case TP_HKEY_EV_KEY_FN:
+		/* key press events, we just ignore them as long as the EC
+		 * is still reporting them in the normal keyboard stream */
+		*send_acpi_ev = false;
+		*ignore_acpi_ev = true;
+		return true;
+
 	default:
-		pr_alert("THERMAL ALERT: unknown thermal alarm received\n");
+		pr_warn("unknown possible thermal alarm or keyboard event received\n");
 		known = false;
 	}
 
@@ -3668,8 +3685,9 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 						 &ignore_acpi_ev);
 			break;
 		case 6:
-			/* 0x6000-0x6FFF: thermal alarms */
-			known_ev = hotkey_notify_thermal(hkey, &send_acpi_ev,
+			/* 0x6000-0x6FFF: thermal alarms/notices and
+			 *                keyboard events */
+			known_ev = hotkey_notify_6xxx(hkey, &send_acpi_ev,
 						 &ignore_acpi_ev);
 			break;
 		case 7:
-- 
1.7.2.5
