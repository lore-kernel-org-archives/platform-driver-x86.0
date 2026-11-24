Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539156;
	b=2U7BZEYAMdLt51X1b2QAen63bBmTwJDXm1jv54rmFMICGSNRMOjM8/kMesl5WP2TxW5j
	 xXc+MJpWdr0eIxpBPrBXSU9w0W+5H2ZAdcL3A7GwEtouL+IE7NOIV15F/LYG33pTAMvjX
	 nDx3aZzl5LqkDZeAX1MMD+RDRK3QowlsvO4L8dpU+ZAiz9IfZgMPqlhrdls9nikvM/6Jh
	 VL88asQ1ozeUqO6vc6hATMeTN2bXBdfQQtBoJP1vhNUXwl6hHffao3WLHPgzCtwrcEKdZ
	 WD9hYyDie+0CMgQ1PB/9gs941bA4++DAQq5JDJSx1yZGr9cAum/jGaBryVdtzXYkZtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539156;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zlFQZbNWBXkQuSHi9548ZAMCS2pLYLACEKhtgNjn0zw=;
	b=oVnnWz4/bhGqEAgavGJGPmJWbiDTYg3gIEF+t0j1NvYtCKw4TeagPd9f+1u8H3GiYuYP
	 Nyia44KtoAATWP2msdhUTIWdts+OGBhVy/K8fGFxWzFGv+QRv7/fL/GhFG/30mdXdjKb9
	 VlBHIYA6++GzZuiYUdnFbqzUNtr7vEilsUapn1/+h0Wf7Oj1C7VAUJi8q9W8zaWt2m2jd
	 TxM4gWwZPBKtVRNGsVzeEawyKvS0jaYLvyGYJNa3lEwjiSSD/2s6sEnSbdbF4nYDFmN20
	 VDcxoymOkq1DFzJ1uqAeehfAsWQwgrdIhPtWeBdBm/3ZQ8atU03QoXlw36fDSV5zwXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=YqW+lAKK;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B32B606A33C;
	Tue, 24 Nov 2026 16:52:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B32B606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=YqW+lAKK
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 065C92FC004A;
	Tue, 24 Nov 2026 17:52:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795539152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zlFQZbNWBXkQuSHi9548ZAMCS2pLYLACEKhtgNjn0zw=;
	b=YqW+lAKKuJage7En2KJVCXGyI/bYUi7yjyidTE5D2eJXrYQhD7briW63CnyPKA8S7tp/cK
	uZljeO1H4hTCMSnNrtmWiINk943dVUqoa3lj37tk+u0HV2E6bcMhxcuupqJfS3qu4RcpeL
	1kjSTbqXFelWkEjKAJFeu+eKar2+6Gw=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86: uniwill-laptop: Remove cTGP control from unsupported devices
Date: Tue, 24 Nov 2026 17:39:53 +0100
Message-ID: <20261124165230.680864-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
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

Some devices like the InfinityBook Pro series have Dynamic Boost support,
but the cTGP setting is actually ignored.

This commit adds the ability to still initialize DB, but hide the noop cTGP
sysfs attribute and applies this to the respective devices.

Currently there is no functional difference between setting only
UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL and UNIWILL_FEATURE_NVIDIA_DB_SUPPORT +
UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL. In both cases the initialization
procedure is still the same and UNIWILL_FEATURE_NVIDIA_DB_SUPPORT has no
sysfs attributes to show or hide. However for the possibillity of this to
change in the future and semantical reasons, the bits should still be set
accordingly.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
V2: Fix "force" mode not respecting mutual exclusivity of new feature bit.
V3: Change semantics from "DB only" to "DB support" undoing V2 changes in
    the process.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 39 +++++++++++++++------
 1 file changed, 29 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index e2a6a704e942e..3d8f40239708c 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -365,11 +365,12 @@
 #define UNIWILL_FEATURE_GPU_TEMP		BIT(7)
 #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
-#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
-#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
-#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
-#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
-#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
+#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT	BIT(10)
+#define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(11)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(12)
+#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(13)
+#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(14)
+#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(15)
 
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING = 0,
@@ -1004,7 +1005,9 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
 {
 	int ret;
 
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
 		return 0;
 
 	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
@@ -2577,7 +2580,9 @@ static int uniwill_suspend_usb_powershare(struct uniwill_data *data)
 
 static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
 		return 0;
 
 	return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
@@ -2686,7 +2691,9 @@ static int uniwill_resume_usb_powershare(struct uniwill_data *data)
 
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
 		return 0;
 
 	return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
@@ -2773,6 +2780,7 @@ static struct uniwill_device_descriptor machenike_l16p_descriptor __initdata = {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
@@ -2789,6 +2797,7 @@ static struct uniwill_device_descriptor mechrevo_yilong15pro_descriptor __initda
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
@@ -2805,6 +2814,7 @@ static struct uniwill_device_descriptor mechrevo_jiaolong_series_x6xr55xk __init
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
@@ -2845,6 +2855,7 @@ static struct uniwill_device_descriptor lapkc71e_descriptor __initdata = {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 	.lightbar_max_intensity = 200,
 };
@@ -2910,7 +2921,7 @@ static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_descript
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
-		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
 	.kbd_led_single_color = true,
@@ -2925,6 +2936,7 @@ static struct uniwill_device_descriptor gmxmgxx_gmxngxx_gmxxgxx_descriptor __ini
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
@@ -2940,6 +2952,7 @@ static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_pol_descriptor __initdat
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
@@ -2956,6 +2969,7 @@ static struct uniwill_device_descriptor gmxzgxx_gmxtgxx_ste_descriptor __initdat
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY,
 	.lightbar_max_intensity = 36,
@@ -2996,6 +3010,7 @@ static struct uniwill_device_descriptor gmxrgxx_descriptor __initdata = {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 	.probe = gmxrgxx_probe,
 };
@@ -3009,6 +3024,7 @@ static struct uniwill_device_descriptor gmxagxx_descriptor __initdata = {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 	.lightbar_max_intensity = 36,
 };
@@ -3021,6 +3037,7 @@ static struct uniwill_device_descriptor gmxxgxx_gmxpxxx_descriptor __initdata =
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL,
 };
 
@@ -3046,6 +3063,7 @@ static struct uniwill_device_descriptor gmxhgxx_descriptor __initdata = {
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE |
@@ -3062,6 +3080,7 @@ static struct uniwill_device_descriptor gmxixxx_xxxx45xx_xxxx55xx_xxxx57xx_descr
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT |
 		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
 		    UNIWILL_FEATURE_AC_AUTO_BOOT |
 		    UNIWILL_FEATURE_USB_POWERSHARE,
@@ -3106,7 +3125,7 @@ static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
 
 	if (value & HAS_GPU)
 		data->features |= UNIWILL_FEATURE_GPU_TEMP |
-				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+				  UNIWILL_FEATURE_NVIDIA_DB_SUPPORT;
 
 	return 0;
 };
-- 
2.43.0

