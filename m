From: Darren Hart <dvhart@infradead.org>
Subject: [PATCH 6/9] platform/x86: hp-wmi: Refactor dock and tablet state fetchers
Date: Wed, 19 Apr 2017 19:25:18 -0700
Message-ID: <8de18bfe5544277acb2d49d8feaea5455f3f95c2.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:39180 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966736AbdDTC0W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 19 Apr 2017 22:26:22 -0400
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
In-Reply-To: <cover.1492654448.git.dvhart@infradead.org>
References: <cover.1492654448.git.dvhart@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, carlo@caione.org

From: "Darren Hart (VMware)" <dvhart@infradead.org>

Both dock and tablet use the HPWMI_HARDWARE_QUERY, but require different
masks. Rather than using two functions with magic masks, define the
masks, and use a common accessor.

Signed-off-by: Darren Hart (VMware) <dvhart@infradead.org>
---
 drivers/platform/x86/hp-wmi.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index e46b61c..89d6278 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -102,6 +102,11 @@ enum hp_wmi_command {
 	HPWMI_ODM	= 0x03,
 };
 
+enum hp_wmi_hardware_mask {
+	HPWMI_DOCK_MASK		= 0x01,
+	HPWMI_TABLET_MASK	= 0x04,
+};
+
 #define BIOS_ARGS_INIT(write, ctype, size)				\
 	(struct bios_args)	{	.signature = 0x55434553,	\
 					.command = (write) ? 0x2 : 0x1,	\
@@ -265,7 +270,7 @@ static int hp_wmi_read_int(int query)
 	return val;
 }
 
-static int hp_wmi_dock_state(void)
+static int hp_wmi_hw_state(int mask)
 {
 	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
 
@@ -275,16 +280,6 @@ static int hp_wmi_dock_state(void)
 	return state & 0x1;
 }
 
-static int hp_wmi_tablet_state(void)
-{
-	int state = hp_wmi_read_int(HPWMI_HARDWARE_QUERY);
-
-	if (state < 0)
-		return state;
-
-	return (state & 0x4) ? 1 : 0;
-}
-
 static int __init hp_wmi_bios_2008_later(void)
 {
 	int state = 0;
@@ -432,7 +427,7 @@ static ssize_t show_als(struct device *dev, struct device_attribute *attr,
 static ssize_t show_dock(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	int value = hp_wmi_dock_state();
+	int value = hp_wmi_hw_state(HPWMI_DOCK_MASK);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "%d\n", value);
@@ -441,7 +436,7 @@ static ssize_t show_dock(struct device *dev, struct device_attribute *attr,
 static ssize_t show_tablet(struct device *dev, struct device_attribute *attr,
 			 char *buf)
 {
-	int value = hp_wmi_tablet_state();
+	int value = hp_wmi_hw_state(HPWMI_TABLET_MASK);
 	if (value < 0)
 		return -EINVAL;
 	return sprintf(buf, "%d\n", value);
@@ -544,10 +539,10 @@ static void hp_wmi_notify(u32 value, void *context)
 	case HPWMI_DOCK_EVENT:
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
-					    hp_wmi_dock_state());
+					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
 		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_tablet_state());
+					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
 		input_sync(hp_wmi_input_dev);
 		break;
 	case HPWMI_PARK_HDD:
@@ -625,14 +620,14 @@ static int __init hp_wmi_input_setup(void)
 	__set_bit(EV_SW, hp_wmi_input_dev->evbit);
 
 	/* Dock */
-	val = hp_wmi_dock_state();
+	val = hp_wmi_hw_state(HPWMI_DOCK_MASK);
 	if (!(val < 0)) {
 		__set_bit(SW_DOCK, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_DOCK, val);
 	}
 
 	/* Tablet mode */
-	val = hp_wmi_tablet_state();
+	val = hp_wmi_hw_state(HPWMI_TABLET_MASK);
 	if (!(val < 0)) {
 		__set_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit);
 		input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE, val);
@@ -926,10 +921,10 @@ static int hp_wmi_resume_handler(struct device *device)
 	if (hp_wmi_input_dev) {
 		if (test_bit(SW_DOCK, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_DOCK,
-					    hp_wmi_dock_state());
+					    hp_wmi_hw_state(HPWMI_DOCK_MASK));
 		if (test_bit(SW_TABLET_MODE, hp_wmi_input_dev->swbit))
 			input_report_switch(hp_wmi_input_dev, SW_TABLET_MODE,
-					    hp_wmi_tablet_state());
+					    hp_wmi_hw_state(HPWMI_TABLET_MASK));
 		input_sync(hp_wmi_input_dev);
 	}
 
-- 
2.9.3
