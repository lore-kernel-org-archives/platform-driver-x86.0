Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3063783C5;
	Mon, 28 Sep 2026 08:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790585718; cv=none; b=msW/zomNm5JSi4wHsg+J6ZQG0yvsnISjIFruiqTuzDztLRZ3THJMNBQ6dsAO6ipCdBwZRx2fi/Z60QqMUt8vLtm3h+FCaJWOy6TyJJjJFwt5jv7n7SJsuwb6bXTkMWiMH8GooQPck0JEEDKCnCli7vzIct9UHyY8vLz011c0j4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790585718; c=relaxed/simple;
	bh=IQtgV2PnVWeA4oDAmnQS9le08dIHD2sCyTqrEb2Aaos=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rbPx2jkKfU4HdGPCBinQAdkaZOFzGmpYOV3BciKV22nAl13VhMUfluiYrlFfAoKH40QoNNhrVUZhdYs0mudw63OJjXkeGCjfPhA+xV5W4R4ap+k5TZbquJmmGW5IAIOi9GtGF/+aZZwS8jkabeKe1yvP8IL4e2p1NrIvTUl46Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=u1msND6a; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="u1msND6a"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 43D812FC0065;
	Mon, 28 Sep 2026 10:55:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1790585707;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8pZijpDFSiF1ZbzcpGeJ5zglmWeRotWMVESRJhY9Nd0=;
	b=u1msND6aIjklJrGNggrDoLTfT6/POxdCDXrCPHPzj8oYnAsXdb4GzWoHwRwYxfPqf3Plqz
	wItCz+tXuBlCA0m+w5p6sKdruTrT4qZLCAiVUo/o1bb1oLxDTUM7uYA/SQ7TvhHoPfwsR+
	JT9DsXruVY91oeSiTTs+B8M/MfETNKY=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] platform/x86/tuxedo: Use intensity according to HID spec
Date: Mon, 28 Sep 2026 10:36:28 +0200
Message-ID: <20260928085448.9024-4-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928085448.9024-1-aer@tuxedocomputers.com>
References: <20260928085448.9024-1-aer@tuxedocomputers.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

So far, this driver assumed incorrectly that the HID spec requires an
8-bit intensity value to be honored. The spec actually allows multiple
intensities for RGB lamps, but suggest to rather set brightness
through the individual channels, which is also what the Microsoft
MacroPad reference implementation does.

Accordingly, this commit simplifies intensity handling by offering
only two intensity values for turning LEDs on and off. All other color
values are submitted through the color channels individually, thus
avoiding duplicated handling of brightness.

Additionally, the incorrect comments explaining the deviation from the
MacroPad reference implementation were removed.

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

