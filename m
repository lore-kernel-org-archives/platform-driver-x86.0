Received: from mail.barrensea.org (mail.barrensea.org [198.12.121.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D93638C406;
	Fri, 16 Oct 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.12.121.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792152552; cv=none; b=E1BXbRZkA9EdsZpdH7gZP+JUvBJIQgFfQ7gTABsRsWnQXtiA/7yFzVJ6mV3DMuPdZ8zKYZp7Wa5ff0fz4J5hQ12w8CdN2lje3ahvmBXCNQjhOCbcBiowKdQKnRPGfdcuXIlrPwFx6k5S3jPU2RmpUNutfj+QVhCUkibLqJ0IPd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792152552; c=relaxed/simple;
	bh=LBQ9ZD62JTNmRS6AOCDUgLAf++EljMJmm0NlNWltPEY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aX/+3YCwQAqky7itBfwpg42qynSxLOe9OL0RTrkF81QnPb0LrsyRMk+Tzj7Qmfw2ZxuqQZl4ChdFBQHcZ2/ijWfPANze8S41/o8xPRDJRy+MebBZIQ5ZmLvlQl6k6tmgr8bJ6+nekWFDlZntAfcPHj0M2sHog235QQJhneOKysM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org; spf=pass smtp.mailfrom=barrensea.org; dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b=Mgli9WbV; arc=none smtp.client-ip=198.12.121.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=barrensea.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=barrensea.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=barrensea.org header.i=@barrensea.org header.b="Mgli9WbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=barrensea.org;
	s=mail; t=1792152549;
	bh=LBQ9ZD62JTNmRS6AOCDUgLAf++EljMJmm0NlNWltPEY=;
	h=From:To:Cc:Subject:In-Reply-To:References;
	b=Mgli9WbVpNX8mVRPtAarQNeqmwSswg7xo1X6jyYptFgrnAeasD4qoypEVPInD78gm
	 yuTqhkOfTdhWl8z/FrynZnqvCGzFr5UI7KMyYc1AjzP30gNhWs4VU5+NvLhVi9yndg
	 IpUMkCmGB8EphwOrCSoYxflCtXv7LMe/VtpU/3P6hMhVcGCsiA8A9fmyAfJ8v1Hxwj
	 iz/PbathLQBHuKkvnTA39OAlHyB2H5QGPn8JTf6Nq12oQufkkW2eFLFga12AHCHa0F
	 trr2p9tAC9pO02TsaUl2RDveWxW8Ox/eYF+BVYLXL/6qr5vZoZQri7JmJ3pL85edAe
	 nrH3poVDZKbGw==
From: Donjuanplatinum <donplat@barrensea.org>
To: W_Armin@gmx.de,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Donjuanplatinum <donplat@barrensea.org>
Subject: [PATCH v4] platform/x86: uniwill-laptop: Add support for MECHREVO WUJIE Series 15 X Pro
Date: Fri, 16 Oct 2026 20:08:57 +0800
Message-ID: <20261016120858.1752908-1-donplat@barrensea.org>
In-Reply-To: <305b37f0-b1c0-911a-0a07-42f6c4a51b85@linux.intel.com>
References: <305b37f0-b1c0-911a-0a07-42f6c4a51b85@linux.intel.com>
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

