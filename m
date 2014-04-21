From: Konrad Zapalowicz <bergo.torino@gmail.com>
Subject: [PATCH 05/11] driver: thinkpad_acpi: add blank line after declaration
Date: Mon, 21 Apr 2014 21:10:50 +0200
Message-ID: <1398107456-31080-6-git-send-email-bergo.torino@gmail.com>
References: <1398107456-31080-1-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-2-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-3-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-4-git-send-email-bergo.torino@gmail.com>
 <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:56437 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754088AbaDUTLL (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 21 Apr 2014 15:11:11 -0400
Received: by mail-ee0-f54.google.com with SMTP id d49so3870859eek.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Apr 2014 12:11:10 -0700 (PDT)
In-Reply-To: <1398107456-31080-5-git-send-email-bergo.torino@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: ibm-acpi@hmh.eng.br, matthew.garrett@nebula.com, ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
Cc: Konrad Zapalowicz <bergo.torino@gmail.com>

This commit fixes the "Missing a blank line after declarations"
checkpatch warning.

Signed-off-by: Konrad Zapalowicz <bergo.torino@gmail.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 33fa7fc..f846d79 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -571,6 +571,7 @@ static int acpi_evalf(acpi_handle handle,
 	va_start(ap, fmt);
 	while (*fmt) {
 		char c = *(fmt++);
+
 		switch (c) {
 		case 'd':	/* int */
 			in_objs[params.count].integer.value = va_arg(ap, int);
@@ -696,6 +697,7 @@ static acpi_status __init tpacpi_acpi_handle_locate_callback(acpi_handle handle,
 			u32 level, void *context, void **return_value)
 {
 	struct acpi_device *dev;
+
 	if (!strcmp(context, "video")) {
 		if (acpi_bus_get_device(handle, &dev))
 			return AE_OK;
@@ -2839,6 +2841,7 @@ static ssize_t hotkey_radio_sw_show(struct device *dev,
 			   char *buf)
 {
 	int res;
+
 	res = hotkey_get_wlsw();
 	if (res < 0)
 		return res;
@@ -2866,6 +2869,7 @@ static ssize_t hotkey_tablet_mode_show(struct device *dev,
 			   char *buf)
 {
 	int res, s;
+
 	res = hotkey_get_tablet_mode(&s);
 	if (res < 0)
 		return res;
@@ -5490,6 +5494,7 @@ static int led_read(struct seq_file *m)
 	if (led_supported == TPACPI_LED_570) {
 		/* 570 */
 		int i, status;
+
 		for (i = 0; i < 8; i++) {
 			status = led_get_status(i);
 			if (status < 0)
@@ -6423,6 +6428,7 @@ static int __init brightness_init(struct ibm_init_struct *iibm)
 							 &props);
 	if (IS_ERR(ibm_backlight_device)) {
 		int rc = PTR_ERR(ibm_backlight_device);
+
 		ibm_backlight_device = NULL;
 		pr_err("Could not register backlight device\n");
 		return rc;
@@ -8564,6 +8570,7 @@ static int mute_led_init(struct ibm_init_struct *iibm)
 
 	for (i = 0; i < TPACPI_LED_MAX; i++) {
 		struct tp_led_table *t = &led_tables[i];
+
 		if (ACPI_SUCCESS(acpi_get_handle(hkey_handle, t->name, &temp)))
 			mute_led_on_off(t, false);
 		else
@@ -8586,6 +8593,7 @@ static void mute_led_resume(void)
 
 	for (i = 0; i < TPACPI_LED_MAX; i++) {
 		struct tp_led_table *t = &led_tables[i];
+
 		if (t->state >= 0)
 			mute_led_on_off(t, t->state);
 	}
-- 
1.8.1.2
