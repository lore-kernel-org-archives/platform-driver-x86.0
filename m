Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396C3FB059
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473488; cv=none; b=WIMCGoemziDLr5/hZZGBwHqzgY+c4bRvcTHK0z3jWvhnbmRFUvgHTYUdK2vrghTobCicuMv0ennkhJLHmoUiAI6QL77GIo4fBCHiBHF5KEFXboULuPscjhqeFlFUne6c0B8HI+vmN6oBfxOATn5x11Ylx9ciAxsnap4l0a0p4to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473488; c=relaxed/simple;
	bh=1MIPsiRa8Yv9adNUzqXgh8FjwkZk06M73yufRfmTA2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6IkveCDizELVHmYsqsE/pkuWNH1V9USGen1jqZyxkjELS9hFBor0Gp4mWHgiIb0kvuSyAjt8T+xxZMlN2tmSJnCCLigGwdXqBYP86UovvqZQQe9OE3phminSSWLc73VoSAQ4FKCQobPoc10DDw4Rgk0ToBcTMm4Q9bXakgTm4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OrR6H2mW; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OrR6H2mW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772473485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C6JYsOd8TdlbqACv3cEvQ1Kk9syE/nyQz9k47IUD4dU=;
	b=OrR6H2mWrydhvGBZ8pshN3p207t7Yl/I95Lpv0XrNUNGdR57DDzizxn0f+kM5xBqNJ4xgT
	n4iPFkg4mCvEDgNz5axBWHSXaUx5tOA7JEyjcLQNGkMerciocKb+kVE5l9iED1Wp9ca7ka
	oDmFhSc1wxSHDdwwY9+cR0lMB0BrNyc=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH v3 2/2] platform/x86: asus-wmi: fix screenpad brightness range
Date: Mon,  2 Mar 2026 18:44:31 +0100
Message-ID: <20260302174431.349816-3-denis.benato@linux.dev>
In-Reply-To: <20260302174431.349816-1-denis.benato@linux.dev>
References: <20260302174431.349816-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix screenpad brightness range being too limited without reason:
testing this patch on a Zenbook Duo showed the hardware minimum not being
too low, therefore allow the user to configure the entire range, and
expose to userspace the hardware brightness range and value.

Fixes: 2c97d3e55b70 ("platform/x86: asus-wmi: add support for ASUS screenpad")
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Luke Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8925a0ee26af..17e2dcaf2b4c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -125,7 +125,6 @@ module_param(fnlock_default, bool, 0444);
 #define NVIDIA_TEMP_MIN		75
 #define NVIDIA_TEMP_MAX		87
 
-#define ASUS_SCREENPAD_BRIGHT_MIN 20
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
@@ -4408,13 +4407,13 @@ static int read_screenpad_brightness(struct backlight_device *bd)
 		return err;
 	/* The device brightness can only be read if powered, so return stored */
 	if (err == BACKLIGHT_POWER_OFF)
-		return asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
+		return bd->props.brightness;
 
 	err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &retval);
 	if (err < 0)
 		return err;
 
-	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK) - ASUS_SCREENPAD_BRIGHT_MIN;
+	return (retval & ASUS_WMI_DSTS_BRIGHTNESS_MASK);
 }
 
 static int update_screenpad_bl_status(struct backlight_device *bd)
@@ -4454,22 +4453,19 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 	int err, power;
 	int brightness = 0;
 
-	power = read_screenpad_backlight_power(asus);
+	power = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_SCREENPAD_POWER);
 	if (power < 0)
 		return power;
 
-	if (power != BACKLIGHT_POWER_OFF) {
+	if (power) {
 		err = asus_wmi_get_devstate(asus, ASUS_WMI_DEVID_SCREENPAD_LIGHT, &brightness);
 		if (err < 0)
 			return err;
 	}
-	/* default to an acceptable min brightness on boot if too low */
-	if (brightness < ASUS_SCREENPAD_BRIGHT_MIN)
-		brightness = ASUS_SCREENPAD_BRIGHT_DEFAULT;
 
 	memset(&props, 0, sizeof(struct backlight_properties));
 	props.type = BACKLIGHT_RAW; /* ensure this bd is last to be picked */
-	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX - ASUS_SCREENPAD_BRIGHT_MIN;
+	props.max_brightness = ASUS_SCREENPAD_BRIGHT_MAX;
 	bd = backlight_device_register("asus_screenpad",
 				       &asus->platform_device->dev, asus,
 				       &asus_screenpad_bl_ops, &props);
@@ -4480,7 +4476,7 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 
 	asus->screenpad_backlight_device = bd;
 	asus->driver->screenpad_brightness = brightness;
-	bd->props.brightness = brightness - ASUS_SCREENPAD_BRIGHT_MIN;
+	bd->props.brightness = brightness;
 	bd->props.power = power;
 	backlight_update_status(bd);
 
-- 
2.53.0

