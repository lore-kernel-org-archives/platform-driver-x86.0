From: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH 07/14] thinkpad-acpi: update HKEY and hotkey subdriver documentation (v2)
Date: Wed, 19 May 2010 00:26:17 -0300
Message-ID: <1274239584-17743-8-git-send-email-hmh@hmh.eng.br>
References: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from out3.smtp.messagingengine.com ([66.111.4.27]:43975 "EHLO
	out3.smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756176Ab0ESD0f (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 18 May 2010 23:26:35 -0400
In-Reply-To: <1274239584-17743-1-git-send-email-hmh@hmh.eng.br>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: platform-driver-x86@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, Henrique de Moraes Holschuh <hmh@hmh.eng.br>

Update the hotkey driver documentation to match the behaviour
of the fixed NVRAM polling code.

This also documents some HKEY events such as the alarms,
which is very important information.

Signed-off-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
---
 Documentation/laptops/thinkpad-acpi.txt |   66 +++++++++++++++++++++++--------
 1 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/Documentation/laptops/thinkpad-acpi.txt b/Documentation/laptops/thinkpad-acpi.txt
index 39c0a09..fc15538 100644
--- a/Documentation/laptops/thinkpad-acpi.txt
+++ b/Documentation/laptops/thinkpad-acpi.txt
@@ -292,13 +292,13 @@ sysfs notes:
 
 		Warning: when in NVRAM mode, the volume up/down/mute
 		keys are synthesized according to changes in the mixer,
-		so you have to use volume up or volume down to unmute,
-		as per the ThinkPad volume mixer user interface.  When
-		in ACPI event mode, volume up/down/mute are reported as
-		separate events, but this behaviour may be corrected in
-		future releases of this driver, in which case the
-		ThinkPad volume mixer user interface semantics will be
-		enforced.
+		which uses a single volume up or volume down hotkey
+		press to unmute, as per the ThinkPad volume mixer user
+		interface.  When in ACPI event mode, volume up/down/mute
+		events are reported by the firmware and can behave
+		differently (and that behaviour changes with firmware
+		version -- not just with firmware models -- as well as
+		OSI(Linux) state).
 
 	hotkey_poll_freq:
 		frequency in Hz for hot key polling. It must be between
@@ -309,7 +309,7 @@ sysfs notes:
 		will cause hot key presses that require NVRAM polling
 		to never be reported.
 
-		Setting hotkey_poll_freq too low will cause repeated
+		Setting hotkey_poll_freq too low may cause repeated
 		pressings of the same hot key to be misreported as a
 		single key press, or to not even be detected at all.
 		The recommended polling frequency is 10Hz.
@@ -397,6 +397,7 @@ ACPI	Scan
 event	code	Key		Notes
 
 0x1001	0x00	FN+F1		-
+
 0x1002	0x01	FN+F2		IBM: battery (rare)
 				Lenovo: Screen lock
 
@@ -404,7 +405,8 @@ event	code	Key		Notes
 				this hot key, even with hot keys
 				disabled or with Fn+F3 masked
 				off
-				IBM: screen lock
+				IBM: screen lock, often turns
+				off the ThinkLight as side-effect
 				Lenovo: battery
 
 0x1004	0x03	FN+F4		Sleep button (ACPI sleep button
@@ -433,7 +435,8 @@ event	code	Key		Notes
 				Do you feel lucky today?
 
 0x1008	0x07	FN+F8		IBM: toggle screen expand
-				Lenovo: configure UltraNav
+				Lenovo: configure UltraNav,
+				or toggle screen expand
 
 0x1009	0x08	FN+F9		-
 	..	..		..
@@ -444,7 +447,7 @@ event	code	Key		Notes
 				either through the ACPI event,
 				or through a hotkey event.
 				The firmware may refuse to
-				generate further FN+F4 key
+				generate further FN+F12 key
 				press events until a S3 or S4
 				ACPI sleep cycle is performed,
 				or some time passes.
@@ -512,15 +515,19 @@ events for switches:
 SW_RFKILL_ALL	T60 and later hardware rfkill rocker switch
 SW_TABLET_MODE	Tablet ThinkPads HKEY events 0x5009 and 0x500A
 
-Non hot-key ACPI HKEY event map:
+Non hotkey ACPI HKEY event map:
+-------------------------------
+
+Events that are not propagated by the driver, except for legacy
+compatibility purposes when hotkey_report_mode is set to 1:
+
 0x5001		Lid closed
 0x5002		Lid opened
 0x5009		Tablet swivel: switched to tablet mode
 0x500A		Tablet swivel: switched to normal mode
 0x7000		Radio Switch may have changed state
 
-The above events are not propagated by the driver, except for legacy
-compatibility purposes when hotkey_report_mode is set to 1.
+Events that are never propagated by the driver:
 
 0x2304		System is waking up from suspend to undock
 0x2305		System is waking up from suspend to eject bay
@@ -528,14 +535,39 @@ compatibility purposes when hotkey_report_mode is set to 1.
 0x2405		System is waking up from hibernation to eject bay
 0x5010		Brightness level changed/control event
 
-The above events are never propagated by the driver.
+Events that are propagated by the driver to userspace:
 
+0x2313		ALARM: System is waking up from suspend because
+		the battery is nearly empty
+0x2413		ALARM: System is waking up from hibernation because
+		the battery is nearly empty
 0x3003		Bay ejection (see 0x2x05) complete, can sleep again
+0x3006		Bay hotplug request (hint to power up SATA link when
+		the optical drive tray is ejected)
 0x4003		Undocked (see 0x2x04), can sleep again
 0x500B		Tablet pen inserted into its storage bay
 0x500C		Tablet pen removed from its storage bay
-
-The above events are propagated by the driver.
+0x6011		ALARM: battery is too hot
+0x6012		ALARM: battery is extremely hot
+0x6021		ALARM: a sensor is too hot
+0x6022		ALARM: a sensor is extremely hot
+0x6030		System thermal table changed
+
+Battery nearly empty alarms are a last resort attempt to get the
+operating system to hibernate or shutdown cleanly (0x2313), or shutdown
+cleanly (0x2413) before power is lost.  They must be acted upon, as the
+wake up caused by the firmware will have negated most safety nets...
+
+When any of the "too hot" alarms happen, according to Lenovo the user
+should suspend or hibernate the laptop (and in the case of battery
+alarms, unplug the AC adapter) to let it cool down.  These alarms do
+signal that something is wrong, they should never happen on normal
+operating conditions.
+
+The "extremely hot" alarms are emergencies.  According to Lenovo, the
+operating system is to force either an immediate suspend or hibernate
+cycle, or a system shutdown.  Obviously, something is very wrong if this
+happens.
 
 Compatibility notes:
 
-- 
1.7.1

