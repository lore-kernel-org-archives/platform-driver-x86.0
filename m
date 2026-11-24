Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795544365;
	b=QA9LEXdCcm4xb7+/9EBhhzjvQHGa4XC1oLN9xBk5YkGkZq76r6N1fNZFEPoUqhr5mfr3
	 jG9waHMmTz5DQ7N2Kg26CsDRvBk3Y4rV3S+kteym6HGFZYUJVYhkmMdwM9rW+H4Oy+C+E
	 1HKdTDxFJo4DlihBqNSSbIXUlekPIf3cXtl95KBiLqRGTqQjgi2R5v2YxJ7GTM33hg3I6
	 2oQf2u7YWuAewWR5VoDO8XY8MRHRPQHkoasR5JybGANCQh5fK9WDgYQODJvsmkI9STFXR
	 l2rD/msa2WagzLWp+yGkhF3dWhuDA9zIu7uDsQYOdq8NDRxK360noCj7nz5+mSTmWMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795544365;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=Z7KHlxQ+du4fWMW/ES8EDODqbISC1Fb30RTaQa14arI=;
	b=GPgVOH/gZchWxgvASvUMW23AQx3fj8ATz5YMo6itXxcWeE0gmwq5Qbt2AIKB8FYXgQUR
	 XDAEhWbGB/yfWSFBhokyIbHLjshW2ezfNHZnp6LY86yVnb6WOeArmZtVLkcxgH+dEjKNd
	 LwpRFaUFQd31pgwEhSrMUpPw/VovLsawqS7AmyCu9fs3tjC8FZUKAj+VI0qJM86bk/LOk
	 QqtongQYVPDujPD2DJwKJthJSha5pZUEFFbcwTJMBEqCKjBr89FnQD8bx6i9Y1/wIcOf3
	 mGShQ3pIVtpAzu9wyiFB7OoRDVxl37O6is9lAT0aXjOEn9AVKKkYhO79Pi1JFQNnLKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b="St4fvmy/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.112
Received: from sender6-pp-f112.zoho.com (sender6-pp-f112.zoho.com [165.173.180.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3CD606A686;
	Tue, 24 Nov 2026 18:19:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC3CD606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=St4fvmy/
ARC-Seal: i=1; a=rsa-sha256; t=1795544277; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YvqO0v3QwKL4y5/+u/pggMCv1o5QCyPCxEBTLE+VNauSkX26kv72PiF1gZ/XtayX04t/xrznBfKLv1snw9zU2uQ/XF4hX0eOezMBd8cLGQbtaMzWZpZ9CiNxeVI8S5MV1e11y03rq/j3V6fetFgHI2OJLlHv+gl6jwLwDkqQeVM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795544277; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z7KHlxQ+du4fWMW/ES8EDODqbISC1Fb30RTaQa14arI=; 
	b=kPie35zPKF6vP1HJS/iFFvFVaTodxDrieBslZnvN0M22pelpwxnv2P4AQUmneKFw/q3gt1voj2Ql+KBwWO3NdZGT+IJaTAWJmJcI6tf/1CWsO9jM/1zHgkToZfjCoi/Xp+D85tDx/soOPSSX83RVm2IajHSa9AHFqC6F1OMNcoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: a=rsa-sha256; b=St4fvmy/fAqIWsmwsKlPxVd2ChZuQeMDpNxi13mb3+UX9BGUvO2eaRr3ffEr4utGWcZy1HLEWAiMfDuhl/ocjTVsmK16HnbAT80XP30u4VoPRsB6XyXX/wILEobmg/jjY5Zt68mi+FEOQtMJbBA2tVOPPtbE+sAHzdSlK1HMvR/My3y5NvGG57JaeCOPyYLURYr7rLXCDCEk+ttL/AWZB9SZyS32P4aVRHoCW4u8YBxBkiYhBt92yVP7usvGcuEfWkEgP9crVgE4/Z7oO5d+YL1qBjwWmQMA8UjlHo2az8Gj+mC2A3KpcG59jDGs1HWYlVQu6Npe8KN1T59g9aobuA==; c=relaxed/relaxed; s=zmail2048; d=rong.moe; v=1; bh=Z7KHlxQ+du4fWMW/ES8EDODqbISC1Fb30RTaQa14arI=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179554427627347.34518138902445;
	Tue, 24 Nov 2026 10:17:56 -0800 (PST)
From: Rong Zhang <i@rong.moe>
Date: Wed, 25 Nov 2026 02:17:00 +0800
Subject: [PATCH v2 4/7] platform/x86: lenovo-ymc: Modernize WMI driver and
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
Message-Id: <20261125-ymc-82yl-v2-4-624bdcb3c50e@rong.moe>
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
asynchronous-probe driver that only binds to the query GUID.

Also ensure the EC is always triggered on valid events (i.e., passing
the min_event_size check) and on probe. In this manner:

- on LENOVO_YMC_QUERY_METHOD success, everything is fine. Otherwise...
- on probe, fall back to YMC_POSTURE_UNKNOWN
  - sparse_keymap_report_event() becomes a no-op
  - trigger the EC to ensure the keyboard and touchpad are enabled
    (following changes), or else the user may be unable to input
    anything
- on event, fall back to the event data
  - the event carries data as per the MOF (see above)
  - the WMI core has verified that the event has 4-byte-or-more data
  - if the event data is correct, everything is fine
  - if the event data is bogus, it's probably either YMC_POSTURE_UNKNOWN
    (0) or an undefined value (>4). In either case, trigger the EC to
    ensure the keyboard and touchpad are enabled for the same reason

The input device's phys string also adopts the query GUID rather than
the events one. It shouldn't break anything, as nothing actually matches
the previous phys string.

The DMI quirk tables are left untouched, as the contained devices should
have both GUIDs.

Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
Signed-off-by: Rong Zhang <i@rong.moe>
---
Changes in v2:
- Rephrase the commit message (thanks Mark Pearson)
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

