Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770919;
	b=aClSvcAVzSqSRqC7T6usPOo4G+bz0JiREVTo/Zrzs7efpX2GbKcbBGeVZN1E3W77/60n
	 BvIYGFqS0Wf746KsHU79tvHQV1nAL4zbbQCK4W6+q6Kq+hfXZpj7PCmiZ1ayl/ab3WR0h
	 xQvZD4tP4Iet5/b8fm7bYwSKaI9UwDYyr5GHW+bGnFIyTTNmQM7xlPh8bfYOJ+NxDgNht
	 Wwn/ahaUZzeHSbZ9hyMG3gVj7f371My/cDMrXryj1Oj2qrTxBcocdN5ThtbjYdUUMI2JC
	 Qa8zrud8Z3m1boWgxd7V1pt5I29f2TfWXPIVZAdIsnP67Ev+q6lPKgb8QTN9axYgSNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770919;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=LuikcRpRqdG+MSvKeZ+ge3k6cdBIl6UYUQe/v8yfAHs=;
	b=GXyOGLftytJ+DeMFFAkj0qFIsPJdCTN3henJalD5xqx5CVEiBo3HoV8UJjf0rXs4s5It
	 1tqt4F39smzzgMudrYiRHH2tNStD7wmhC6dtir9qhc79KmQtE+RcC5yARKwp2EHrYrLi0
	 +JaTKIWkyPku4TS7xXgWoABuxLhcwpfG8MwgKa/xdB3sstgpPmxvv33kGylXWwDZjgFE3
	 wjGI9GOkT4N3Nya6Pz1w02bcIOh++RoKn+6NnPwmde5nfYSYO1O3tYFRvz8WkjakxY/NR
	 KetSxt1uhX/4l9uxQYdZSdnEnpOOamLDxDKpNqiInwtUP0Bwbew3oawEovn8apWzfQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=iRdiJr2p;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB59606A8A4;
	Sun, 15 Nov 2026 19:28:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB59606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=iRdiJr2p
ARC-Seal: i=1; a=rsa-sha256; t=1794770887; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Je0CL6Av8aa9GXadormBs+pijVqwjyj1oymZVC48/MLVXax2PpowmQKEaOkKsnv1Xyiw/7us4edpZQg2y0RPHt2u7+pSVRilcQhDvFT7idYm1uH/o/P/BjsW7ZXocg/2sRDpoL+OeO+SsM4usKcWZq7tyVl9iBe2T5KrhZPJ6bM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794770887; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=LuikcRpRqdG+MSvKeZ+ge3k6cdBIl6UYUQe/v8yfAHs=; 
	b=KJY3M7fLfKoBKixAtg+74j1fhBVGZcQsaFfepozGj5cT5RNZmqxyaprTSMAbIJdvWkauMAZvNTIH2KqfnIx/5RwsjEVVOn7gtEotmUWTDU29R2X8qmxwpM5o1HSN6iZEdNKs+PzEA2m7qke7JlvzsGRIEZId1gDm9OlOqxjU4Rw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=iRdiJr2p0HracHfJ4KrWbYOsYXGBVoQ6vMrt7COomOwsletqBUGea1c7tZOIIlE3ZOBvfEdxbD/La7jBxjDzuZHkpvLrr1oDGOUV5UALCnPsA4AMtzvTm7ZFP8EZU9DydK4OSfPkT8677vzAuOdGaK6yuvTELUnU2EnEsuCzPOnVuMUi5ROxIRuzjYXOCnr1NMJo+c4/wCm6TRzOEutyiln62qe8G9YenFqnD0VdhW6qXlqNwvB+FeTu9CY+c18F0REL9A/WK6PK+s5vOCnehOY3JPAeSle80QHmYXOVEJbW7QZOhf1Yj5eJsRTcAR3/vNvydnm1vAO/C+zykcbiMA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=LuikcRpRqdG+MSvKeZ+ge3k6cdBIl6UYUQe/v8yfAHs=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794770884602563.4110264796604;
	Sun, 15 Nov 2026 11:28:04 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Mon, 16 Nov 2026 03:27:04 +0800
