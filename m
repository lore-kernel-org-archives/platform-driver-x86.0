Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794770927;
	b=sD06TRAskCfsie/ejx2OUWqLRyn3sre30JYhB2X8HGxnrxodMkRwrFmCk8nwPIMJ9ABq
	 McMJDIHrmmAJSJBmsvV7SYtTmx/tuzOzsNEGIJOgRuvrT59Lm5ALBUYZxL5OXvHIkKMec
	 MoHvwrZQIF9lQ/K4SujwrD0ACfgyqS47vmqGjpdc4ej8XDeEpCzMdHL6N3EEk2sA3KXSZ
	 YIZPJeZwaK+bKUpYFO0ga1YqevVCJxjsGGEqS8uItP1JiT2RQYEohP+sLGogdfRAaHmNb
	 N3ypZmq3Tka2htvTBZ9uOw4fuRycWyPzco85+TzReSrGfaqVraWl8RcjFxuzpQn+KkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794770927;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=0WGkGrKvdCkM558sYOg/6Q+pmqbzLkE04JO3NLjA3Gk=;
	b=R8KgIWZ716PQFhyKuEU24AmYr+OeAYadV7PFBqDooj1NAEwSr/+jJc27QgwK7tEgKyX0
	 ijjoXPB16CGvRNq3veUIXt7JmdNDEoQEOYF6yOHRsO39cjRIWJfEMxqWcuyqqffWIPEas
	 wfd4FWpottDC4w+Kw6wOfZouBbmYOhRJ3exKh9tHXlpDI6p1FAbGPKwD8VUnFow44kOT9
	 7+nEec3xaswZADCI54LuTGz+jI6pqO1dcg5WDzuWPNFFxCQQRzR+VNxqyz2gWz9h296GT
	 eNbNG8fXrYfyq4YCCTZCoojesjV1GLNpVb7VmlKkwV2AKZMmfhzH9CNtVqvcpCktshw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZyFHFmUx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE58606A880;
	Sun, 15 Nov 2026 19:28:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EE58606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=ZyFHFmUx
ARC-Seal: i=1; a=rsa-sha256; t=1794770891; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jdWrGyKeeD9kf54B17ZLyxFZPM65KluLWhidl+/qCoMepH20Xee5TL9KvfePp5pWkuVZ1zF/yWYugIeaY5Mr+wuyNGYcyvkbu8IDqSwq+NEtpFG6SmxjCmH7mQhm6yomSWpMKjBXLr0BmqddkRKQ3YKVEcd92JgMoeNefxRpyFg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794770891; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0WGkGrKvdCkM558sYOg/6Q+pmqbzLkE04JO3NLjA3Gk=; 
	b=QutQmuBGc7UR4uXXPJROgxmyZgxl010G5wtMD8iT2QkKSZVLkGHdDzBVqRTyREdgPuzc44Cz5z6js/MstZywF9PcSoX+cD16rAa+JzrR88EdVSudaOXsYK0D9WTxtouCHb7wwS1rgjxm5aC61bmdF0vpiJHc4GcUA0m8M5JZ5oQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=ZyFHFmUxXnI1Hi4IHblRObTsRKKcYmFtHw6ORWXQtOk8gGVpGJ/AVl3yI8XxKZ7Wx3BGtwJFD4qn9DCz8CdImIu6Z3sIoJGOSZU4Ljt4dzN+uGuuV+Q3ietMLQfwv7RRl7rjK3//CiY/riqhcNlXdGawdM4Ic/0CwA0V4yxeiiHfrumczpRjp37X1sLEz/0JRiEju38pESwt3v4o2ceqvpQv/b8Mml2uKvzNSBEmYCLo6UC2EPlqT63qh9/kQq4EuYKEITkr2OdTpnX+lqZA4lfuyi2e9uS0PFEbx8DBMSQpGz7frqjaj3tStGxW1WWhzaGLLnx/vyiqCX3qN1Kz5w==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=0WGkGrKvdCkM558sYOg/6Q+pmqbzLkE04JO3NLjA3Gk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794770888075296.2441324298122;
	Sun, 15 Nov 2026 11:28:08 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Mon, 16 Nov 2026 03:27:05 +0800
