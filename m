Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D45E84219F7
	for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2026 12:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783599850; cv=none; b=EJSh+p0ad2asFAssBVDPIqZRpkTGTroHG+sccyY4qLip5/sBApc18/N4NQvhwHll8pQQYABIGSry68F8AONHLm8VO8gpR/tdCN/PcRFRT52aW4eKHrVYmrvm2erBR6I0GuZ7OQpD4uICpZmVInCfUHXJIxv99+ZDrp3Bgtyr6M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783599850; c=relaxed/simple;
	bh=TXM4Z2fKxPKkCgnQdW9djDl47JL2+8go+sexNHwyAJc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQPtQcnG6FaxlV799PePvrSE/KcVUSwlxoedxQ2HI+MBywDLc8nc+5UWkxF6WsPu+gY2Uey5rz1vAravWi3rDMNFHiqKlCmiym2dTqWAa+C4uKEmscF/ZeDItznIDNcntm/H7dgWVArvnEhFk/3QNZ1bB8OZ8jt5pPVkThCp944=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MG/viIGW; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MG/viIGW"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-847a52edeb2so1538099b3a.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2026 05:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783599847; x=1784204647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYSzlYuPPEYjPF6FEhKDUs22fqT25bPTu8XXIOq9lvo=;
        b=MG/viIGW6uy4y56BhEJcw6wlqeX2RptYLtLO+d6UCoS+QyLVyRxYHbbSqD59BaPGfF
         whQfHzr2TLELDnF5mCvyd7usdOXk6qfpIYRv1ROuGUfz92P0oyNYINaLBoUy8irigMyc
         RaQGKh9KhS4FqsAFpEKZnYsDqePyJvjOFd3qCeYOB4MUs7kZjAoZYsNtdawtNVGaSZWJ
         9Ww0YODnm60PtkGQE9NL58uK1yl5Zsar61Xie92dCPjrvxerBnrjDXBzpB9DHvKF6Fck
         oYuFpRI0So13AtbamIojs1eesixlJEOHwzsoYu2bN1iGc1JGU3m6Z37N25CyeuBCF/wh
         C0ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783599847; x=1784204647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yYSzlYuPPEYjPF6FEhKDUs22fqT25bPTu8XXIOq9lvo=;
        b=l7YdPCwL2XqvQpi/yfYXybTocLuh9M0DSgKolFRGq/E1ZcvJtMhwgzt45LWmTArLLj
         r/8rlBUECg6uunDjZXszhKHyVUGNCyNSjU0CP5982sh53DzBxyHAKbf271VfY/aqdqBf
         USeDkMi5UWwHRH5S4Db2qqkhLGQVtPcTrz8Q9fDBIHiCUQzPq/h/hDZ1otwRuGhBWEO8
         QtvL2C2x8/aM5JL45ttaaqYNuyHx5eIkJ+qJC3cd3ChWv3SlpvUf2CMakMTJOP4Hn+XS
         usRr1CFMj5dD94X9itHTafufVfL+oTFm+lbm4IL1i9WVU8vyulvgUwl4D7cbFkCId3E4
         Z1kw==
X-Forwarded-Encrypted: i=1; AHgh+Rrq/ZqfK8A4qYRS28GGFt3JRy5TEqlX11x5m7dg7M+iJl6G5hUbmzFgNomTzRj4WE3h/4bsBbwzT2sISZDjriaDw+iE@vger.kernel.org
X-Gm-Message-State: AOJu0YxP0y4KHvUu3TGelQg7a0Bj/+fZwUnE9piBHVqOW5WI1Rpvfupb
	kdZ8uwstgIQQYUN71wmAXiQ9rTmuzsmwOqfYclDBFvkXrBkODsMsbZFQ
