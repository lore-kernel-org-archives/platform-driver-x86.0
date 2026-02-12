Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170F1A9FBA
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 22:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770933817; cv=none; b=qVuVbb3t9180xX82/Yru1Wt3dKW9WF3gcYShwca7fvSV40HyT9swcVtGoGtujjR+2Ojg4omMijzMwEvzTSIPWEFaZ3330L9v4JI1EDFuklf+tT8MYkiqkICljXYsgl1hCg6iryQyvDelbdCii4OPqVn1KV+nFSTpgz+0tJ5PcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770933817; c=relaxed/simple;
	bh=zyqwF31fyoruv/y1t2PhjiBiReQMQXktD5kRu2o3d1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fhZ61HGBUhr9kE/B09C9m2u8RDQhE8tNKxmaBlEzo5NzF8SDKILxu0y62+u3tSDSCDaqq7ZyLN6SJng1sJ67y4WbMpd1tTMxB2xj6/+VBubI+DGkrxx2vxn/qYyBgw6l1u56OR+dneRTjaqp4IM7vQOw5uD2gQB3LPuCASHr5Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=QRm+4n7r; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="QRm+4n7r"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770933779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tiMOT32y1vW0t6b4QGuHk6IsPABbljM/OC4LYox+mog=;
	b=QRm+4n7rP7rodBbsS127UGdMPL0W+2FUhfSO5NTIh66y+57N0PUKCr8BgLbJlozyGNPXTb
	yF1B7Q81ah5jWZFqj3YlKMRDW6yVzAW++mLXiNfqVC4T1D8wDavOzlf9BLBIYMuxYkXPml
	4E6yjMygXYkF/26eAlGRK5o9T990FL8=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	Denis Benato <denis.benato@linux.dev>
Subject: [PATCH 2/2] platform/x86: asus-wmi: fix screenpad brightness scaling
Date: Thu, 12 Feb 2026 23:02:52 +0100
Message-ID: <20260212220252.1526337-3-denis.benato@linux.dev>
In-Reply-To: <20260212220252.1526337-1-denis.benato@linux.dev>
References: <20260212220252.1526337-1-denis.benato@linux.dev>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Fix incorrect brightness scaling by removing the inconsistent use of an
arbitrary minimum.

Signed-off-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Luke Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 4130dae37e15..5443aaf99e38 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -125,7 +125,6 @@ module_param(fnlock_default, bool, 0444);
 #define NVIDIA_TEMP_MIN		75
 #define NVIDIA_TEMP_MAX		87
 
-#define ASUS_SCREENPAD_BRIGHT_MIN 20
 #define ASUS_SCREENPAD_BRIGHT_MAX 255
 #define ASUS_SCREENPAD_BRIGHT_DEFAULT 60
 
@@ -4243,13 +4242,13 @@ static int read_screenpad_brightness(struct backlight_device *bd)
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
@@ -4289,22 +4288,19 @@ static int asus_screenpad_init(struct asus_wmi *asus)
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
@@ -4315,7 +4311,7 @@ static int asus_screenpad_init(struct asus_wmi *asus)
 
 	asus->screenpad_backlight_device = bd;
 	asus->driver->screenpad_brightness = brightness;
-	bd->props.brightness = brightness - ASUS_SCREENPAD_BRIGHT_MIN;
+	bd->props.brightness = brightness;
 	bd->props.power = power;
 	backlight_update_status(bd);
 
-- 
2.53.0