Subject: [PATCH 4/7] platform/x86: lenovo-ymc: Modernize WMI driver and
 factor out events
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261116-ymc-82yl-v1-4-fac1a2b01a84@rong.moe>
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

The lenovo-ymc driver is a legacy WMI driver. It binds to the events
GUID as a WMI driver but calls the query GUID with the deprecated GUID-
based interface.

Handle YMC events in lenovo-wmi-event, and coordinate relevant drivers
with notifier chains:

                +---LWMI_EVENT_THERMAL_MODE---> wmi-gamezone
                |
  wmi-events ---+
                |
                +---LWMI_EVENT_YMC---> ymc ---IDEAPAD_LAPTOP_YMC_EVENT---> ideapad-laptop

Modernize the lenovo-ymc driver by adopting lwmi_dev_evaluate_int() from
lenovo-wmi-helpers, which has adopted the modern WMI core interfaces and
taken care of buffer's lifecycle. This should hopefully improve
robustness on various firmware as it aligns with the Windows behavior
that ACPI object type doesn't matter but the size does.

Note that the WMI core does not verify min_event_size for the legacy
notify() callback (it only ensures the event has data). By factoring out
YMC events to lenovo-wmi-events with the new notify_new() callback, now
the WMI core can finally verify the size of event data:

  [WmiDataId(1), read, Description("Lenovo Yoga Mode Change Event")] uint32 ModeDataVal;

With these changes, the lenovo-ymc driver become a no_singleton
asynchronous-probe driver that only binds to the query GUID. It also
retrieve event data as a fallback data source when the query method
fails, so that the EC is always triggered on valid events (i.e., passing
the min_event_size check). On probe it's always triggered, too, as we
want the EC to initialize the state of keyboard and touchpad on boot.

The input device's phys string also adopts the query GUID rather than
the events one. It shouldn't break anything, as nothing actually matches
the previous phys string.

The DMI quirk tables are left untouched, as the contained devices should
have both GUIDs.

Signed-off-by: Rong Zhang <i@rong.moe>
---
 drivers/platform/x86/lenovo/Kconfig      |  2 +
 drivers/platform/x86/lenovo/wmi-events.c |  7 +++
 drivers/platform/x86/lenovo/wmi-events.h |  1 +
 drivers/platform/x86/lenovo/ymc.c        | 85 ++++++++++++++++++--------------
 4 files changed, 58 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
index 516594993073..f16b09bab082 100644
--- a/drivers/platform/x86/lenovo/Kconfig
+++ b/drivers/platform/x86/lenovo/Kconfig
@@ -63,6 +63,8 @@ config LENOVO_YMC
 	depends on INPUT
 	depends on IDEAPAD_LAPTOP
 	select INPUT_SPARSEKMAP
+	select LENOVO_WMI_EVENTS
+	select LENOVO_WMI_HELPERS
 	help
 	  This driver maps the Tablet Mode Control switch to SW_TABLET_MODE input
 	  events for Lenovo Yoga notebooks.
diff --git a/drivers/platform/x86/lenovo/wmi-events.c b/drivers/platform/x86/lenovo/wmi-events.c
index 01ad5bcf0437..a0ddea01213f 100644
--- a/drivers/platform/x86/lenovo/wmi-events.c
+++ b/drivers/platform/x86/lenovo/wmi-events.c
@@ -21,6 +21,7 @@
 #include "wmi-helpers.h"
 
 #define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
+#define YOGA_MODE_CHANGE_EVENT_GUID "06129D99-6083-4164-81AD-F092F9D773A6"
 
 #define LWMI_EVENT_DEVICE(guid, type)                        \
 	.guid_string = (guid), .context = &(enum lwmi_events_type) \
@@ -123,6 +124,7 @@ static void lwmi_events_notify(struct wmi_device *wdev, const struct wmi_buffer
 	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
 	void *notif_data = NULL;
 	int sel_prof;
+	u32 ymc_mode;
 	int ret;
 
 	switch (priv->type) {
@@ -143,6 +145,10 @@ static void lwmi_events_notify(struct wmi_device *wdev, const struct wmi_buffer
 			return;
 		}
 		break;
+	case LWMI_EVENT_YOGA_MODE_CHANGE:
+		ymc_mode = le32_to_cpup(buf->data);
+		notif_data = &ymc_mode;
+		break;
 	default:
 		return;
 	}
@@ -175,6 +181,7 @@ static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
 
 static const struct wmi_device_id lwmi_events_id_table[] = {
 	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE) },
