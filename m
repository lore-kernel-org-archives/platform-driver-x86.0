Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795630202;
	b=Kf8GWHZT2iQXpN6tehL3zfQjMGCGKPKH/kozTO/Niz4W87DeA0iVaNOpNXn/JEZmsb63
	 wZkjD6R94Zrv/vXO7VW2XPkmGOn2rW+f2Ho3u3FX0sktobARSWfTSgM8jBsBg2baEgUcE
	 /n/HTk7cJL45ArJR1NJxlStSSX575mS185jjLC21iGa0xKEU+Qf6vz3vW/Akzbj0oKpVR
	 0QhELTCS4JK6dHx/3xNyBqJoye+xo7Q+RZVAFuFhec269ynWBMxTxg4nPu2a+TyOOmruC
	 ejN+je83I589q+Q0GSKm1A79fykd9rbUw7IcmmK/4XDFJ1GysobXqQtgC8HV8fdk5qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630202;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=SwbJI8zY+X1/DDKPIgRAXUORFw02sO9uTFGJvCcjbk0=;
	b=wnXkYWEteOiRZYNSlN+1cytiBkRcdSrCeXvvViI1bRzKko5h9M2twa9Lonbh9SS2xtMJ
	 ZQRV0Rf9EikM2e9wAMKLrWmxLsbFeSAmQd8QcaQzsK3zU1cRmcMxvtYd+trHpdxpE9UPv
	 S340Z7V0nRO+opYsypA6DFU/00cH+E9wB3h+xd93x11Q6VGGTpVhrDsEdjgqV0ZVmlzSs
	 TLOxjbuIficCFsRxZeEh9TlCdV4ZqHwzhWZsbpTWZypMIqGk3eAHZOFdsrRjQ/wj9q3Q6
	 +5KPOdREZItTFGOM7t0XQCvmbSGj87uV+a4lwSbKmhTm67laEeYjPuYU9RV/Ccp7TPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pfqlsIqL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C32606A327;
	Wed, 25 Nov 2026 18:10:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4C32606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=pfqlsIqL
ARC-Seal: i=1; a=rsa-sha256; t=1795630133; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YHSAKrK5krRhD0HOSEkHnZivBEIiG66i98SGBBIrk74dC693C6kIjoxelEwDwXGWa37OyZl81cvSsSF7c+Z8sb1CC8lwpmY7Mj0saP6oFCxK+73oRQQTBIjL7/v4qrZwsfJ3jBAemUp7Lh2VlAlkgtqXVXYRTssyp+KmUu1oE+4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795630133; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SwbJI8zY+X1/DDKPIgRAXUORFw02sO9uTFGJvCcjbk0=; 
	b=YWIkfVknbybxbXKPMR5jwxNDnjbAG6gSSh3r63xKlxelHV1UXglWOTmXxHXhm0mvhKuGVAK6bQZBY2RGYvRxQBgrHRNV6snFTtlZDumy3Zaf3DtHqcZEFBxLulIPJl0k6H5VPAySJIUiaK0DSMjtyqDuYfHFiLR0l8jjdPBLF1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=pfqlsIqLBv1nMCC7as7nLOwBd8kXqCZ4C3s9Yp8mNpB+k8RwuG7TTS0vRhCtgwz7sEUVzMet7GCoo454kz2rqJQ9zQtFMAzsMsGlKD33qrfosKJ+F/dGbOqDcT4+P52z/8KG4CLh2BpuRoefF5kEk0oQYuDktkUWhDBrLCDb7mP8nxmiMrumJy7GN5g4jgrIYGnb62KJSwisz5i9WpN8qqAON0Qm4U4FUykz6Juc8XHWwgdO2LM8L44gn877AR6g5jPVAF0TC/TlogTJJJiAi0L+yr5W5gB1ua5imszQe0HbBH49Xxuzrf9g9c5WwggBcSWDsSpou9mgOL1MId+X5g==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=SwbJI8zY+X1/DDKPIgRAXUORFw02sO9uTFGJvCcjbk0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795630131787396.25831423159264;
	Wed, 25 Nov 2026 10:08:51 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Thu, 26 Nov 2026 02:08:21 +0800
Subject: [PATCH v3 3/8] platform/x86: lenovo-wmi-events: Modernize WMI
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
Message-Id: <20261126-ymc-82yl-v3-3-e30842671ec3@rong.moe>
References: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
In-Reply-To: <20261126-ymc-82yl-v3-0-e30842671ec3@rong.moe>
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
Tested-by: Eduard Aliman <edialiman20@gmail.com>
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