Subject: [PATCH 3/7] platform/x86: lenovo-wmi-events: Modernize WMI event
 handling
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-ymc-82yl-v1-3-fac1a2b01a84@rong.moe>
References: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
In-Reply-To: <20261116-ymc-82yl-v1-0-fac1a2b01a84@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mahir Faisal <mahirfaisalantiq33@gmail.com>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-ce4c1
X-ZohoMailClient: External

The WMI core calls the new notify_new() callback with unmarshaled event
data and size check, aligning with the Windows behavior that the ACPI
object type doesn't matter but the size does.

Adopt it to modernize the driver and hopefully improve robustness on
various firmware, like previously did for lenovo-wmi-{capdata,helpers}.

The blocking_notifier_call_chain() code path is also moved, so that it
will be easier when adding new GUIDs to the driver.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/wmi-events.c | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/x86/lenovo/wmi-events.c
index 3a82192dc9e5..01ad5bcf0437 100644
--- a/drivers/platform/x86/lenovo/wmi-events.c
+++ b/drivers/platform/x86/lenovo/wmi-events.c
@@ -9,13 +9,14 @@
  * Copyright (C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
  */
 
-#include <linux/acpi.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
+#include <asm/byteorder.h>
+
 #include "wmi-events.h"
 #include "wmi-helpers.h"
 
@@ -110,25 +111,23 @@ EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
 /**
  * lwmi_events_notify() - Call functions for the notifier call chain.
  * @wdev: The parent WMI device of the driver.
- * @obj: ACPI object passed by the registered WMI Event.
+ * @buf: WMI buffer passed by the registered WMI Event.
  *
  * Validate WMI event data and notify all registered drivers of the event and
  * its output.
  *
  * Return: 0 on success, or an error code.
  */
-static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
+static void lwmi_events_notify(struct wmi_device *wdev, const struct wmi_buffer *buf)
 {
 	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
+	void *notif_data = NULL;
 	int sel_prof;
 	int ret;
 
 	switch (priv->type) {
 	case LWMI_EVENT_THERMAL_MODE:
-		if (obj->type != ACPI_TYPE_INTEGER)
-			return;
-
-		sel_prof = obj->integer.value;
+		sel_prof = le32_to_cpup(buf->data);
 
 		switch (sel_prof) {
 		case LWMI_GZ_THERMAL_MODE_QUIET:
@@ -136,13 +135,8 @@ static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
 		case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
 		case LWMI_GZ_THERMAL_MODE_EXTREME:
 		case LWMI_GZ_THERMAL_MODE_CUSTOM:
-			ret = blocking_notifier_call_chain(&events_chain_head,
-							   LWMI_EVENT_THERMAL_MODE,
-							   &sel_prof);
-			if (ret == NOTIFY_BAD)
-				dev_err(&wdev->dev,
-					"Failed to send notification to call chain for WMI Events\n");
-			return;
+			notif_data = &sel_prof;
+			break;
 		default:
 			dev_err(&wdev->dev, "Got invalid thermal mode: %x",
 				sel_prof);
@@ -152,6 +146,13 @@ static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
 	default:
 		return;
 	}
+
+	ret = blocking_notifier_call_chain(&events_chain_head, priv->type, notif_data);
+	if (ret == NOTIFY_BAD) {
+		dev_err(&wdev->dev,
+			"Failed to send notification to call chain for WMI event type %d\n",
+			priv->type);
+	}
 }
 
 static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
@@ -185,7 +186,7 @@ static struct wmi_driver lwmi_events_driver = {
 	.id_table = lwmi_events_id_table,
 	.min_event_size = sizeof(u32),
 	.probe = lwmi_events_probe,
-	.notify = lwmi_events_notify,
+	.notify_new = lwmi_events_notify,
 	.no_singleton = true,
 };
 

-- 
2.55.0

