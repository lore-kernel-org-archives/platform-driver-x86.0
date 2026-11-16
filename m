Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794823492;
	b=CW71aOQM8QuaxQ+M4M2ON0YjGQfOMtgr+yjgn6USdDs6efGQfiewpLTdeWUkzh+LAuhP
	 tMBYnP+2p77PtjdC9mlIqJSVsvqW8nbR+5sAZMNcXIsJjMuz7tg/0GZX82UDiJ7ijC35k
	 iBvjQ1DLz0kDKvzD+44NHSvOIvrbC45BzTV7cVDQVJTMlXC5s5oHPa8mO+uieRJn9q+GF
	 8pxb57567SulLS8k7LXXmdtA8HoZMIizk0IjinAeW/4ywO10VEPJCnEaOMPo3rY6MeokA
	 NNW9RHomdZr/hf8H03O2hk25LHRuiEadp6btrHjkBoVq8G0P2vG3TOjt8pDQTj7PsDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794823492;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-MBO-RS-ID:X-MBO-RS-META;
	bh=ybJrA9ybe5eIn8trG0ah/ZMJtYtX04BZv0cvH05uGx4=;
	b=RrdosFfZCh2qT88FshT2aXAdW3KFTe5luttJ7fybFNHXGghOt55FO+ztkUtRSJFwtaRQ
	 u1biQ1QNCq9wO7N3tm+hofWzum+T9shwZgeV53Xx4j9yrACXTVqwX/5cecr/ZT3VL1OLg
	 RfmwgjBuvFIEBMkOxM1UPqz9EVxU00NpYqDcci89f/UdGf3W79CwHnaj/ilHal3Bwv6bA
	 qR+m5wsHODiXrYJEvvHDhNAbdF9Hh8kPy/w5p5qQ00MyH4ShG7Y0ezgMIu6ZEylt0Faty
	 KepOLEuPubjalA4P1wKOHgM1vaRkUBdlTwgg1gtPmYkENY72BjfaN6nOkZIC6Vx5ucg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mailbox.org;
	spf=pass smtp.mailfrom=mailbox.org;
	dkim=pass header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Ws1wgy1l;
	arc=none smtp.remote-ip=80.241.56.151
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836D5606A31C;
	Mon, 16 Nov 2026 10:04:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 836D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Ws1wgy1l
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4jSk4J3GPXz8v8q;
	Mon, 16 Nov 2026 11:04:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1794823488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ybJrA9ybe5eIn8trG0ah/ZMJtYtX04BZv0cvH05uGx4=;
	b=Ws1wgy1l7/Rw9ub/iOSGhz2UoWKoBDzZdXo5N/83lF0Aw7VNByRya2/VL/1Ax5weRxrnJe
	iqjWDktzrQyHW3kMZL9rBRZI7xqdkBTJjC1GmH6L84LoBbuzDBKoNV38qA7iJoUaKz5sl4
	I1juty8scwEgy2at/uhDnnpYVRok33J197s2FCuYBzj7QggGlGKVp8yq4Es/C55tvUs0Cw
	8wguj/7zSBHELjJTWO5pR7o5Lxkt1aKE0+8+K4CaM6dvgrZLRXL8hRZ462oiZT6xqRLOI3
	TdKNenYgNzEzNZHo3MG+QKmEZS3G1z13cb7+6ScDhvHWCun5+z3J1G11+Rz/Lw==
From: Alexander Gruhlke <gruhlke@mailbox.org>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alexander Gruhlke <gruhlke@mailbox.org>
Subject: [PATCH] platform/x86: wireless-hotkey: Add support for Pegatron airplane button
Date: Mon, 16 Nov 2026 11:04:14 +0100
Message-ID: <20261116100414.342197-1-gruhlke@mailbox.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: e51d516b5b1632d60e7
X-MBO-RS-META: nqm9bqznux4rqjkqy67ke1gde6f683yw

The PTK0001 ACPI device is used by the "Pega Radio Switch Device"
Windows driver on Pegatron-built laptops like the Medion Akoya E6246.
Its airplane mode hotkey sends an 0x88 ACPI notification instead of
0x80.

Store the expected notification value in the device ID table and add
support for the PTK0001 ACPI device.

Signed-off-by: Alexander Gruhlke <gruhlke@mailbox.org>
---
Written with Claude Code (Claude Opus 5.5): it traced Fn+F2 through the
DSDT (EC query _Q0B -> Notify(PTK0001, 0x88)) and wrote the patch. I
reviewed it.

Tested on a Medion Akoya E6246 (MD63200) on 7.3.4: each Fn+F2 press now
reports KEY_RFKILL, which soft-blocks and unblocks Wi-Fi and Bluetooth
in turn.

 drivers/platform/x86/wireless-hotkey.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/wireless-hotkey.c b/drivers/platform/x86/wireless-hotkey.c
index 3151844d16..1c06f41715 100644
--- a/drivers/platform/x86/wireless-hotkey.c
+++ b/drivers/platform/x86/wireless-hotkey.c
@@ -11,6 +11,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/acpi.h>
 #include <acpi/acpi_bus.h>
 
@@ -21,17 +22,20 @@ MODULE_ALIAS("acpi*:HPQ6001:*");
 MODULE_ALIAS("acpi*:WSTADEF:*");
 MODULE_ALIAS("acpi*:AMDI0051:*");
 MODULE_ALIAS("acpi*:LGEX0815:*");
+MODULE_ALIAS("acpi*:PTK0001:*");
 
 struct wl_button {
 	struct input_dev *input_dev;
 	char phys[32];
+	u32 event;
 };
 
 static const struct acpi_device_id wl_ids[] = {
-	{"HPQ6001", 0},
-	{"WSTADEF", 0},
-	{"AMDI0051", 0},
-	{"LGEX0815", 0},
+	{"HPQ6001", 0x80},
+	{"WSTADEF", 0x80},
+	{"AMDI0051", 0x80},
+	{"LGEX0815", 0x80},
+	{"PTK0001", 0x88},
 	{"", 0},
 };
 
@@ -76,7 +80,7 @@ static void wl_notify(acpi_handle handle, u32 event, void *data)
 {
 	struct wl_button *button = data;
 
-	if (event != 0x80) {
+	if (event != button->event) {
 		pr_info("Received unknown event (0x%x)\n", event);
 		return;
 	}
@@ -101,6 +105,7 @@ static int wl_probe(struct platform_device *pdev)
 	if (!button)
 		return -ENOMEM;
 
+	button->event = (uintptr_t)device_get_match_data(&pdev->dev);
 	platform_set_drvdata(pdev, button);
 
 	err = wireless_input_setup(&pdev->dev);
-- 
2.56.1

