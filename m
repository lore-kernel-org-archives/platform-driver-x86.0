Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6942DB7B8;
	Sat, 22 Aug 2026 00:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358626; cv=none; b=qh5qjKIlswe/Aque16u5Q+JbcBIsi0xxyPAeBjm+0ogHMovuy/il4zKw52LtS+XcMJv7UsemyEe7faY5ZSSwR882UKe/nLaKw6RSo44HoMqSNcNOZIE4QgxJGIelTtyJpwSx+PNLh1ujaHOE2yPF2qzpBqbL3Z8j2NqeqMRxw7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358626; c=relaxed/simple;
	bh=q611PI5jUvjLuIuF5hybw4sZPtSyWojEQHIJB1XeCyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RXVn0AtU9nXCYq4xyFis13frru8LlaATrXHVJKT0o9NvUI5gQ85izj8KribHffd7riHok5SiOapQvtmer9JrEYlry/TFX5Mbv+PbVYmdZ3lFu0l2Woz67SqJ5c/5EThdHijidqYiZmyLd+gDIr6Zb6aXgcpJi6OZlzqiU/YIBDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=qq/4Q3IY; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="qq/4Q3IY"
Received: from wsembach-tuxedo.fritz.box (unknown [87.122.213.250])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id E859B2FC0059;
	Sat, 22 Aug 2026 02:30:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1787358618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wjjF7r/RPa0lPFbie0T4V9/429cG8PZ8TBwdLTFUDNI=;
	b=qq/4Q3IY6W+aPwVZ0//c1BGKkNK857PgB/It1u2kfigPatBFJX2c/3WdN3ncRvJA1nAjQN
	Ju1X+ru+7JoCCS+q9KxCVxqaOW8uBKJIbF3Jhjht3YJwcW2UeVHNesgpu51wQumHxqOQQT
	r57gfx7CAvQxgQq2lCypoTseatdzV7g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] platform/x86: uniwill-laptop: Fix brightness notify for 3 level keyboards
Date: Sat, 22 Aug 2026 02:28:39 +0200
Message-ID: <20260822003012.851574-1-wse@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The devices with 3 brightness level keyboards send
UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
UNIWILL_OSD_KB_LED_LEVEL4 and not UNIWILL_OSD_KB_LED_LEVEL0,
UNIWILL_OSD_KB_LED_LEVEL1, and UNIWILL_OSD_KB_LED_LEVEL2.

This patch maps the events correctly to brightness levels 0, 1, and 2.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
---
V1->V2: Use the events as source of truth for brightness_hw_changed value
        again to avoid a race condition as Armin had pointed out.
V2->V3: Return error for unexpected brightness level count.

 drivers/platform/x86/uniwill/uniwill-acpi.c | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c961..5df3611919ce3 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1631,6 +1631,32 @@ static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
 	struct led_classdev *led_cdev;
 	int ret;
 
+	/*
+	 * The devices with 3 brightness level keyboards send
+	 * UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
+	 * UNIWILL_OSD_KB_LED_LEVEL4 which need to be mapped to 0, 1, and 2.
+	 */
+	switch (data->kbd_led_max_brightness) {
+	case 4:
+		break;
+	case 2:
+		switch (brightness) {
+		case 0:
+			break;
+		case 2:
+			brightness = 1;
+			break;
+		case 4:
+			brightness = 2;
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	if (data->kbd_led_single_color)
 		led_cdev = &data->kbd_led_cdev;
 	else

base-commit: 54745d563114b74f6fecebce68cd020d06c1772b
-- 
2.43.0

