From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 2/2] thinkpad-acpi: handle HKEY 0x4010, 0x4011 events
Date: Sun,  5 Jun 2011 16:22:35 -0300
Message-ID: <1307301755-13742-3-git-send-email-hmh@hmh.eng.br>
References: <1307301755-13742-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:52877 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753715Ab1FETWs (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 5 Jun 2011 15:22:48 -0400
In-Reply-To: <1307301755-13742-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, Matthew Garrett <mjg59@srcf.ucam.org>

Handle events 0x4010 and 0x4011 so that we do not pester users about them.

These events report when the thinkpad is docked/undocked to a native
hotplug dock (i.e. one that does not need ACPI handling, nor is represented
in the ACPI device tree).  Such docks are based on USB 2.0/3.0, and also
work as port replicators.

We really want a proper dock class to report these, or at least new input
EV_SW events.  Since it is not clear which one to use yet, keep reporting
them as vendor-specific ThinkPad events.

WARNING: As defined by the thinkpad-acpi sysfs ABI rules of engagement, the
vendor-specific events will be REMOVED as soon as generic events are made
available (duplicate events are a big problem), with an appropriate update
to the thinkpad-acpi sysfs/event ABI versioning.  Userspace is already
prepared to provide easy backwards compatibility for such changes when
convenient to the distro (see acpi-fakekey).

* Event 0x4010: docking to hotplug dock/port replicator
* Event 0x4011: undocking from hotplug dock/port replicator

Typical usecase would be to trigger display reconfiguration.

Reports mention T410, T510, and series 3 docks/port replicators.  Special
thanks to Robert de Rooy for his extensive report and analysis of the
situation.

http://www.thinkwiki.org/wiki/ThinkPad_Port_Replicator_Series_3
http://www.thinkwiki.org/wiki/ThinkPad_Mini_Dock_Series_3
http://www.thinkwiki.org/wiki/ThinkPad_Mini_Dock_Plus_Series_3
http://www.thinkwiki.org/wiki/ThinkPad_Mini_Dock_Plus_Series_3_for_Mobile_Workstations
http://lenovoblogs.com/insidethebox/?p=290

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>
Reported-by: Claudius Hubig <claudiushubig@chubig.net>
Reported-by: Doctor Bill <docbill@gmail.com>
Reported-by: Korte Noack <gbk.noack@gmx.de>
Reported-by: Robert de Rooy <robert.de.rooy@gmail.com>
Reported-by: Sebastian Will <swill@csail.mit.edu>
---
 Documentation/laptops/thinkpad-acpi.txt |    2 +
 drivers/platform/x86/thinkpad_acpi.c    |   44 ++++++++++++++++++++++++------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 4bc92ea..6181548 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -547,6 +547,8 @@ Events that are propagated by the driver to userspace:
 0x3006		Bay hotplug request (hint to power up SATA link when
 		the optical drive tray is ejected)
 0x4003		Undocked (see 0x2x04), can sleep again
+0x4010		Docked into hotplug port replicator (non-ACPI dock)
+0x4011		Undocked from hotplug port replicator (non-ACPI dock)
 0x500B		Tablet pen inserted into its storage bay
 0x500C		Tablet pen removed from its storage bay
 0x6011		ALARM: battery is too hot
diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index cdcd238..26c5b11 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -184,6 +184,10 @@ enum tpacpi_hkey_event_t {
 
 	/* Misc bay events */
 	TP_HKEY_EV_OPTDRV_EJ		= 0x3006, /* opt. drive tray ejected */
+	TP_HKEY_EV_HOTPLUG_DOCK		= 0x4010, /* docked into hotplug dock
+						     or port replicator */
+	TP_HKEY_EV_HOTPLUG_UNDOCK	= 0x4011, /* undocked from hotplug
+						     dock or port replicator */
 
 	/* User-interface events */
 	TP_HKEY_EV_LID_CLOSE		= 0x5001, /* laptop lid closed */
@@ -3521,6 +3525,34 @@ static bool hotkey_notify_wakeup(const u32 hkey,
 	return true;
 }
 
+static bool hotkey_notify_dockevent(const u32 hkey,
+				 bool *send_acpi_ev,
+				 bool *ignore_acpi_ev)
+{
+	/* 0x4000-0x4FFF: dock-related events */
+	*send_acpi_ev = true;
+	*ignore_acpi_ev = false;
+
+	switch (hkey) {
+	case TP_HKEY_EV_UNDOCK_ACK:
+		/* ACPI undock operation completed after wakeup */
+		hotkey_autosleep_ack = 1;
+		pr_info("undocked\n");
+		hotkey_wakeup_hotunplug_complete_notify_change();
+		return true;
+
+	case TP_HKEY_EV_HOTPLUG_DOCK: /* docked to port replicator */
+		pr_info("docked into hotplug port replicator\n");
+		return true;
+	case TP_HKEY_EV_HOTPLUG_UNDOCK: /* undocked from port replicator */
+		pr_info("undocked from hotplug port replicator\n");
+		return true;
+
+	default:
+		return false;
+	}
+}
+
 static bool hotkey_notify_usrevent(const u32 hkey,
 				 bool *send_acpi_ev,
 				 bool *ignore_acpi_ev)
@@ -3669,15 +3701,9 @@ static void hotkey_notify(struct ibm_struct *ibm, u32 event)
 			}
 			break;
 		case 4:
-			/* 0x4000-0x4FFF: dock-related wakeups */
-			if (hkey == TP_HKEY_EV_UNDOCK_ACK) {
-				hotkey_autosleep_ack = 1;
-				pr_info("undocked\n");
-				hotkey_wakeup_hotunplug_complete_notify_change();
-				known_ev = true;
-			} else {
-				known_ev = false;
-			}
+			/* 0x4000-0x4FFF: dock-related events */
+			known_ev = hotkey_notify_dockevent(hkey, &send_acpi_ev,
+						&ignore_acpi_ev);
 			break;
 		case 5:
 			/* 0x5000-0x5FFF: human interface helpers */
-- 
1.7.2.5
