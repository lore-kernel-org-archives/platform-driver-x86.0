Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8348537B002
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 13:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791812307; cv=none; b=Gh79ExwSjfSk9gdUtT8CuzjWilO7E/TWmSOZa3p/gSDVr8Mwzn7ZH9hL14S7X1JL/mAaeXBrwVcHx+ymigdMYatK16HKPb9gstkPiT2UdxLZ2TphiOCn65E82dDvRtiPBLqd9/3n9D/wmSbOE2sI1s1YVpogRR9AJd8/U2lLMtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791812307; c=relaxed/simple;
	bh=wqDz4ZCsoc1aPuS96J4Sj5AoJqMeTPRXHe84rEoq/80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOuvS6qEwrAKJWTraxx3cHmqtHG9I4Vr12qlzhVGxyYoNa3ijgt+kJWX+EuEQtaDY5jTf8eSVjtQ3PiyjjbfJI4Qc3wDUQnaf2CzSQJi3y/cPC1TlyHLGnPaJBqJBDWQ2PK7EgEPidkRdfs9nZzuokMDbRT0ouTlSeYqAwUKv6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nSqk+6pn; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nSqk+6pn"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-381b831d535so2143391a91.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 06:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791812305; x=1792417105; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s26ixnhvJ+WB5vpR8ghiezje9rLBktUyIOA4XoIutBs=;
        b=nSqk+6pndrPOSKTUP6jS155xCcu6X3otTe352eR2q2/h0alN/0l8RoIhU/DypOZzRN
         6a0xXzxs2X9XCw0i3ntX0Elu2UNj78oFfGj9eSrNaDmimHFFiO5VemKvQyb6U/vIpNVu
         b9e8QGzvygguy4Piu3WciLuQLQvr8G/rYgIU3u0D69/+lgwjjRQ3xWVrpbaIeRe3soCO
         +ihc01RlHlPYxK/5qb7NmC7R6ydvntOogSY4eW8RfO2A3VQe3KREPsOSps7oeHR17CTT
         m+/QOYdLmOI7Tibm3DhFLIj2sA3GiVlHjo6DKqpwa53ZbiBwniNkRRHxfVVfjaNCmx2G
         Pk1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791812305; x=1792417105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s26ixnhvJ+WB5vpR8ghiezje9rLBktUyIOA4XoIutBs=;
        b=QWwJnsrC3zWJSGbIY1E3r/S9Vw/9srP4P/aouSAw6GZ2ZZK9vQgSjc6t6rPmL9JFMP
         Pu77Azm9vw5s4i/fq6hue+yt3V2caKIAxq/I1HEMkQo6Zv+ShtfDmw4alcxGxmQOzMFK
         BpQNeQA6Rvvn9bFy8PMfjr5RafKVRVkDRRR2UboAr03rPW/Hk9ctfv5oA7w0WDC518Kb
         K8qqgKY/IOOt4ze8wZ3MkOxnO+wB+y0kPHkQB6W0+Ct4R6YMQGQ5ZS1ta5SKI1dznzbD
         +wMVCUal4dVLpf6WvWRACDDPeY4slFuJ86bkyVJRS3uS8M69MHP6XNl75FuXuUXxXD7H
         fwqw==
X-Forwarded-Encrypted: i=1; AKwUvBzF2/dczq21IsvNjFHk+h/uk5IrFK4XToTX2WLiIjqrA9dehdCBtuotaLyw1fgIRZGq3KR4DUDhVu4DGYzIfj+a6t9k@vger.kernel.org
X-Gm-Message-State: AFq9FYLGrWhUvFrftoyhczOYYCG8fIxlEhqGpRniYh8YHnblFio2IMmG
	lpIX6/tPrW/C0iyaccZHzF5WGqqcdvQ38KJNcKABgAPyXpPcj0Y3gLly
X-Gm-Gg: AYBFou0IQYvmKT9qyJo5VAGoehQgqGXM8sdKPNVDdOKSdI278F8SeHEI2f0SaBhP948
	MXuqqKrcjsJdLWeya00LkTZrzzQE1nQvjDUvogKynlQ7heOxT3OPDSjDT3PS8+0daNo1JobSFU0
	b6QklWTRmxOHhAKDTpRvK9O5QZdip8MrQ9SOWhK/5KfQKfdONwO7JPr5LM+9kXxc2hOg4Z2rLS8
	iFCt8JM5Yh4Wre4ZORLsFD+nTGAszrCj+BtwFGfNf9A8fytiP8R5uua3IHCuaVSuXmrnRn7bKtJ
	MEQ7pU5lp/IAuDlPuXWqTLnW3WKxDUvbFcbMhml73XrCoiobpxrDBZ1y/5A5u34FdqWiiliTOQF
	mrNmpqRe5fuCTXiK+238xIE4sfyhEvYVDH7NTkgMShk9myR3S+01GQhPLY+TD/TeNcTDGZVFmu7
	lJAtWQEDv5VEqViQugEQPamMe4Eh2GwDDCCRU30H5fiSdjtZpbyH2GVBUSZ3JcokpSOVhGPb8=
