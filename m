Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C3F37B00F
	for <platform-driver-x86@vger.kernel.org>; Sun, 16 Aug 2026 00:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786839143; cv=none; b=SWhC/WpAQttUYgnKJx4qlhMTjhsJRdOd0BuYmd64t3kA97ZM0w9UbQLrt/xKQX/bVeD0VK/1awkufwna7oZYYbDxUnDuGbEAwbkH7Jc1dBBy4U/IuZIzTicRV7ROcogweW6GikK+FUmN4u9luWRmV5xjaiuXf8rdIh++Yt0bU/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786839143; c=relaxed/simple;
	bh=qycZ0BRozYzT9bbWxMfxPy3rhm2G36ZCHEaEgjWL4BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GX/o/vLexW8qEF1a+akHbs/+ssNH532o6g/60RLd9qSV5+wrnEnq7+Ysso3I5Lk8pT8MTe9wv95GMSTd43jDEk55+pcaFuzZIIOU0/iuNl7VcSI0gtra2MPp+odJTkHmjR1vjxpt/i5v1bPV02ikNwVR1FjreW/iM6oBcj/DwJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GOgFOQGz; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GOgFOQGz"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so1471644a91.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Aug 2026 17:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786839139; x=1787443939; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AyjTvRH2L6UPE0KXVLuz5HIPgBQCFlPffiuhEy0FlTw=;
        b=GOgFOQGzbLE65/fcBq43MMdWQnKJB38dcQkceLg0jdfvKLzGloguyjPS8G+fK8FFUU
         Anw7nxxb6XteONVmec0BjAYA4Kl6CMqTiEwsCAZ3WIygCjjTiFbrw/hjcRtZni8ka/NS
         XjGgP3zkR5TycRl7JpcF6KSuTeqnCZq2T9vATpYvlE1EJPO2SNDmRq6hup6s4FNxNOje
         dgodbfWtkFhqV3utrS9a31GEBidXts8dhbKlkQsvqEHuZFjm/KhSp3EG+V/huGsTWK+O
         FDBruuyjM+H2fUkWDqbOmJfFrFrr6BoMtxvMOikefragHs5potXO0ZWBSbL4z5yJbEwq
         Jxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786839139; x=1787443939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AyjTvRH2L6UPE0KXVLuz5HIPgBQCFlPffiuhEy0FlTw=;
        b=WqhftSPCXv256cYUcrrnCqC/7Fb5y8WSo0ehaQSXK9f1JCdI7gP/Xjgyi3kyJ1lnC/
         caMl2Z8EzOGfu21NwCB36Yr0EcdmnAfcnaTHNXMu1rZgI7HGgv3vgDRbfgfrz61yEnDE
         3gM19mOPZ+prbS5PyvufVePHvDLKrsdMkerH5PvUByWYS0OvHLtpUVDvcWlYhSc0MRHP
         75XOFx07lz4VMf65v9cy+c3bjBDPlNH76fOAXgTeelbipEtVZIkmiztdIamMEzLsqzs6
         plHcebLjjMrAqgEIUpghyMweGiT/J50xBeGaXP2+j7djuQQwE++SzzWuPAnXD2Jq6Spk
         HYCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHSVQbNhpqu28aF1FPLrismwFc625xyxBg8rs1Rjas092UYnI0aD0mZWjRSVA3DpWFT2PZH89+lfhV2q06L++XxQ3v@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrk0cp47G6NS73WMmMc6HNzqu5llaepTUKI8BLmYhMXK/prNvY
	iFWe1izpib5zQ+A3z1/oEufpdNLNBxotDBFiLLGDSWfcb3d/QKlZeHv03QKITSO3
