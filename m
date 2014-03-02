From: Stefan Seyfried <stefan.seyfried@googlemail.com>
Subject: Fix sleep / suspend keys for Toughbook CF-51
Date: Sun, 02 Mar 2014 18:01:19 +0100
Message-ID: <531363DF.7080507@message-id.googlemail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------000307090701090909020701"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ea0-f178.google.com ([209.85.215.178]:56762 "EHLO
	mail-ea0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751370AbaCBRBY (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 2 Mar 2014 12:01:24 -0500
Received: by mail-ea0-f178.google.com with SMTP id a15so3850255eae.23
        for <platform-driver-x86@vger.kernel.org>; Sun, 02 Mar 2014 09:01:23 -0800 (PST)
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: platform-driver-x86@vger.kernel.org
Cc: Harald Welte <laforge@gnumonks.org>

This is a multi-part message in MIME format.
--------------000307090701090909020701
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi all,

my panasonic cf-51 does no longer react to the suspend and hibernate
keys. I cannot tell when this started since I no longer use the machine
on a daily basis, but I suspect it started when userspace switched from
using /proc/acpi/event to the input layer, wich was quite some time ago ;-)

Today I investigated the issue and found that the firmware simply does
not generate any event on "key down" for those keys, but only on "key up".

The attached patch works around the problem.

Best regards,

	Stefan
-- 
Stefan Seyfried
Linux Consultant & Developer -- GPG Key: 0x731B665B

B1 Systems GmbH
Osterfeldstraße 7 / 85088 Vohburg / http://www.b1-systems.de
GF: Ralph Dehner / Unternehmenssitz: Vohburg / AG: Ingolstadt,HRB 3537

--------------000307090701090909020701
Content-Type: text/x-patch;
 name="0001-panasonic-laptop-fix-sleep-keys-on-CF-51.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-panasonic-laptop-fix-sleep-keys-on-CF-51.patch"

From 7c96fee748cfd3e64732a7ac142f5dea07d7379f Mon Sep 17 00:00:00 2001
From: Stefan Seyfried <seife+kernel@b1-systems.com>
Date: Sun, 2 Mar 2014 17:50:01 +0100
Subject: [PATCH] panasonic-laptop: fix sleep keys on CF-51

At least on my CF-51, both sleep and hibernate keys do not
generate "key down" events, only "key up". Because of this,
the input layer does ignore both keys. The work around is
to generate a key down event before the key up. To avoid
double events on non-broken firmware, this is only done if
no key down is ever seen for those keys.

Signed-off-by: Stefan Seyfried <seife+kernel@b1-systems.com>
---
 drivers/platform/x86/panasonic-laptop.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/platform/x86/panasonic-laptop.c b/drivers/platform/x86/panasonic-laptop.c
index 609d387..9fc3bf5 100644
--- a/drivers/platform/x86/panasonic-laptop.c
+++ b/drivers/platform/x86/panasonic-laptop.c
@@ -449,6 +449,7 @@ static struct attribute_group pcc_attr_group = {
 
 /* hotkey input device driver */
 
+static int sleep_keydown_seen;
 static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 {
 	struct input_dev *hotk_input_dev = pcc->input_dev;
@@ -462,6 +463,16 @@ static void acpi_pcc_generate_keyinput(struct pcc_acpi *pcc)
 				 "error getting hotkey status\n"));
 		return;
 	}
+
+	/* hack: some firmware sends no key down for sleep / hibernate */
+	if ((result & 0xf) == 0x7 || (result & 0xf) == 0xa) {
+		if (result & 0x80)
+			sleep_keydown_seen = 1;
+		if (! sleep_keydown_seen)
+			sparse_keymap_report_event(hotk_input_dev,
+					result & 0xf, 0x80, false);
+	}
+
 	if (!sparse_keymap_report_event(hotk_input_dev,
 					result & 0xf, result & 0x80, false))
 		ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
-- 
1.9.0


--------------000307090701090909020701--
