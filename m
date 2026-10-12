Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCC24746AE
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 10:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791799582; cv=none; b=FUFR2tPTu6/+Kww74UJfYDpL+t7NPr195cSTvRSnL3YvX0LMQa4zYDWVNHRfG0r9ftChuwVETLhGlOWwRgVUdU7VJLkYxox6Vdm9u1dNit2alDcuRarTqb5xpExGebDD4r49sKuVmoO8TXLnMrN8yXoRSaXtsDFtnEz6cbnpP4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791799582; c=relaxed/simple;
	bh=KE32MPdk630OP4mcjFF+tnKfscX0Vy7b57ovCK8ZCP8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NBRxIh5B5WJAIyaujOg8ILCRKPmckcHa7VFNHGba4egTcxat9CgtWNOK/LKKyzpEr5t8crprjlWgDCI51OriGuwWsfA5D/4eXY6tIcuBk64qTJBicZdYrVCmrXjKWU6Jp0wcKNaxRXOQlXxCTQsrd5+x9/2DE0kKsxAvzF9/RkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WczCtrHY; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WczCtrHY"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-88b8f0a1bcdso1379625b3a.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Oct 2026 03:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791799568; x=1792404368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eEaqWKZCnb8knxALPfuEFW/H7ucJ/r2F6JuslLQC1lc=;
        b=WczCtrHYJuuBy86HGq/K1KnVa+XyX6g03mpE/mDvu/Y/qpCOmdvuCnUCSSmSf4d54T
         +Zf6lobOqU+Mxz4ag1rC0jhRri7qq/BpVcg4SxYDYqfu3tP9QoIx3tqitD8bO03sJbBx
         YJfMfwskg+TCxheGL5Sw+LXIDZcdEw521iQWArFVd//rZkBBNz9UKIZJVtkrg9TeUD34
         4jT7qo3rnb4MUSdfWtPqsGkbcBO56Cy/3ylQOgKxXfZfHjcytjFC32LtArGz9FpOLHbY
         +BuDpti8flYOtjMc/3PTWeZKpUuU/tEiwGGaduPI59Ds93lEQUSkyPkAfjG8+ygFMvnl
         SSKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791799568; x=1792404368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eEaqWKZCnb8knxALPfuEFW/H7ucJ/r2F6JuslLQC1lc=;
        b=O5OuB5UC2z6qndQxCx16Zc3pNWZqgkCBuzjPggPCocWdQbbb7NLX0MP2olHToqE+8N
         cQrz8cJJaWoc7TFEo2+A6vy8delPBsm7xyat8Kk2c3fNHSjf1vzCKYsPtBsZ+d77H4jP
         1l1AAS1CzMfKgphkK4doLA6qrHhLmog5JRdAxZo1K2JlltZjSU953r7mpZ3XwjXXGy9c
         93PGR6K0RH/Hz6rirfQY84jiQdyL5dZdfwRhidfXljrexKpQu1oy4kC1YouuTK4H94x8
         pE2T1/zC3thjSA1W3RKKx5vl6ONGoRaZVWPBODlPhDgobNT1f2rmzHCym/NuSo5GeMqE
         umWQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1zdRjA0cgNYcz75biUH1D/QnUpRNC6LrLvH50p9gjaV1CQYJ+oTDmj/6kTFvgjffP1nRfxxrbGqMxS08NeDgSwTyx@vger.kernel.org
X-Gm-Message-State: AFq9FYJxgVMc8ZI5MCtfVUcF582wHmdDVrrhc6oy92yv2ha2TAITnqFx
	JHAY5trVuQgCyjyPNvjCq+trCefdrgezCl4XG7aMEshIj/ZcrzXg4Vvw
