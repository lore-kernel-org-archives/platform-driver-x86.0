Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75B344A40C;
	Wed,  7 Oct 2026 08:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791360167; cv=none; b=JYYeL9WxY1gyVyvRcSP3ixEHbrx0NPFGATLBf5+F4F6+4Z9nsZ4bkO1nJctLLJTzxc8yionXnCZM3Qlq4+RLMLnzoin3FwW324Z1uyB87tvVehyWjn73KwLraFhxok274D+SHUy3BD4jXtFCdqY3bMvgqb4LKphwbtJptK0j0MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791360167; c=relaxed/simple;
	bh=KVN3N0/OMXb0BxMi+KIxtx4hmBzj3TsMrqJksDwJ2i8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ntn8HtEwrue/WwspjqgJ04t7vSDG4hI7C2lxNKwueziUyKJ+eZaDwRXGQZZ897+/yMeOGWk/wTEmLtwrLC5azYKVZygvWWWz+r+4muRZRpq+BxUI6NEPRiSiZBC++y3Q93kIwvxZW7EAWsspb4CjWXs2OJ8H2QxKKXuW3WzS0WQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=LJlW1D0z; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LJlW1D0z"
Received: from aerhardt-tuxedo.buero.augsburg.tuxedo.de (business-024-134-105-141.24.134.pools.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: a.erhardt@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 47ED02FC008F;
	Wed,  7 Oct 2026 10:02:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1791360137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eqC2+puMUPKMqA0SOi2NMF4TS83Av/+yZ6dD1iPkxec=;
	b=LJlW1D0zWVSsFoXWJs/sO9F0ew+vGrX+uEDu9YzIK3XufQ7WiSVo0dnqSBPqKaDq02/U1v
	Mw37fTDlBxfg0NQEEwM63058JGRI5SaX997Y0uLJMhpCloMPDduGYt/LyYXXsqJ74YAnDF
	egN7NXDD/40CyzIKmL7VWUd11DhmaJM=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=a.erhardt@tuxedocomputers.com smtp.mailfrom=aer@tuxedocomputers.com
From: Aaron Erhardt <aer@tuxedocomputers.com>
To: Werner Sembach <wse@tuxedocomputers.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Aaron Erhardt <aer@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] platform/x86/tuxedo: Use intensity according to HID spec
Date: Wed,  7 Oct 2026 10:01:49 +0200
Message-ID: <20261007080202.81694-4-aer@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007080202.81694-1-aer@tuxedocomputers.com>
References: <20261007080202.81694-1-aer@tuxedocomputers.com>
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

Reviewed-by: Werner Sembach <wse@tuxedocomputers.com>
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

