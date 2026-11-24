Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795533195;
	b=tur8rlbo8wbeReDti/30rZ78ffVx8RYUrkGt05t+C40a0mWX6UT4bFThjP0sPcpz8hVk
	 9vXhYzIDxE1A9my0Sim8tmdWVnxMDw+JEIWxWYq9PQeSdKqiyn7JODx2y8BKhUNz7dyxA
	 O0OvWjUTgyEChr6gff0m5j1ObealR5RclqGFn6QTwD1IbEKh2HUAmHecKSImd+AMeradF
	 IswwK6BlJa5gUWR5e8FGFvvfhV18wIrPdaLYnDqQnTX+YoBZGS3M7MyTCSDe+/g9jmRcZ
	 lmylRLWbP3VfU98Zn2pweIQ3dvXwVk6PZNOc8Z8L+liCsH7Vsf8r2Cd6OrxbDNh9R9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795533195;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=UNh8UI+e4o8tUK+mhaePnzhujnaSCPFNR6MmHj6ssNw=;
	b=kqEGG13Od14fCqKGWiyGVAYEP5iwbKYEGs8guDWkhOd7GD0Um+uJ0kwbQ8cCJvep0F0I
	 SRbsCrwJptK9iWCqLPWJvpX3GwvnyKCp1v7EuZZgScxmvKMQP3O7s+g3XGuAe7PvpT4Ca
	 UHFuuSU3UMox9+Lva04M6cVviDKx33FBTxVx//mvP5eMWib32FTgOygdr/Dwy5elPWJ7h
	 NqinO0JEkgxWa1Ih6adeHImgUOaf2UbGp3e9wac0osWOCRhY3k+mmqLgBKj+VQwj2Pkov
	 2bJB2eMZlcCGxwod/3YCZZL5ImzMOqbfdCwzdg3Q0ZMHs39/bLbmjmoa44BuJ3ZRMjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b="t3Dfcmc/";
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32896606A323;
	Tue, 24 Nov 2026 15:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32896606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=t3Dfcmc/
Received: from wsembach-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id ADFF62FC004A;
	Tue, 24 Nov 2026 16:13:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1795533186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=UNh8UI+e4o8tUK+mhaePnzhujnaSCPFNR6MmHj6ssNw=;
	b=t3Dfcmc/t88kNFLDBlyzUr4psiCv0SvanIgRjCyQwUGaLFN96hMBWANXZ/0zDU20OE7NBA
	tmzw0xm00jwwb0Is4modtzNf0BzKsuVwqyczQo7eoDKnLvbKr8ifxRnDwN3f/1yOLUAEdc
	uLnDYFMIQ7+IvWVKUE4FtJcBG8qCke8=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: uniwill-laptop: Remove cTGP control from unsupported devices
Date: Tue, 24 Nov 2026 16:11:42 +0100
Message-ID: <20261124151303.435534-1-wse@tuxedocomputers.com>
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

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
V2: Fix "force" mode not respecting mutual exclusivity of new feature bit.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 30 ++++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index e2a6a704e942e..bef072f9f1b55 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -366,10 +366,12 @@
 #define UNIWILL_FEATURE_PRIMARY_FAN		BIT(8)
 #define UNIWILL_FEATURE_SECONDARY_FAN		BIT(9)
 #define UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL	BIT(10)
-#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(11)
-#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(12)
-#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(13)
-#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(14)
+/* Mutually exclusive with the cTGP control feature */
+#define UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY	BIT(11)
+#define UNIWILL_FEATURE_USB_C_POWER_PRIORITY	BIT(12)
+#define UNIWILL_FEATURE_KEYBOARD_BACKLIGHT	BIT(13)
+#define UNIWILL_FEATURE_AC_AUTO_BOOT		BIT(14)
+#define UNIWILL_FEATURE_USB_POWERSHARE		BIT(15)
 
 enum usb_c_power_priority_options {
 	USB_C_POWER_PRIORITY_CHARGING = 0,
@@ -1004,7 +1006,9 @@ static int uniwill_nvidia_ctgp_init(struct uniwill_data *data)
 {
 	int ret;
 
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
 		return 0;
 
 	ret = regmap_write(data->regmap, EC_ADDR_CTGP_DB_CTGP_OFFSET, 0);
@@ -2577,7 +2581,9 @@ static int uniwill_suspend_usb_powershare(struct uniwill_data *data)
 
 static int uniwill_suspend_nvidia_ctgp(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
 		return 0;
 
 	return regmap_clear_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
@@ -2686,7 +2692,9 @@ static int uniwill_resume_usb_powershare(struct uniwill_data *data)
 
 static int uniwill_resume_nvidia_ctgp(struct uniwill_data *data)
 {
-	if (!uniwill_device_supports(data, UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL))
+	if (!uniwill_device_supports_any(data,
+					 UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+					 UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY))
 		return 0;
 
 	return regmap_set_bits(data->regmap, EC_ADDR_CTGP_DB_CTRL,
@@ -2910,7 +2918,7 @@ static struct uniwill_device_descriptor phxtqxx_phxagxx_phxaqxx_phxpgxx_descript
 		    UNIWILL_FEATURE_GPU_TEMP |
 		    UNIWILL_FEATURE_PRIMARY_FAN |
 		    UNIWILL_FEATURE_SECONDARY_FAN |
-		    UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL |
+		    UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY |
 		    UNIWILL_FEATURE_USB_C_POWER_PRIORITY |
 		    UNIWILL_FEATURE_KEYBOARD_BACKLIGHT,
 	.kbd_led_single_color = true,
@@ -3106,7 +3114,7 @@ static int phxarxx_phxaqxx_probe(struct uniwill_data *data)
 
 	if (value & HAS_GPU)
 		data->features |= UNIWILL_FEATURE_GPU_TEMP |
-				  UNIWILL_FEATURE_NVIDIA_CTGP_CONTROL;
+				  UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY;
 
 	return 0;
 };
@@ -3711,7 +3719,9 @@ static int __init uniwill_init(void)
 
 	if (force) {
 		/* Assume that the device supports all features except the charge limit */
-		device_descriptor.features = UINT_MAX & ~UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT;
+		device_descriptor.features = UINT_MAX &
+			~(UNIWILL_FEATURE_BATTERY_CHARGE_LIMIT |
+			UNIWILL_FEATURE_NVIDIA_DB_SUPPORT_ONLY);
 		/* Some models only have a (white) single color keyboard backlight */
 		device_descriptor.kbd_led_single_color = false;
 		/* Some models only support 3 brightness levels */
-- 
2.43.0