X-Gm-Gg: AR+sD108s7TtHJQwLgORwKp/agfI9zz2ong8epol4Pv/2l9WGZW6OaypMnrwiu8GO50
	RvnOjg/Mcq7+7rmcxUBwXZGxaDfKuAPSMThrDK2wbvJLx5EkzRfgU65105YDGSkxKJFeTz1knxD
	5S9i5H6dHMDCT5A9m9nxZCCZV45IJdTKDkEuHtgh+nrD6PUnTWfue/PJ3cwUEIAQs5GvEZHHL3G
	9fBKdj/l2cD8ybZBDISDlXhj0N78k1GNnnkdvJPmnJjv4jXmy/Nfx7bWrksAAC8jJ/Eo21UWJ4M
	3Ymt9g7HmHf/tlXk9FFLDLqp6Lh+qbasqvLPkZqF3beZlKOyCnZrEK9rPXYLiH4/sRcWb4j5RWD
	3X8GZTD2lmknB9GIXRJOAWLznTCGlYQQG03UTyrINb3lis9ErwMoCjAqIGFYQs47qJdT100UFXD
	SkC6/UCT+TGydMwV7I3K9kIbTFtJ71YUCS0yY=
X-Received: by 2002:a17:90b:1dcb:b0:38e:5ce1:ae30 with SMTP id 98e67ed59e1d1-3933b0d37ebmr11959267a91.14.1786839138915;
        Sat, 15 Aug 2026 17:12:18 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-394ea96c87bsm7409320a91.4.2026.08.15.17.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 17:12:17 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org,
	vlku.milos.fun@gmail.com,
	i@rsplwe.com,
	wolf109909@outlook.com
Subject: [PATCH v4 2/6] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Sun, 16 Aug 2026 08:11:25 +0800
Message-ID: <20260816001129.16998-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260816001129.16998-1-qby140326@gmail.com>
References: <20260816001129.16998-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
to the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This
overlap causes a device registration conflict, preventing one of the
drivers from loading properly depending on the module initialization
order.

Merge the event handling logic from redmi-wmi into bitland-mifs-wmi. By
handling both device layouts within a single driver, we eliminate the
GUID ownership conflict.

Tested-by: Nika Krasnova <nika@nikableh.moe>
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 139 ++++++++++++++++--------
 1 file changed, 96 insertions(+), 43 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..8b6476881de6 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -34,6 +34,11 @@
 #include <linux/units.h>
 #include <linux/wmi.h>
 
+#define BI_HOTKEY_CODE(id, low, high) \
+	(((u32)(high) << 24) | ((u32)(low) << 16) | ((u32)(id) << 8) | WMI_EVENT_TYPE_HOTKEY)
+
+#define AI_KEY_VALUE_MASK    BIT(8)
+
 #define DRV_NAME		"bitland-mifs-wmi"
 #define BITLAND_MIFS_GUID	"B60BFB48-3E5B-49E4-A0E9-8CFFE1B3434B"
 #define BITLAND_EVENT_GUID	"46C93E13-EE9B-4262-8488-563BCA757FEF"
@@ -601,18 +606,59 @@ static const struct attribute *const laptop_attrs[] = {
 ATTRIBUTE_GROUPS(laptop);
 
 static const struct key_entry bitland_mifs_wmi_keymap[] = {
-	{ KE_KEY, WMI_EVENT_OPEN_APP, { KEY_PROG1 } },
-	{ KE_KEY, WMI_EVENT_CALCULATOR_START, { KEY_CALC } },
-	{ KE_KEY, WMI_EVENT_BROWSER_START, { KEY_WWW } },
-	{ KE_IGNORE, WMI_EVENT_FN_J, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_F, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_0, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_1, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_2, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_3, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_4, { KEY_RESERVED } },
-	{ KE_IGNORE, WMI_EVENT_FN_5, { KEY_RESERVED } },
-	{ KE_END, 0 }
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0), { KEY_PROG1 } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0), { KEY_CALC } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0), { KEY_WWW } },
+
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_J, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_4, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_2, 0, 0), { KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_3, 0, 0), { KEY_ALL_APPLICATIONS } },
+	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 0, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0), { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
+
+	/* AI button has code for each position */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0x80), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {} },
+
+	/* Xiaomi G Command Center */
+	{ KE_KEY, BI_HOTKEY_CODE(0x0a, 1, 0), { KEY_VENDOR } },
+
+	/* OEM preset power mode */
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 1, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 2, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 3, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(0x16, 4, 0), {} },
+
+	/* Fn Lock state */
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
+
+	/* Fn+`/1/2/3/4 */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 1, 0), { KEY_F13 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 1, 0), { KEY_F14 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 1, 0), { KEY_F15 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 1, 0), { KEY_F16 } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 1, 0), { KEY_F17 } },
+
+	{ KE_END }
 };
 
 static void bitland_notifier_unregister(void *data)