+	{ LWMI_EVENT_DEVICE(YOGA_MODE_CHANGE_EVENT_GUID, LWMI_EVENT_YOGA_MODE_CHANGE) },
 	{}
 };
 
diff --git a/drivers/platform/x86/lenovo/wmi-events.h b/drivers/platform/x86/lenovo/wmi-events.h
index cd34e886912c..592da08ff2a3 100644
--- a/drivers/platform/x86/lenovo/wmi-events.h
+++ b/drivers/platform/x86/lenovo/wmi-events.h
@@ -10,6 +10,7 @@ struct notifier_block;
 
 enum lwmi_events_type {
 	LWMI_EVENT_THERMAL_MODE = 1,
+	LWMI_EVENT_YOGA_MODE_CHANGE = 2,
 };
 
 int lwmi_events_register_notifier(struct notifier_block *nb);
diff --git a/drivers/platform/x86/lenovo/ymc.c b/drivers/platform/x86/lenovo/ymc.c
index eba22600161e..cb3ae49dfd9e 100644
--- a/drivers/platform/x86/lenovo/ymc.c
+++ b/drivers/platform/x86/lenovo/ymc.c
@@ -3,22 +3,25 @@
  * lenovo-ymc.c - Lenovo Yoga Mode Control driver
  *
  * Copyright © 2022 Gergo Koteles <soyer@irl.hu>
+ * Copyright © 2026 Rong Zhang <i@rong.moe>
  */
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
-#include <linux/acpi.h>
 #include <linux/bitfield.h>
 #include <linux/bits.h>
 #include <linux/cleanup.h>
+#include <linux/container_of.h>
 #include <linux/dmi.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 #include <linux/wmi.h>
 #include "ideapad-laptop.h"
+#include "wmi-events.h"
+#include "wmi-helpers.h"
 
-#define LENOVO_YMC_EVENT_GUID	"06129D99-6083-4164-81AD-F092F9D773A6"
 #define LENOVO_YMC_QUERY_GUID	"09B0EE6E-C3FD-4243-8DA1-7911FF80BB8C"
 
 #define LENOVO_YMC_QUERY_INSTANCE 0
