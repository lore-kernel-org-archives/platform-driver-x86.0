Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C96B3DCDBD;
	Wed,  5 Aug 2026 23:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785971147; cv=none; b=rdOIRIZ396S4Ivw+116b+ojCPYGef6XaztTPmka2TIhKVckAyg0o4JSiYRN6gbK55luIKFM6lvsHzROiCOSdVrHTWHBZVvjgQXZdC41SR/+tEjlOjBJqUNkoszeYX4YkDe+OZK0q0fXkXyRRC6uElRyZZqn/jJN7gIPOBs3UEVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785971147; c=relaxed/simple;
	bh=Kn310M10Qjot+IzsoBTASfRxPusqehY2VXwSBe2nzUo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ezBznmCWlyPQ2KIlxMkGPB6s6fb/sXZUAZ/NxLDpeJyk2PYa0ADeiJMpTkuMi2is5GX4AR++wnPspVxVgwj4NC9VoTMLJXs3l4EP9iZSc74HG5a7F2bN0RDQInb6RYho3VBh3Oyz4EJp6zbUmXxxwlq59GT7gvH4ZsTXNK/Kk0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Up8H008d; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Up8H008d"
Received: from wsembach-tuxedo.fritz.box (business-24-134-105-141.pool2.vodafone-ip.de [24.134.105.141])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPA id 1C82D2FC0076;
	Thu,  6 Aug 2026 01:05:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1785971141;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X/ziCdfl0Ie4LZlWL50lIOWvuG4o3jQ5P0w59AHX4UY=;
	b=Up8H008dvsquOzFI8zk5zhgEt+VDpm8ohnNZrIVpl/dsmgpGOPxvXkain3+LuHrVhzXvHU
	V67K4wEjTrnW6kQBwHVwMN6JUD3l2myi5+RVfs1E28hNrnUDs8rMjyEJlAbZ6ockUQ150B
	AgCs/ddmOF1fBMkyDw4kuReah1HZ02g=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Werner Sembach <wse@tuxedocomputers.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: uniwill-laptop: Fix brightness notify for 3 level keyboards
Date: Thu,  6 Aug 2026 01:04:51 +0200
Message-ID: <20260805230538.464753-1-wse@tuxedocomputers.com>
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

 drivers/platform/x86/uniwill/uniwill-acpi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/platform/x86/uniwill/uniwill-acpi.c b/drivers/platform/x86/uniwill/uniwill-acpi.c
index 7a2eeaec4c961..5c5bb6d104494 100644
--- a/drivers/platform/x86/uniwill/uniwill-acpi.c
+++ b/drivers/platform/x86/uniwill/uniwill-acpi.c
@@ -1631,6 +1631,18 @@ static int uniwill_notify_kbd_led(struct uniwill_data *data, int brightness)
 	struct led_classdev *led_cdev;
 	int ret;
 
+	/*
+	 * The devices with 3 brightness level keyboards send
+	 * UNIWILL_OSD_KB_LED_LEVEL0, UNIWILL_OSD_KB_LED_LEVEL2, and
+	 * UNIWILL_OSD_KB_LED_LEVEL4 which need to be mapped to 0, 1, and 2.
+	 */
+	if (data->kbd_led_max_brightness == 2) {
+		if (brightness == 2)
+			brightness = 1;
+		else if (brightness == 4)
+			brightness = 2;
+	}
+
 	if (data->kbd_led_single_color)
 		led_cdev = &data->kbd_led_cdev;
 	else

base-commit: 1b04f556e8428a3865a95627ab7a0acb5d9b93a5
-- 
2.43.0