X-Gm-Gg: AYBFou0jR7qtHu9lEOkAYoeG2nnFGTGT1N92pvFXLfB5U/MmZUD97wFtfZLb1JLMoA5
	IW4rymrA/8DVoHt95009QYHYu/vqT9rhPryDG4x3USpskmNdmAdEvTWeE03dAmaVz5ilY+dGzl4
	d30YGdgPVSlxGLj0otSCkXMigeXr9wA+upcmZ2ecS+TbyW9By0vykl91cawIzlqKkIh2hb2Jr02
	QypwznPERgW28QN2Vr88oI51Axdlh9/gEM1GpuYRSpzvuNmqeruxDX18vbxm8PIVmW14aJkUgyf
	8hveRTMLljvnTUOVMDHc6TpjDD7rWzVumsK7CTgIuR/mfQEX4PPE/8xL0YC4l69Ko1K0WU3udGD
	X+N9yugXRPjPWpzzAFGdYBckzleLnQsGYU4D/gLQNCmIvdi6XOZxU9KodJOEiO2HXBYLbNJuKct
	4khP+XJsQN8WV+Wm2URAQK1FuaMJ4fm96ZPzksmgCwLKvBzTcVpz4NfTm0UvpVUr94TF4FQ7F0x
	ZguNRjxuA==
X-Received: by 2002:a05:6a20:734b:b0:3da:c10c:6aa6 with SMTP id adf61e73a8af0-3e16baa4746mr8447854637.1.1791799567899;
        Mon, 12 Oct 2026 03:06:07 -0700 (PDT)
Received: from qby-nixos-laptop ([20.89.137.63])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3da04596dsm4074272a12.29.2026.10.12.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 03:06:07 -0700 (PDT)
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
Subject: [PATCH v11 2/6] platform/x86: bitland-mifs-wmi: Merge the function of redmi-wmi into the bitland driver
Date: Mon, 12 Oct 2026 18:05:28 +0800
Message-ID: <20261012100532.19612-3-qby140326@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012100532.19612-1-qby140326@gmail.com>
References: <20261012100532.19612-1-qby140326@gmail.com>
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
 drivers/platform/x86/bitland-mifs-wmi.c | 149 ++++++++++++++++--------
 1 file changed, 102 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/bitland-mifs-wmi.c b/drivers/platform/x86/bitland-mifs-wmi.c
index dd1648b7de77..a6978d14b975 100644
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
+	WMI_EVENT_KEY_PERFORMANCE	= 22,
 	WMI_EVENT_FN_5			= 24,
 	WMI_EVENT_REFRESH_RATE		= 25,
 	WMI_EVENT_CPU_FAN_SPEED		= 26,
+	WMI_EVENT_CONFIG		= 27,
 	WMI_EVENT_GPU_FAN_SPEED		= 32,
 	WMI_EVENT_WIN_KEY_LOCK		= 33,
 	WMI_EVENT_RESERVED_23		= 34,
@@ -607,18 +613,60 @@ static const struct attribute *const laptop_attrs[] = {
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
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 0, 0), {} },
+	{ KE_IGNORE, BI_HOTKEY_CODE(WMI_EVENT_FN_5, 0, 0), {} },
+
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SELECTIVE_SCREENSHOT, 0, 0),
+		{ KEY_SELECTIVE_SCREENSHOT } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_ALL_APPLICATIONS, 0, 0), { KEY_ALL_APPLICATIONS } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 0, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_CONFIG, 1, 0), { KEY_CONFIG } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_SWITCHVIDEOMODE, 1, 0), { KEY_SWITCHVIDEOMODE } },
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
+	/* OEM preset power mode */
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 1, 0), { KEY_PERFORMANCE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 2, 0), { KEY_PERFORMANCE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 3, 0), { KEY_PERFORMANCE } },
+	{ KE_KEY, BI_HOTKEY_CODE(WMI_EVENT_KEY_PERFORMANCE, 4, 0), { KEY_PERFORMANCE } },
+
+	/* Fn Lock state */
+	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 0, 0), {} },
+	{ KEY_FN_ESC, BI_HOTKEY_CODE(WMI_EVENT_FNLOCK_STATE, 1, 0), {} },
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
@@ -736,13 +784,36 @@ static int bitland_mifs_wmi_probe(struct wmi_device *wdev, const void *context)
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
@@ -758,24 +829,13 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
@@ -783,6 +843,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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
@@ -793,27 +861,14 @@ static void bitland_mifs_wmi_notify(struct wmi_device *wdev,
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