X-Gm-Gg: AfdE7cl3WU2IalCsx7VuCwgZE0jCcnxNpJvnhBRvklHxa7UlqrC9mDGBknq2z2Evcwu
	0arg9meGdjOYkCUSSuV/Yh9UEsrLRGjRuL1VTt/cbYJONlbXrTT7T1uxTduwCVbBJRy5jLAwIkC
	5xhZRfT2cQsyT/lQFO6fUcJVDxSohSDc2jRRpLTr6DcAcIOKDAX+syMPwBCSTFYBqxevbyuOtSc
	SrwjNEAdiMxupvqk65Ydc+YaNjn6RLS8odnMBfB3ocFpaeULGfds8VgWxMaAbvJJVWjnZI0m1Bw
	7+rBXDQdupMqLzOM4IsVfAqGW+fwcoRWlExy3CF21v1M10fB6OHYYnhOJyDe3Y2bKsTvBw3mJHQ
	1hV2Xr955Z8vXwjIrUdBhhA3klBRPLfXRBgnjRY2GMKSloxg0/KCIGFeMbgMFdLM=
X-Received: by 2002:a05:6a00:4fc3:b0:846:2f3d:6275 with SMTP id d2e1a72fcca58-84842fce27amr6609052b3a.58.1783599846456;
        Thu, 09 Jul 2026 05:24:06 -0700 (PDT)