@@ -61,8 +64,10 @@ static const struct dmi_system_id allowed_chasis_types_dmi_table[] = {
 };
 
 struct lenovo_ymc_private {
+	struct wmi_device *wdev;
 	struct input_dev *input_dev;
 	struct mutex mutex; /* Protects event handling. */
+	struct notifier_block nb;
 };
 
 static const struct key_entry lenovo_ymc_keymap[] = {
@@ -75,49 +80,44 @@ static const struct key_entry lenovo_ymc_keymap[] = {
 	{ KE_END },
 };
 
-static void lenovo_ymc_notify(struct wmi_device *wdev, union acpi_object *data)
+static void lenovo_ymc_refresh(struct lenovo_ymc_private *priv, u32 code)
 {
-	struct lenovo_ymc_private *priv = dev_get_drvdata(&wdev->dev);
-	u32 input_val = 0;
-	struct acpi_buffer input = { sizeof(input_val), &input_val };
-	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *obj;
-	acpi_status status;
-	int code;
+	struct wmi_device *wdev = priv->wdev;
+	u32 input = 0, output;
+	int ret;
 
 	guard(mutex)(&priv->mutex);
 
-	status = wmi_evaluate_method(LENOVO_YMC_QUERY_GUID,
-				LENOVO_YMC_QUERY_INSTANCE,
-				LENOVO_YMC_QUERY_METHOD,
-				&input, &output);
-
-	if (ACPI_FAILURE(status)) {
-		dev_warn(&wdev->dev,
-			"Failed to evaluate query method: %s\n",
-			acpi_format_exception(status));
-		return;
-	}
-
-	obj = output.pointer;
-
-	if (obj->type != ACPI_TYPE_INTEGER) {
-		dev_warn(&wdev->dev,
-			"WMI event data is not an integer\n");
-		goto free_obj;
-	}
+	ret = lwmi_dev_evaluate_int(wdev, LENOVO_YMC_QUERY_INSTANCE, LENOVO_YMC_QUERY_METHOD,
+				    (unsigned char *)&input, sizeof(input), &output);
+	if (ret)
+		dev_warn(&wdev->dev, "Failed to invoke query method: %d\n", ret);
+	else
+		code = output;
 
 	/* strip upper bits (e.g. 0x50000) on newer devices */
-	code = FIELD_GET(LENOVO_YMC_STATE_MASK, obj->integer.value);
+	code = FIELD_GET(LENOVO_YMC_STATE_MASK, code);
 
 	if (!sparse_keymap_report_event(priv->input_dev, code, 1, true))
 		dev_warn(&wdev->dev, "Unknown key %d pressed\n", code);
 
-free_obj:
-	kfree(obj);
 	ideapad_laptop_call_notifier(IDEAPAD_LAPTOP_YMC_EVENT, &code);
 }
 
+static int lenovo_ymc_notify(struct notifier_block *nb, unsigned long action, void *data)
+{
+	struct lenovo_ymc_private *priv = container_of(nb, struct lenovo_ymc_private, nb);
+	const u32 *p = data;
+
+	switch (action) {
+	case LWMI_EVENT_YOGA_MODE_CHANGE:
+		lenovo_ymc_refresh(priv, *p);
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
 static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 {
 	struct lenovo_ymc_private *priv;
@@ -147,7 +147,7 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 		return err;
 
 	input_dev->name = "Lenovo Yoga Tablet Mode Control switch";
-	input_dev->phys = LENOVO_YMC_EVENT_GUID "/input0";
+	input_dev->phys = LENOVO_YMC_QUERY_GUID "/input0";
 	input_dev->id.bustype = BUS_HOST;
 	input_dev->dev.parent = &wdev->dev;
 	err = sparse_keymap_setup(input_dev, lenovo_ymc_keymap, NULL);
@@ -164,16 +164,24 @@ static int lenovo_ymc_probe(struct wmi_device *wdev, const void *ctx)
 		return err;
 	}
 
+	priv->wdev = wdev;
 	priv->input_dev = input_dev;
+	priv->nb.notifier_call = lenovo_ymc_notify;
 	dev_set_drvdata(&wdev->dev, priv);
 
+	err = devm_lwmi_events_register_notifier(&wdev->dev, &priv->nb);
+	if (err) {
+		dev_err(&wdev->dev, "Could not register YMC events notifier: %d\n", err);
+		return err;
+	}
+
 	/* Report the state for the first time on probe */
-	lenovo_ymc_notify(wdev, NULL);
+	lenovo_ymc_refresh(priv, YMC_POSTURE_UNKNOWN);
 	return 0;
 }
 
 static const struct wmi_device_id lenovo_ymc_wmi_id_table[] = {
-	{ .guid_string = LENOVO_YMC_EVENT_GUID },
+	{ .guid_string = LENOVO_YMC_QUERY_GUID },
 	{ }
 };
 MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
@@ -181,16 +189,19 @@ MODULE_DEVICE_TABLE(wmi, lenovo_ymc_wmi_id_table);
 static struct wmi_driver lenovo_ymc_driver = {
 	.driver = {
 		.name = "lenovo-ymc",
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.id_table = lenovo_ymc_wmi_id_table,
-	.min_event_size = sizeof(u32),
 	.probe = lenovo_ymc_probe,
-	.notify = lenovo_ymc_notify,
+	.no_singleton = true,
 };
 
 module_wmi_driver(lenovo_ymc_driver);
 
 MODULE_AUTHOR("Gergo Koteles <soyer@irl.hu>");
+MODULE_AUTHOR("Rong Zhang <i@rong.moe>");
 MODULE_DESCRIPTION("Lenovo Yoga Mode Control driver");
 MODULE_LICENSE("GPL");
 MODULE_IMPORT_NS("IDEAPAD_LAPTOP");
+MODULE_IMPORT_NS("LENOVO_WMI_EVENTS");
+MODULE_IMPORT_NS("LENOVO_WMI_HELPERS");

-- 
2.55.0

