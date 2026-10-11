Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD8C1E8332;
	Sun, 11 Oct 2026 08:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791706805; cv=none; b=czRcc5bKsPRkeJDrzSZOMHX1KESJ1TCfB+3P4z+MDbzLjwlWxTma5cBqLcPi14ls1Rxc2jiFnKw3Y+NrNCKPqI2Gvflt2mymdjxGNu8QB54tdeJJyBEj5wVws8EqnIL3wzQq6LkGS/61BYgRS2ghl6v/Vx8NkU6tzRdBD3gz4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791706805; c=relaxed/simple;
	bh=/ctUPBIvW2H3HkD6Q4z7YVmlrHlM6NKhFmbdyR4H6QE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g6aiMI0XJQYJwEN9vv2v4wetTGpslyEA0A9MD+R/nUBCKkcA874hWrJ5GFyVbrvyF6btIONN56PpLru01O7VBLzjau+rha2swq5Wpbry++9aLCSG5tRr1RZbaD8onZYK5PDjoC/xrOkNewDDLjL7i1pj/T3TNXrCuyBUvAGwCGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=cBYC6Y3P; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="cBYC6Y3P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1791706473;
	bh=/ctUPBIvW2H3HkD6Q4z7YVmlrHlM6NKhFmbdyR4H6QE=;
	h=From:To:Cc:Subject;
	b=cBYC6Y3PcAa/I+CpM/njT1PCjYs2GOS5xDRoif30AtvLaVhFeX7siwJ7x8A0vR/+n
	 OXKVIQgeKpwfR000/wasDjUZPW5Xf6dpKPmSfArjRB54E77hhKmYDfwOPAWOv6TW5+
	 fmHXoiD4XuSgbcev5t5j5ef2h9OB/WDY5mcTNPybw9BNgOyWfZom7VdwcGFb0DrlNo
	 OSLY1QsaSXql/m3+b/X5eLmztPagOdMXDYdiGR4gAWNxLhUEU4GMBOed15PTGH4MDv
	 m5MfmoEmgJM2uJx6G1q/BkWRRqg0ISJafzcvgEOlQ979fKXMFv7pNWmu6kiigHbA2C
	 EUciYhQpJEIow==
From: Donjuanplatinum <donplat@barrensea.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donjuanplatinum <donplat@barrensea.org>
Subject: [PATCH v2] uniwill: Add support for MECHREVO WUJIE Series 15 X Pro
Date: Sun, 11 Oct 2026 16:14:21 +0800
Message-ID: <20261011081421.38128-1-donplat@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

I have tested the Uniwill features on my laptop: the RGB keyboard
backlight works correctly and supports a maximum brightness level of 4.
The secondary fan only starts when the system load and performance
level increase. AC auto boot and USB powershare also work correctly.
The Super key and CPU temperature reporting work correctly, with
temperatures reported in millidegrees Celsius.

This machine does not have an NVIDIA GPU; it uses an AMD GPU.

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

