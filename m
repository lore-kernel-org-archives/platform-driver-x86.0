Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544342;
	b=oKy4VZqxVfbP3r7UaMthwJeNYihU+Q4h03xoWPWQ6IPAUdxTNYnlwd7Cu5sQP1f3SYj8
	 lAHNYlKbR2kMlgOKkrYqAQVjW2RSHK1jXIpowzcETpYQu0MBNVikKHW8+LBzl8zsGbVXR
	 MKdlLzNGqE24jcxYDD4LgqBQRSUV4Khrf0mLipS8HI+qrKhgXI5oZoFW4GFLgPN1PUdTE
	 kjcGGg7+JrOwmkDlXqkOEBr4yBXSySrbu8CZfcst89dAAejhvKrYoALTwnDHJoXh8+oBB
	 HlszceO74VhtHozTnce3TNJLhbORypO+vePEApsODmE3eSW49iErRD76CQWTfXT1nOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544342;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=JWQjiHWw4KQI5nddQh/SjaCdci1febimnj/eG5L/wZo=;
	b=uF948MCJ7xLm8h5W83byW7cSqwGPytIS6w5SE2Q0MKQZdqHP1NENRb7caFrLJMuY/t3j
	 fCX+BGzVEiXuFkxI/ENLvWBnAEhSh+sqaty9/LaUvmDwdMnSU5Qv8iKNJiOZyFIXm8nEz
	 xsZB9CwI7guPMVOEmDLYUCoOwTC0OxjOrazorGT3NplyTEYZVA3JrW0yOGSS+OrpukBRd
	 OftC/t4k3EH1dVB5PUjeu7UhDo4VUDdY1qebH3xOAnn6Tc0quDP0glPVW3R5XrnydpnaY
	 KYafTiYAFWy6RC42oDnufvufMrGUH4SaU/rtsbW6z+v8a+zYsjIpMzvuHDeNFANm9VA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bBeUtQ5r;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B60606A68C;
	Tue, 24 Nov 2026 18:18:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43B60606A68C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=bBeUtQ5r
ARC-Seal: i=1; a=rsa-sha256; t=1795544273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XmAzYLjiad5h1OgGNyIC8bhUnoemvLnYIuRqdHW53VWy+oM9bEH+AygCf26RnuK+PY3pbRKcAISohnTOzGD0vF1wgacCMboniG3lDhD2Kyh9LEerPJTyAV+cdVqC2mTx81pmLuu82rIjIK+yAPEBIGNqWjp5L1SCdMwWP8GMEQ8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795544273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JWQjiHWw4KQI5nddQh/SjaCdci1febimnj/eG5L/wZo=; 
	b=BIMxnH6EwVTMYgb6B3zo4HbhAFyHwLTjFZFEkv7QirABQCVXQKzybNFdjbp3qDsNPbDQxvB8XazespJpT2inM/yfmEimH8Uy+1T8IT0btRYg349ckPHTQD8M2QNXNISQoC5JhwmbPR1iIk6Y5L+Kk7ug2yHvnLgC7c+3Bk2jaE8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=bBeUtQ5rOkWtNpCC0jGUbVgyEHBIdD1ESWgyh61gHsDsRiUY2f1khBWmaUTpoEp00hcG7p5Sbb1V1enV6h5RMNWBtxbGJ+/Imua3CDqN6cP+q34Ty6diqh0sO2s8iMmx7z0gQVXGmjE2y6HnGTPutSpso+s2XcIWEvClQndoFz19aE00FaB7IO6C5WvWc1e912uM83QO0BROF9ZlFGWxK9IlU9UVuGlTSZk+PcYU4FYI6WG1ZHELjjgLBMTG3xNY9Yv2lYvCElHUgGQRRZruLcNXySqU7MpOMbzMHYwATINNzhEpZALJ1oqXVJlqiUnt5esz/sgd2A9YuSj38rcZkg==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=JWQjiHWw4KQI5nddQh/SjaCdci1febimnj/eG5L/wZo=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795544272810139.75309241230934;
	Tue, 24 Nov 2026 10:17:52 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:16:59 +0800
Subject: [PATCH v2 3/7] platform/x86: lenovo-wmi-events: Modernize WMI
 event handling
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
Message-Id: <20261125-ymc-82yl-v2-3-624bdcb3c50e@rong.moe>
References: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
In-Reply-To: <20261125-ymc-82yl-v2-0-624bdcb3c50e@rong.moe>
To: Mark Pearson <mpearson-lenovo@squebb.ca>, 
 "Derek J. Clark" <derekjohn.clark@gmail.com>, 
 Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ikepanhc@gmail.com>, 
 Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc: Eduard Aliman <edialiman20@gmail.com>, 
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
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

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
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

