Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799236F91F;
	Mon, 28 Sep 2026 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618650; cv=none; b=arydvmOcQeuCoDwsS8yskgm/xJ63A4DIru0EiHffPVE5ajEOLGbeGMSL9fMuyJaw7TRS795Cy7c+znizJVWi0hHGYDbcfs2s3yS7kYMu5LONEENs6hkJWWmqpa6E1SsxK/tUEbBeVwXf/QRkm4DWyopJfEO0NvZCMt/vyA/bJgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618650; c=relaxed/simple;
	bh=Qvw5ZGZAbhbHVH8Am9oUhYPqUm/T6DPi6GOhqeeYFHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=S0mfvTcRpKTa30y+KrOlzRT4yXdAL6IIK0NfuZHpvzyPa4yn5Fjzy94QcZoLediT8yFgTxTstncArNhR3Cu7woRqAwN/exLh1lDgwlh9QJ5XcSbDEXnx+yk+9scXHDlusc9QMWrWCiyyK/z7KXPIu9cGZDaaCBGDEI1SpPdJGD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=RX2pPdoy; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="RX2pPdoy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1790618185;
	bh=Qvw5ZGZAbhbHVH8Am9oUhYPqUm/T6DPi6GOhqeeYFHs=;
	h=From:To:Cc:Subject;
	b=RX2pPdoyeYSrCZ2B44ZrwtKTYyDlEbNIrBLwEYrKvQvVlNsVds+D6riftckueFvvT
	 mDjY9ORfxciZ3ROrqUOI+F47xZoUz2sQl65M7UZWM5QGMrfpkCluKekUC55p9JdRum
	 lLKmScgiRmnpnovzTn3242eT6k+6fYJpvZm9aqfUPrHFjuLZxMhKW3Lrd/voGYXW3Q
	 p8U/z2PmNilkHF7kKSC9SrgU5m0S3C3KnGQk6ds2ol7p47pA3W8JiBU/AtyIpYdpeB
	 7OCNUXAOfYC6jleab0DHSPREJnJenEl2wVX4VKtfdAZz7ACGy36WXt5emU/Ff1RoXs
	 xkJggv7h2O6Xw==
From: Yifei Yao <donplat@barrensea.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,=?utf-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,platform-driver-x86@vger.kernel.org,linux-kernel@vger.kernel.org,donplat@barrensea.org
Subject: [PATCH] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
Date: Tue, 29 Sep 2026 01:56:19 +0800
Message-ID: <87bj9htg3g.fsf@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

I have tested the Uniwill features on my laptop: the RGB keyboard
backlight works correctly and supports a maximum brightness level of 4.
The secondary fan only starts when the system load and performance
level increase. AC auto boot and USB powershare also work correctly.
The Super key and CPU temperature reporting work correctly, with
temperatures reported in millidegrees Celsius.

This machine does not have an NVIDIA GPU; it uses an AMD GPU.

Translated from Chinese to English using a machine translator.


--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-uniwill-Add-support-for-MECHREVO-WUJIE-Series-15-X-P.patch

From e746b686ab2e7814e59c1e23b5525f8c022563c8 Mon Sep 17 00:00:00 2001
From: Yifei Yao <donplat@barrensea.org>
Date: Tue, 29 Sep 2026 01:29:09 +0800
Subject: [PATCH] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

* drivers/platform/x86/uniwill/uniwill-acpi.c: Add
series_x5sp4nag_descriptor and DMI matching.

Signed-off-by: Yifei Yao <donplat@barrensea.org>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..d0fde42c46d7 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2712,6 +2712,19 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 	.lightbar_max_brightness = 200,
 };
 
+static struct uniwill_device_descriptor series_x5sp4nag_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
+		    UNIWILL_FEATURE_AC_AUTO_BOOT |
+		    UNIWILL_FEATURE_USB_POWERSHARE,
+	.kbd_led_single_color = false,
+	.kbd_led_max_brightness = 4,
+};
+
 /*
  * The featuresets below reflect somewhat chronological changes:
  * 1 -> 2: UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL is added to the EC firmware.
@@ -2996,6 +3009,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
 		},
 		.driver_data = &tux_featureset_4_descriptor,
 	},
+	{
+		.ident = "MECHREVO WUJIE Series 15 X Pro",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "MECHREVO"),
+			DMI_EXACT_MATCH(DMI_BOARD_NAME, "WUJIE Series-X5SP4NAG"),
+		},
+		.driver_data = &series_x5sp4nag_descriptor,
+	},
 	{
 		.ident = "TUXEDO InfinityBook Pro 14/15 Gen9 Intel/Commodore Omnia-Book 15 Gen9",
 		.matches = {
-- 
2.55.0


--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

DQotLSANCkRvbmp1YW5QbGF0aW51bSwgWWlmZWkgWWFvIDxkb25wbGF0QGJhcnJlbnNlYS5vcmc+
DQpHUEc6IDFDOUUgRUVFNSA0QzhFIEQ1QTggMzAzOSAgMUM4NyBBOUY2IDg2MzIgRDI1OSA0MEU2
DQrmu6HloILlha7nvo7kurog5b+954us5LiO5L2Z5YWu55uu5oiQDQo=
--=-=-=--
