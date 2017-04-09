From: Carlo Caione <carlo@caione.org>
Subject: [PATCH 2/2] hp-wmi: Fix detection for dock and tablet mode
Date: Sun,  9 Apr 2017 15:56:08 +0200
Message-ID: <20170409135608.15621-3-carlo@caione.org>
References: <20170409135608.15621-1-carlo@caione.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36719 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752412AbdDIN4S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Apr 2017 09:56:18 -0400
In-Reply-To: <20170409135608.15621-1-carlo@caione.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com
Cc: Carlo Caione <carlo@endlessm.com>

From: Carlo Caione <carlo@endlessm.com>

The current driver code is not checking for the error values returned by
'hp_wmi_dock_state()' and 'hp_wmi_tablet_state()' before passing the
returned values down to 'input_report_switch()'. This error code is
being translated to '1' in the input subsystem, reporting the wrong
status.

The biggest problem caused by this issue is that several laptops are
wrongly reported by the driver as docked, preventing them to be put to
sleep using the LID (and in most cases they are not even dockable).

With this patch we create the report switches only if we are able to
read the dock and tablet mode status correctly from ACPI.

Signed-off-by: Carlo Caione <carlo@endlessm.com>
---
 drivers/platform/x86/hp-wmi.c | 40 +++++++++++++++++++++++++++-------------
 1 file changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index 13ba65c..2b721fd 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -572,10 +572,12 @@ static void hp_wmi_notify(u32 value, void *context)
 
 	switch (event_id) {
 	case HPWMI_DOCK_EVENT:
-		input_report_switch(hp_wmi_input_dev, SW_DOCK,
-				    hp_wmi_dock_state());
-		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-				    hp_wmi_tablet_state());
+		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
+			input_report_switch(hp_wmi_input_dev, SW_DOCK,
+					    hp_wmi_dock_state());
+		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
+			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
+					    hp_wmi_tablet_state());
 		input_sync(hp_wmi_input_dev);
 		break;
 	case HPWMI_PARK_HDD:
@@ -644,6 +646,7 @@ static int __init hp_wmi_input_setup(void)
 {
 	acpi_status status;
 	int err;
+	int val;
 
 	hp_wmi_input_dev = input_allocate_device();
 	if (!hp_wmi_input_dev)
@@ -654,17 +657,26 @@ static int __init hp_wmi_input_setup(void)
 	hp_wmi_input_dev->id.bustype = BUS_HOST;
 
 	__set_bit(EV_SW, hp_wmi_input_dev->evbit);
-	__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
-	__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+
+	/* Dock */
+	val = hp_wmi_dock_state();
+	if (!(val < 0)) {
+		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
+		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
+	}
+
+	/* Tablet mode */
+	val = hp_wmi_tablet_state();
+	if (!(val < 0)) {
+		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
+		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
+	}
 
 	err = sparse_keymap_setup(hp_wmi_input_dev, hp_wmi_keymap, NULL);
 	if (err)
 		goto err_free_dev;
 
 	/* Set initial hardware state */
-	input_report_switch(hp_wmi_input_dev, SW_DOCK, hp_wmi_dock_state());
-	input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-			    hp_wmi_tablet_state());
 	input_sync(hp_wmi_input_dev);
 
 	if (!hp_wmi_bios_2009_later() && hp_wmi_bios_2008_later())
@@ -950,10 +962,12 @@ static int hp_wmi_resume_handler(struct device *device)
 	 * changed.
 	 */
 	if (hp_wmi_input_dev) {
-		input_report_switch(hp_wmi_input_dev, SW_DOCK,
-				    hp_wmi_dock_state());
-		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-				    hp_wmi_tablet_state());
+		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
+			input_report_switch(hp_wmi_input_dev, SW_DOCK,
+					    hp_wmi_dock_state());
+		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
+			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
+					    hp_wmi_tablet_state());
 		input_sync(hp_wmi_input_dev);
 	}
 
-- 
2.9.3
