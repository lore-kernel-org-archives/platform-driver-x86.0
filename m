Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152D42BE8A;
	Tue, 28 Jul 2026 12:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785241673; cv=none; b=YLCLd0iXR5Vw5RdloT82IIm2nDfng5Qd/Mki+7TRo07+fPOUjKBgVSlDQjItYYwGB9rjcaA/RYgeHguIb8socT/IqKT5s3JylM7+N/Hcp1Ow9b1iNxDEjzd/6oAUFRon3eL5FypeG3EDXKqy+rWND7npPtB3IUQuVKt/W4S61UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785241673; c=relaxed/simple;
	bh=jAHYuJx+2hNGbbsqCyzj3I3McNKn8pazj27O5TKNX1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaXoPIVpX4Eh8x+ndwk2Azkn6oU2dIYPH11ck3CCpMeQ5+Z7BBURpvMM8qMSzkiNap9rEWzg5jPaTgu4FLFpvz7GBEaJvoP5W4JvsB6Ln2IJRhMN3JlFt+2RyZLeMO7n+E4MDTdnU8QQ6xCaqygQderUHP/ccVpu19bK0JcdSH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=jriwIX4Z; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="jriwIX4Z"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id DD9A82FC007B;
	Tue, 28 Jul 2026 14:27:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785241665;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PNQh9F6PlSlN66IPetmgRRX2AO8TED1cbxNukFmLEis=;
	b=jriwIX4ZcO+Al5LvEpmNbOXdjDQfKz7B5dBxIfklDGKBMxY1cz+gP6fi5sqqJarMoRVLmA
	s5dey/IZz+1c4wEuzMJUBtrS5y+GG14KvO5j4wVK43486QfqeOY/n44FfeOaQgx+woETU+
	h+goabp+JjKyL3CPSh4dQHqQ+Yb1QTo=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: wse@tuxedocomputers.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 3/6] platform/x86/tuxedo: Use intensity according to HID spec
Date: Tue, 28 Jul 2026 14:26:35 +0200
Message-ID: <20260728122647.132540-4-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260728122647.132540-1-aer@tuxedocomputers.com>
References: <20260728122647.132540-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For RGB LEDs, the HID spec offers an example that uses only two
intensity values for turning LEDs on and off. All other color values
are submitted through the color channels individually, thus avoiding
duplicated handling of brightness.

Signed-off-by: Aaron Erhardt <aer@tuxedocomputers.com>
---
 drivers/platform/x86/tuxedo/nb04/wmi_ab.c | 25 ++++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
index 11babc7c7767..8f1ffca0430d 100644
--- a/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
+++ b/drivers/platform/x86/tuxedo/nb04/wmi_ab.c
@@ -553,7 +553,7 @@ static int handle_lamp_attributes_response_report(struct hid_device *hdev,
 	rep->red_level_count = 0xff;
 	rep->green_level_count = 0xff;
 	rep->blue_level_count = 0xff;
-	rep->intensity_level_count = 0xff;
+	rep->intensity_level_count = 0x1;
 	rep->is_programmable = 1;
 
 	if (driver_data->kbl_map[lamp_id].code <= 0xe8) {
@@ -640,22 +640,23 @@ static int handle_lamp_multi_update_report(struct hid_device *hdev,
 					j + 1;
 			rgb_configs_j->key_id = key_id;
 			/*
-			 * While this driver respects update_channel.intensity
-			 * according to "HID Usage Tables v1.5" also on RGB
-			 * leds, the Microsoft MacroPad reference implementation
+			 * This driver uses update_channel.intensity according to
+			 * "Color Attributes Examples" in "HID Usage Tables v1.7".
+			 * Only two intensity values are allowed for turning LEDs
+			 * on or off, while color and brightness can be controlled
+			 * through the RGB values. This is also identical to the
+			 * Microsoft MacroPad reference implementation
 			 * (https://github.com/microsoft/RP2040MacropadHidSample
-			 * 1d6c3ad) does not and ignores it. If it turns out
-			 * that Windows writes intensity = 0 for RGB leds
-			 * instead of intensity = 255, this driver should also
-			 * ignore the update_channel.intensity.
+			 * 1d6c3ad).
 			 */
-			intensity_i = rep->update_channels[i].intensity;
+			intensity_i = min(1, rep->update_channels[i].intensity);
 			red_i = rep->update_channels[i].red;
 			green_i = rep->update_channels[i].green;
 			blue_i = rep->update_channels[i].blue;
-			rgb_configs_j->red = red_i * intensity_i / 0xff;
-			rgb_configs_j->green = green_i * intensity_i / 0xff;
-			rgb_configs_j->blue = blue_i * intensity_i / 0xff;
+
+			rgb_configs_j->red = red_i * intensity_i;
+			rgb_configs_j->green = green_i * intensity_i;
+			rgb_configs_j->blue = blue_i * intensity_i;
 
 			break;
 		}
-- 
2.43.0

