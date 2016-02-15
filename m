From: Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v5 5/5] dell-rbtn: Add a comment about the XPS 13 9350
Date: Mon, 15 Feb 2016 08:32:37 -0800
Message-ID: <17238db9f090e8b2c80756ccd4bcd8f4f1e3bfab.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:34182 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751303AbcBOQcu (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Mon, 15 Feb 2016 11:32:50 -0500
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
In-Reply-To: <cover.1455553470.git.luto@kernel.org>
References: <cover.1455553470.git.luto@kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, platform-driver-x86@vger.kernel.org, Darren Hart <dvhart@infradead.org>
Cc: Jon Eyolfson <jon@eyl.io>, Matthew Garrett <mjg59@srcf.ucam.org>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>

On the XPS 13 9350, the dell-rbtn mechanism has a new device id, and
the DSDT turns it off if a new enough _OSI is supported.  Add a
comment about why we don't bother supporting it.

Signed-off-by: Andy Lutomirski <luto@kernel.org>
---
 drivers/platform/x86/dell-rbtn.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/platform/x86/dell-rbtn.c b/drivers/platform/x86/dell-rbtn.c
index cd410e392550..b51a2008d782 100644
--- a/drivers/platform/x86/dell-rbtn.c
+++ b/drivers/platform/x86/dell-rbtn.c
@@ -217,6 +217,21 @@ static void rbtn_notify(struct acpi_device *device, u32 event);
 static const struct acpi_device_id rbtn_ids[] = {
 	{ "DELRBTN", 0 },
 	{ "DELLABCE", 0 },
+
+	/*
+	 * This driver can also handle the "DELLABC6" device that
+	 * appears on the XPS 13 9350, but that device is disabled
+	 * by the DSDT unless booted with acpi_osi="!Windows 2012"
+	 * acpi_osi="!Windows 2013".  Even if we boot that and bind
+	 * the driver, we seem to have inconsistent behavior in
+	 * which NetworkManager can get out of sync with the rfkill
+	 * state.
+	 *
+	 * On the XPS 13 9350 and similar laptops, we're not supposed to
+	 * use DELLABC6 at all.  Instead, we handle the rfkill button
+	 * via the intel-hid driver.
+	 */
+
 	{ "", 0 },
 };
 
-- 
2.5.0