X-Received: by 2002:a17:90a:e7ca:b0:3ab:36c4:b500 with SMTP id 98e67ed59e1d1-3ab3a39f232mr8066543a91.5.1791812304940;
        Mon, 12 Oct 2026 06:38:24 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab50ce9d98sm14534878a91.9.2026.10.12.06.38.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:38:24 -0700 (PDT)
From: Mingyou Chen <qby140326@gmail.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ilya Gladyshev <ilya.gladyshev@linux.dev>
Cc: KentoNion <kento@kekto.ru>,
	platform-driver-x86@vger.kernel.org,
	ted eric <ericted8810@gmail.com>,
	Armin Wolf <W_Armin@gmx.de>,
	linux-kernel@vger.kernel.org,
	Chris Taraszka <chris@miget.com>,
	Matias Civadda <matias.civadda2342001@gmail.com>,
	=?UTF-8?q?=E9=AB=98=20=E4=BF=8A=E6=96=87?= <btx342@gmail.com>,
	powerfullz <wleizc7319@gmail.com>,
	=?UTF-8?q?=E5=AD=99=20=E8=AA=89=E9=93=AD?= <wolf109909@outlook.com>,
	=?UTF-8?q?Milo=C5=A1=20Vlku?= <vlku.milos.fun@gmail.com>,
	Rsplwe <i@rsplwe.com>,
	Bozhen Peng <bozhenpeng93@gmail.com>,
	Anton Karasev <uselessfire@gmail.com>,
	Jame Jao <jaojame6@gmail.com>,
	Mingyou Chen <qby140326@gmail.com>,
	Nika Krasnova <nika@nikableh.moe>
Subject: [PATCH v12 2/6] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Mon, 12 Oct 2026 21:36:44 +0800
Message-ID: <20261012133648.132363-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012133648.132363-1-qby140326@gmail.com>
References: <20261012133648.132363-1-qby140326@gmail.com>
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
Tested-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Reviewed-by: Ilya Gladyshev <ilya.gladyshev@linux.dev>
Signed-off-by: Mingyou Chen <qby140326@gmail.com>
---
 drivers/platform/x86/bitland-mifs-wmi.c | 143 ++++++++++++++++--------
 1 file changed, 97 insertions(+), 46 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7de77..e240ab733ff1 100644
--- a/drivers/platform/x86/bitland-mifs-wmi.c
+++ b/drivers/platform/x86/bitland-mifs-wmi.c
@@ -35,6 +35,11 @@
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
@@ -80,9 +85,9 @@ enum bitland_mifs_power_profile {
 };
 
 enum bitland_mifs_event_id {
-	WMI_EVENT_RESERVED_1		= 1,
-	WMI_EVENT_RESERVED_2		= 2,
-	WMI_EVENT_RESERVED_3		= 3,
+	WMI_EVENT_SWITCHVIDEOMODE	= 1,
+	WMI_EVENT_SELECTIVE_SCREENSHOT	= 2,
+	WMI_EVENT_ALL_APPLICATIONS	= 3,
 	WMI_EVENT_AIRPLANE_MODE		= 4,
 	WMI_EVENT_KBD_BRIGHTNESS	= 5,
 	WMI_EVENT_TOUCHPAD_STATE	= 6,
@@ -100,10 +105,11 @@ enum bitland_mifs_event_id {
 	WMI_EVENT_FN_1			= 19,
 	WMI_EVENT_FN_2			= 20,
 	WMI_EVENT_FN_3			= 21,
-	WMI_EVENT_FN_4			= 22,
+	WMI_EVENT_PERFORMANCE_PLAN_ALT	= 22,
 	WMI_EVENT_FN_5			= 24,
 	WMI_EVENT_REFRESH_RATE		= 25,
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
+	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
 	WMI_EVENT_WIN_KEY_LOCK		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
@@ -607,18 +613,55 @@ static const struct attribute *const laptop_attrs[] = {
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
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_PERFORMANCE_PLAN_ALT, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SELECTIVE_SCREENSHOT, 0, 0),
+		{ KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_ALL_APPLICATIONS, 0, 0), { KEY_ALL_APPLICATIONS } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 0, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 0, 0), { KEY_SWITCHVIDEOMODE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_REFRESH_RATE, 0, 0), { KEY_REFRESH_RATE_TOGGLE } },
+
+	/* AI button has code for each position */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(0x19, 1, 0), { KEY_ASSISTANT } },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x80, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 5, 0), {KEY_KBDILLUMTOGGLE} },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KBD_BRIGHTNESS, 0x0a, 0), {KEY_KBDILLUMTOGGLE} },
+
+	/* Xiaomi G Command Center */
+	{ KE_KEY, BI_HOTKEY_CODE(0x0a, 1, 0), { KEY_VENDOR } },
+
+	/* Fn Lock state */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), { KEY_FN_ESC } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), { KEY_FN_ESC } },
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
@@ -736,13 +779,36 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
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
 	u8 brightness;
+	u32 payload;
 
 	/* Validate event type */
 	if (event->event_type != WMI_EVENT_TYPE_HOTKEY)
@@ -761,21 +827,11 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
 		break;
 
 	case WMI_EVENT_PERFORMANCE_PLAN:
+	case WMI_EVENT_PERFORMANCE_PLAN_ALT:
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
@@ -783,6 +839,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
@@ -793,27 +857,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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