Received: from qby-laptop ([2a13:edc0:18:16f::a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8484f973c4bsm1672517b3a.25.2026.07.09.05.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 05:24:06 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: qby140326@gmail.com
Cc: W_Armin@gmx.de,
	foxido@foxido.dev,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-kernel@vger.kernel.org,
	nika@nikableh.moe,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v1 2/4] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Thu,  9 Jul 2026 20:23:35 +0800
Message-ID: <20260709122337.17417-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709122337.17417-1-qby140326@gmail.com>
References: <20260709122337.17417-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bitland-mifs-wmi and legacy redmi-wmi drivers both attempt to bind
to
the same WMI GUID (46C93E13-EE9B-4262-8488-563BCA757FEF). This overlap
causes a device
registration conflict, preventing one of the drivers from loading
properly depending on the module initialization order.

Merge the event handling logic from redmi-wmi into
bitland-mifs-wmi. By handling both device layouts within a single
driver,
we eliminate the GUID ownership conflict.

Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 203 +++++++++++++++---------
 1 file changed, 127 insertions(+), 76 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index b0d06a80e89e..cbe118bbe428 100644
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
@@ -74,34 +79,34 @@ enum bitland_mifs_power_profile {
 };
 
 enum bitland_mifs_event_id {
-	WMI_EVENT_RESERVED_1		= 1,
-	WMI_EVENT_RESERVED_2		= 2,
-	WMI_EVENT_RESERVED_3		= 3,
-	WMI_EVENT_AIRPLANE_MODE		= 4,
-	WMI_EVENT_KBD_BRIGHTNESS	= 5,
-	WMI_EVENT_TOUCHPAD_STATE	= 6,
-	WMI_EVENT_FNLOCK_STATE		= 7,
-	WMI_EVENT_KBD_MODE		= 8,
-	WMI_EVENT_CAPSLOCK_STATE	= 9,
-	WMI_EVENT_CALCULATOR_START	= 11,
-	WMI_EVENT_BROWSER_START		= 12,
-	WMI_EVENT_NUMLOCK_STATE		= 13,
-	WMI_EVENT_SCROLLLOCK_STATE	= 14,
-	WMI_EVENT_PERFORMANCE_PLAN	= 15,
-	WMI_EVENT_FN_J			= 16,
-	WMI_EVENT_FN_F			= 17,
-	WMI_EVENT_FN_0			= 18,
-	WMI_EVENT_FN_1			= 19,
-	WMI_EVENT_FN_2			= 20,
-	WMI_EVENT_FN_3			= 21,
-	WMI_EVENT_FN_4			= 22,
-	WMI_EVENT_FN_5			= 24,
-	WMI_EVENT_REFRESH_RATE		= 25,
-	WMI_EVENT_CPU_FAN_SPEED		= 26,
-	WMI_EVENT_GPU_FAN_SPEED		= 32,
-	WMI_EVENT_WIN_KEY_LOCK		= 33,
-	WMI_EVENT_RESERVED_23		= 34,
-	WMI_EVENT_OPEN_APP		= 35,
+	WMI_EVENT_RESERVED_1        = 1,
+	WMI_EVENT_RESERVED_2        = 2,
+	WMI_EVENT_RESERVED_3        = 3,
+	WMI_EVENT_AIRPLANE_MODE     = 4,
+	WMI_EVENT_KBD_BRIGHTNESS    = 5,
+	WMI_EVENT_TOUCHPAD_STATE    = 6,
+	WMI_EVENT_FNLOCK_STATE      = 7,
+	WMI_EVENT_KBD_MODE          = 8,
+	WMI_EVENT_CAPSLOCK_STATE    = 9,
+	WMI_EVENT_CALCULATOR_START  = 11,
+	WMI_EVENT_BROWSER_START     = 12,
+	WMI_EVENT_NUMLOCK_STATE     = 13,
+	WMI_EVENT_SCROLLLOCK_STATE  = 14,
+	WMI_EVENT_PERFORMANCE_PLAN  = 15,
+	WMI_EVENT_FN_J              = 16,
+	WMI_EVENT_FN_F              = 17,
+	WMI_EVENT_FN_0              = 18,
+	WMI_EVENT_FN_1              = 19,
+	WMI_EVENT_FN_2              = 20,
+	WMI_EVENT_FN_3              = 21,
+	WMI_EVENT_FN_4              = 22,
+	WMI_EVENT_FN_5              = 24,
+	WMI_EVENT_REFRESH_RATE      = 25,
+	WMI_EVENT_CPU_FAN_SPEED     = 26,
+	WMI_EVENT_GPU_FAN_SPEED     = 32,
+	WMI_EVENT_WIN_KEY_LOCK      = 33,
+	WMI_EVENT_RESERVED_23       = 34,
+	WMI_EVENT_OPEN_APP          = 35,
 };
 
 enum bitland_mifs_event_type {
@@ -601,18 +606,67 @@ static const struct attribute *const laptop_attrs[] = {
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
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_OPEN_APP, 1, 0),
+	{ KEY_PROG1 } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CALCULATOR_START, 1, 0),
+	{ KEY_CALC } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_BROWSER_START, 1, 0),
+	{ KEY_WWW } },
+
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_J, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_F, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_0, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_1, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_2, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_3, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_2, 0, 0),
+	{ KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_3, 0, 0),
+	{ KEY_ALL_APPLICATIONS } },
+	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 0, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(0x1b, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_RESERVED_1, 1, 0),
+	{ KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0),
+	{ KEY_REFRESH_RATE_TOGGLE } },
+
+	/* AI button has code for each position */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0),
+	{ KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0),
+	{ KEY_ASSISTANT } },
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
@@ -736,9 +790,12 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 	struct bitland_mifs_wmi_data *data = dev_get_drvdata(&wdev->dev);
 	const struct bitland_mifs_event *event = buffer->data;
 	struct bitland_fan_notify_data fan_data;
+	struct key_entry *entry;
+	bool autorelease = true;
+	int value = 1;
+	u32 payload;
 	u8 brightness;
 
-	/* Validate event type */
 	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
 		return;
 
@@ -752,62 +809,56 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
 
-	/*
-	 * The device has 3 fans (CPU, GPU, SYS),
-	 * but there are only the CPU and GPU fan has events
-	 */
 	case WMI_EVENT_CPU_FAN_SPEED:
 	case WMI_EVENT_GPU_FAN_SPEED:
+		/* Redmi refresh rate toggle quirk */
+		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED &&
+		    event->value_low == 0 && event->value_high == 0) {
+			payload = BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0);
+			goto report_key;
+		}
+
 		if (event->event_id == WMI_EVENT_CPU_FAN_SPEED)
 			fan_data.channel = 0;
 		else
 			fan_data.channel = 1;
 
-		/* Fan speed is 16-bit value (value_low is LSB, value_high is MSB) */
 		fan_data.speed = (event->value_high << 8) | event->value_low;
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
+
+report_key:
+	entry = sparse_keymap_entry_from_scancode(data->input_dev, payload);
+
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
 }
 
 static const struct wmi_device_id bitland_mifs_wmi_id_table[] = {
-- 
2.55.0

