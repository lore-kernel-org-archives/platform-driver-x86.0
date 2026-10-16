Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908AB3A7F68;
	Fri, 16 Oct 2026 08:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139339; cv=none; b=WKyE23AI9F0H4X2CKkhBnty2+k6nZ2MrrdOXcIGCwWvLRIVKBR6B/2Hwp9i+enwV5Cnwd45y87OS8jdnd/GBGaN2UroC3zFwqR3af04UaWo3ovqrIUitoFwb8uQMPjElg8zI8wwyAOkgINfEyQrcK+C8IE2DH5h+lpXe4C5xC58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139339; c=relaxed/simple;
	bh=LBQ9ZD62JTNmRS6AOCDUgLAf++EljMJmm0NlNWltPEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKXab9uxL1NGasJkm0ANBplFpU7bkomgNVelZehNdR1smcQ4RYWEzcaPpS+VWYxJJbWdDzTUPBedCQk67lJLVVi0/a+2bUCr7gup/ITstFnENxaAljZuNvS8Mytl2prw6T7qD2ysu/Pljc5Rrj/ZgHdfDvM7zdKNZPU2uQfJGhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=GDsNndwE; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="GDsNndwE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1792139335;
	bh=LBQ9ZD62JTNmRS6AOCDUgLAf++EljMJmm0NlNWltPEY=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=GDsNndwE3gr5jIrHak54DGb5SZiWm1H71En0o+14tOQh9Z1PWhFtJidFODb8TpWhu
	 MbKLpLXROuKg9by1TrASJwujvTFL2vpicJKdxIVV0KWYERAXhDVVR7hdXMpZ26kKx2
	 +OY4eMvevnwA0P8QcbOpWH8Wkprumb+1hBSt7npDIHDcXgLqspOtjWdV36Ft7MhXko
	 ivmudPK/SCRVDr9Rgqsj7AtG7R6CNY+X60HAD9dzjJOvexRbTiAZTRBBDHmtketE/3
	 A97ICg6N5bDDPej38N06BEgHn0wYcxMWWb7peKKNI/AU8UQIX2uqsz8JxcMIDiPTa0
	 ZTltLKOgLCRbw==
From: Donjuanplatinum <donplat@barrensea.org>
To: W_Armin@gmx.de
Cc: hans@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donjuanplatinum <donplat@barrensea.org>
Subject: [PATCH v3 RESEND] platform/x86: uniwill-laptop: Add support for
Date: Fri, 16 Oct 2026 16:28:20 +0800
Message-ID: <20261016082819.1414285-2-donplat@barrensea.org>
In-Reply-To: <87wlridqzx.fsf@barrensea.org>
References: <87wlridqzx.fsf@barrensea.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the MECHREVO WUJIE Series 15 X Pro (WUJIE
Series-X5SP4NAG).

Signed-off-by: Yifei Yao <donplat@barrensea.org>
---
 drivers/platform/x86/uniwill/uniwill-acpi.c | 22 +++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c96..bf46f03fb5f5 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -2712,6 +2712,20 @@ static struct uniwill_device_descriptor lapkc71f_descriptor __initdata = {
 	.lightbar_max_brightness = 200,
 };
 
+static struct uniwill_device_descriptor series_x5sp4nag_descriptor __initdata = {
+	.features = UNIWILL_FEATURE_FN_LOCK |
+		    UNIWILL_FEATURE_SUPER_KEY |
+		    UNIWILL_FEATURE_CPU_TEMP |
+		    UNIWILL_FEATURE_PRIMARY_FAN |
+		    UNIWILL_FEATURE_SECONDARY_FAN |
+	            UNIWILL_FEATURE_BATTERY_CHARGE_MODES |
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
@@ -2996,6 +3010,14 @@ static const struct dmi_system_id uniwill_dmi_table[] __initconst = {
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

