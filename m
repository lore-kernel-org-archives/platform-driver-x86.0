Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.90.84.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581284;
	b=ggTCgUO2WWNObfv1PXbWfgfA1q418KS4XnNk++3M/wo+pcPZTpBBoqzi4kXr2N4ybpsh
	 12q7iVSVZvKJFjDvQlCJyK1z1KA8d5/m/rqHIxN2Ph26acy9zOhJl+T+V/GAe86C3le+Q
	 lbP9htGyWgU0g/6zCUEBZBK0wH/+GpBJlqzPbR7usloYHxaTFea0uDIvHHE/mpPtsloVt
	 IGBdgAM8PpsKnZ0W8YKvQ374MZgrcJLas9/5M5jjFoVrxDcKVpafaeCzp00Dh4HuDYFkV
	 j2+wtHuZP95bq70cyDOrP8vEW47bJAPQjLzVxas5bgZ28+lz/41MMG/AcCpwradYGiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581284;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=hzAADba+0iq0bsd1y8CVOAXzcIDIRK3t2toPd9Ehwgk=;
	b=LVGQI2rIJDzhH5xLehLCnLKzTEGgA6qcRpU698FFXRX5cQzqTZGjoKHEkTPexjl6RLWv
	 eGAraXHbJzFj5yxPy4QKqmrms/ThUSJi3zdgu4vBJUoKIo6+SEAla3hPw8eEmQ5EgZItv
	 k0Z014OvZd5BSJAN3BjMXT9QWgUjwA+teQkEUzMlUHDoFGl6HtGz++tP/trO5B5WBBhpO
	 YzkbAsTqu9TFE8YLWU5WvWezo3EWdCnl+c9G6X+pPDcARrrJjafDIKOhJUZBqFcRmX7qU
	 DXdYrHc0cVH3ZMTWplWS45ZsKLNbAxP/K4c74txLeHibSgYsTgCyhVygt9E95pEo25g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tuxedocomputers.com;
	spf=pass smtp.mailfrom=tuxedocomputers.com;
	dkim=pass header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Yn9rhCSb;
	arc=none smtp.remote-ip=157.90.84.7
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F3606A323;
	Fri, 13 Nov 2026 14:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E46F3606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.a=rsa-sha256 header.s=default header.b=Yn9rhCSb
Received: from wsembach-tuxedo.fritz.box (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id EF7A72FC0197;
	Fri, 13 Nov 2026 15:47:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1794581275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hzAADba+0iq0bsd1y8CVOAXzcIDIRK3t2toPd9Ehwgk=;
	b=Yn9rhCSbS2hR/W5udv0+rjxF0z8eqkF5IOstLY6eTAovUqJ8UmcSKeQjr33gplFtiMaJBX
	4/EwCOCNGYEvDnD75gRh4TGqAft0noM6/DTvBw8Ue5IPdgFtEAMGhNzGYxetsE9ooiOicU
	ptUkNpGFn2bWhP/SLeUJTyAqK5qosOI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] platform/x86: uniwill-laptop: Remove cTGP control from unsupported devices
Date: Fri, 13 Nov 2026 15:47:46 +0100
Message-ID: <20261113144749.59958-1-wse@tuxedocomputers.com>
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
 drivers/platform/x86/uniwill/uniwill-acpi.c | 26 ++++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index e2a6a704e942e..c0a75bc6e66db 100644
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
-- 
2.43.0