@@ -730,12 +776,35 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
 				       &drv_data->notifier);
 }
 
+static void bitland_mifs_wmi_report_key(struct wmi_device *wdev, u32 payload)
+{
+	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
+	struct key_entry *entry;
+	bool autorelease = true;
+	int value = 1;
+
+	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
+	if (!entry) {
+		dev_dbg(&wdev->dev, "Unknown WMI hotkey with payload 0x%08x\n", payload);
+		return;
+	}
+
+	/* AI key quirk */
+	if (entry->keycode == KEY_ASSISTANT) {
+		value = !(payload & AI_KEY_VALUE_MASK);
+		autorelease = false;
+	}
+
+	guard(mutex)(&data->lock);
+	sparse_keymap_report_entry(data->input_dev, entry, value, autorelease);
+}
+
 static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 				    const struct wmi_buffer *buffer)
 {
-	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
+	u32 payload;
 	u8 brightness;
 
 	/* Validate event type */
@@ -752,24 +821,13 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_KBD_BRIGHTNESS,
 					     &brightness);
-		break;
+		return;
 
 	case WMI_EVENT_PERFORMANCE_PLAN:
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_PLATFORM_PROFILE,
 					     NULL);
-		break;
-
-	case WMI_EVENT_OPEN_APP:
-	case WMI_EVENT_CALCULATOR_START:
-	case WMI_EVENT_BROWSER_START: {
-		guard(mutex)(&data->lock);
-		if (!sparse_keymap_report_event(data->input_dev,
-						event->event_id, 1, true))
-			dev_warn(&wdev->dev, "Unknown key pressed: 0x%02x\n",
-				 event->event_id);
-		break;
-	}
+		return;
 
 	/*
 	 * The device has 3 fans (CPU, GPU, SYS),
@@ -777,6 +835,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 	 */
 	case WMI_EVENT_CPU_FAN_SPEED:
 	case WMI_EVENT_GPU_FAN_SPEED:
+		/* Redmi refresh rate toggle quirk */
+		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
+		    event->value_low == 0 && event->value_high == 0) {
+			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
+			bitland_mifs_wmi_report_key(wdev, payload);
+			return;
+		}
+
 		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
 			fan_data.channel = 0;
 		else
@@ -787,27 +853,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		blocking_notifier_call_chain(&bitland_notifier_list,
 					     BITLAND_NOTIFY_HWMON,
 					     &fan_data);
-		break;
-
-	case WMI_EVENT_AIRPLANE_MODE:
-	case WMI_EVENT_TOUCHPAD_STATE:
-	case WMI_EVENT_FNLOCK_STATE:
-	case WMI_EVENT_KBD_MODE:
-	case WMI_EVENT_CAPSLOCK_STATE:
-	case WMI_EVENT_NUMLOCK_STATE:
-	case WMI_EVENT_SCROLLLOCK_STATE:
-	case WMI_EVENT_REFRESH_RATE:
-	case WMI_EVENT_WIN_KEY_LOCK:
-		/* These events are informational or handled by firmware */
-		dev_dbg(&wdev->dev, "State change event: id=%d value=%d\n",
-			event->event_id, event->value_low);
-		break;
+		return;
 
 	default:
-		dev_dbg(&wdev->dev, "Unknown event: id=0x%02x value=0x%02x\n",
-			event->event_id, event->value_low);
 		break;
 	}
+
+	payload = get_unaligned_le32(buffer->data);
+	bitland_mifs_wmi_report_key(wdev, payload);
 }
 
 static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
-- 
2.55.0

