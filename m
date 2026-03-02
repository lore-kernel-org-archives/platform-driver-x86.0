Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253414219ED
	for <platform-driver-x86@vger.kernel.org>; Mon,  2 Mar 2026 17:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473487; cv=none; b=edBqkB40aOE0ygkI3vIlJKsT8YZTvCIvFml5nD+VwgRH4sjvVlPCPJEeQ2mM56YyqZf+WVM3Vo99iC80ULA3MFpGwtTFLg/wP42cAatdhUCuVwAX1cdYBdyq4WA6afUowfl7tXHh5ajbjUuwtaWqIWXknFobmV80JUTRnPXVG4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473487; c=relaxed/simple;
	bh=y5qEG/+/6It2T4A1pcBf/sFhTz5T+iolclq51Ufqb0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D2P/1jWWi/bH9ltPosXn+iijvpVYoB6m4NfHEX9QVS4/p8OFLDXHodxRSEp9DH5uARBAHgT+vYv9gmLSn9A756JITvXHYXNHg7q2DH4YSM22COnj6CjT6P3kV/E6KMmc9ng8052D2RKjRHD8yr/OMg7xIcPR5B18i0GMKgviduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UXEqG0Xl; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UXEqG0Xl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772473484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bbx5Ke9Aq9lZyiv0R/6JM7JwEg3U+66HaEJL2A8Ih/Q=;
	b=UXEqG0XlKlyU8KSEoi2a7eGVm/1IXVL0yxF61ad4SDv7w8bU4zvSD51RMMlSvleg9UT52J
	rbekMVMQq5VbazkkvyAHvIjZZfJvfrK08vEjXpNMKZPmtnemTPcGqxvGpBVQO5q1srzw53
	uQg5cAKxYDevWdRLs5+mWfWOkXEfRtg=
From: Denis Benato <denis.benato@linux.dev>
To: linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org,
	"Hans de Goede" <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	"Mateusz Schyboll" <dragonn@op.pl>,
	"Denis Benato" <benato.denis96@gmail.com>,
	"Denis Benato" <denis.benato@linux.dev>
Subject: [PATCH v3 1/2] platform/x86: asus-wmi: adjust screenpad power/brightness handling
Date: Mon,  2 Mar 2026 18:44:30 +0100
Message-ID: <20260302174431.349816-2-denis.benato@linux.dev>
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

Fix illogical screen off control by hardcoding 0 and 1 depending on the
requested brightness and also do not rely on the last screenpad
power state to issue screen brightness commands.

Fixes: 2c97d3e55b70 ("platform/x86: asus-wmi: add support for ASUS screenpad")
Signed-off-by: Denis Benato <denis.benato@linux.dev>
Signed-off-by: Luke Jones <luke@ljones.dev>
---
 drivers/platform/x86/asus-wmi.c | 34 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 7c0915e097ba..8925a0ee26af 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -4419,32 +4419,24 @@ static int read_screenpad_brightness(struct backlight_device *bd)
 
 static int update_screenpad_bl_status(struct backlight_device *bd)
 {
-	struct asus_wmi *asus = bl_get_data(bd);
-	int power, err = 0;
-	u32 ctrl_param;
+	u32 ctrl_param = bd->props.brightness;
+	int err = 0;
 
-	power = read_screenpad_backlight_power(asus);
-	if (power < 0)
-		return power;
+	if (ctrl_param >= 0 && bd->props.power) {
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 1, NULL);
+		if (err < 0)
+			return err;
 
-	if (bd->props.power != power) {
-		if (power != BACKLIGHT_POWER_ON) {
-			/* Only brightness > 0 can power it back on */
-			ctrl_param = asus->driver->screenpad_brightness - ASUS_SCREENPAD_BRIGHT_MIN;
-			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT,
-						    ctrl_param, NULL);
-		} else {
-			err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
-		}
-	} else if (power == BACKLIGHT_POWER_ON) {
-		/* Only set brightness if powered on or we get invalid/unsync state */
-		ctrl_param = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
 		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_LIGHT, ctrl_param, NULL);
+		if (err < 0)
+			return err;
 	}
 
-	/* Ensure brightness is stored to turn back on with */
-	if (err == 0)
-		asus->driver->screenpad_brightness = bd->props.brightness + ASUS_SCREENPAD_BRIGHT_MIN;
+	if (!bd->props.power) {
+		err = asus_wmi_set_devstate(ASUS_WMI_DEVID_SCREENPAD_POWER, 0, NULL);
+		if (err < 0)
+			return err;
+	}
 
 	return err;
 }
-- 
2.53.0

