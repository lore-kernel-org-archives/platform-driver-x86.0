Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2CDC43219
	for <platform-driver-x86@archiver.kernel.org>; Sun, 28 Nov 2021 19:02:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235157AbhK1TF7 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sun, 28 Nov 2021 14:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54636 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235652AbhK1TD6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 28 Nov 2021 14:03:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1638126042;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XBCGFOg0GNYYWVIVnJ2k6LWGZpjB7KpSnzmTQ1o4voo=;
        b=a35nLAU6p3rlRz/4XbICW7YLdEnYvmWEWF9HqqO6IIGszq9o7hVTojQq1Vvm/u/GvUt+TF
        pTQ37Xfu/DefH/kaybwTxvs501kjTnMBa/b3BT33+WD+F3RaFhSmTGbzRGckA56LyAE7ly
        8MNuN00XKqx24AD617qgQqpE41Zux6w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-99-Rq_dsSzdNZWIJadgLCunpQ-1; Sun, 28 Nov 2021 14:00:40 -0500
X-MC-Unique: Rq_dsSzdNZWIJadgLCunpQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46AEF1006AA2;
        Sun, 28 Nov 2021 19:00:39 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.65])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2A74E60BF1;
        Sun, 28 Nov 2021 19:00:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: lenovo-yogabook-wmi: Add support for hall sensor on the back
Date:   Sun, 28 Nov 2021 20:00:31 +0100
Message-Id: <20211128190031.405620-5-hdegoede@redhat.com>
In-Reply-To: <20211128190031.405620-1-hdegoede@redhat.com>
References: <20211128190031.405620-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On the back of the device there is a hall sensor connected to the
"INT33FF:02" GPIO controller pin 18, which gets triggered when the
device is fully folded into tablet-mode (when the back of the display
touched the back of the keyboard).

Use this to disable both the touch-keyboard and the digitizer when
the tablet is fully folded into tablet-mode.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/lenovo-yogabook-wmi.c | 71 +++++++++++++++++++++-
 1 file changed, 70 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo-yogabook-wmi.c b/drivers/platform/x86/lenovo-yogabook-wmi.c
index ecd624d9108f..65dd1ed97762 100644
--- a/drivers/platform/x86/lenovo-yogabook-wmi.c
+++ b/drivers/platform/x86/lenovo-yogabook-wmi.c
@@ -3,6 +3,9 @@
 
 #include <linux/acpi.h>
 #include <linux/devm-helpers.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/leds.h>
 #include <linux/wmi.h>
@@ -22,6 +25,7 @@ enum {
 	YB_KBD_IS_ON,
 	YB_DIGITIZER_IS_ON,
 	YB_DIGITIZER_MODE,
+	YB_TABLET_MODE,
 	YB_SUSPENDED,
 };
 
@@ -31,6 +35,8 @@ struct yogabook_wmi {
 	struct acpi_device *dig_adev;
 	struct device *kbd_dev;
 	struct device *dig_dev;
+	struct gpio_desc *backside_hall_gpio;
+	int backside_hall_irq;
 	struct work_struct work;
 	struct led_classdev kbd_bl_led;
 	unsigned long flags;
@@ -109,7 +115,10 @@ static void yogabook_wmi_work(struct work_struct *work)
 	if (test_bit(YB_SUSPENDED, &data->flags))
 		return;
 
-	if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
+	if (test_bit(YB_TABLET_MODE, &data->flags)) {
+		kbd_on = false;
+		digitizer_on = false;
+	} else if (test_bit(YB_DIGITIZER_MODE, &data->flags)) {
 		digitizer_on = true;
 		kbd_on = false;
 	} else {
@@ -171,6 +180,20 @@ static void yogabook_wmi_notify(struct wmi_device *wdev, union acpi_object *dumm
 	schedule_work(&data->work);
 }
 
+static irqreturn_t yogabook_backside_hall_irq(int irq, void *_data)
+{
+	struct yogabook_wmi *data = _data;
+
+	if (gpiod_get_value(data->backside_hall_gpio))
+		set_bit(YB_TABLET_MODE, &data->flags);
+	else
+		clear_bit(YB_TABLET_MODE, &data->flags);
+
+	schedule_work(&data->work);
+
+	return IRQ_HANDLED;
+}
+
 static enum led_brightness kbd_brightness_get(struct led_classdev *cdev)
 {
 	struct yogabook_wmi *data =
@@ -197,6 +220,19 @@ static int kbd_brightness_set(struct led_classdev *cdev,
 	return yogabook_wmi_set_kbd_backlight(wdev, data->brightness);
 }
 
+static struct gpiod_lookup_table yogabook_wmi_gpios = {
+	.dev_id		= "243FEC1D-1963-41C1-8100-06A9D82A94B4",
+	.table		= {
+		GPIO_LOOKUP("INT33FF:02", 18, "backside_hall_sw", GPIO_ACTIVE_LOW),
+		{}
+	},
+};
+
+static void yogabook_wmi_rm_gpio_lookup(void *unused)
+{
+	gpiod_remove_lookup_table(&yogabook_wmi_gpios);
+}
+
 static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 {
 	struct yogabook_wmi *data;
@@ -242,6 +278,36 @@ static int yogabook_wmi_probe(struct wmi_device *wdev, const void *context)
 		goto error_put_devs;
 	}
 
+	gpiod_add_lookup_table(&yogabook_wmi_gpios);
+
+	r = devm_add_action_or_reset(&wdev->dev, yogabook_wmi_rm_gpio_lookup, NULL);
+	if (r)
+		goto error_put_devs;
+
+	data->backside_hall_gpio =
+		devm_gpiod_get(&wdev->dev, "backside_hall_sw", GPIOD_IN);
+	if (IS_ERR(data->backside_hall_gpio)) {
+		r = PTR_ERR(data->backside_hall_gpio);
+		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw GPIO\n");
+		goto error_put_devs;
+	}
+
+	r = gpiod_to_irq(data->backside_hall_gpio);
+	if (r < 0) {
+		dev_err_probe(&wdev->dev, r, "Getting backside_hall_sw IRQ\n");
+		goto error_put_devs;
+	}
+	data->backside_hall_irq = r;
+
+	r = devm_request_irq(&wdev->dev, data->backside_hall_irq,
+			     yogabook_backside_hall_irq,
+			     IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
+			     "backside_hall_sw", data);
+	if (r) {
+		dev_err_probe(&wdev->dev, r, "Requesting backside_hall_sw IRQ\n");
+		goto error_put_devs;
+	}
+
 	schedule_work(&data->work);
 
 	data->kbd_bl_led.name = "ybwmi::kbd_backlight";
@@ -307,6 +373,9 @@ __maybe_unused int yogabook_wmi_resume(struct device *dev)
 
 	clear_bit(YB_SUSPENDED, &data->flags);
 
+	/* Check for YB_TABLET_MODE changes made during suspend */
+	schedule_work(&data->work);
+
 	return 0;
 }
 
-- 
2.33.1

