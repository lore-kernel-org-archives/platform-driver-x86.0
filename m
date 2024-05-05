Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABF978289
	for <platform-driver-x86@vger.kernel.org>; Sun,  5 May 2024 16:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714925329; cv=none; b=ssx/YSHX6KGAbbu9iXPvtumSCqygtYHaGlCkfgYS7pvZax3Sshvf4bipzTo+k/Zo/lSDRZONUV7WXazRTpNWw94En0p9AB5RoXbfWAvG5nYBIlnXsRKkxG3rmhXVVnUudkz6Ibgyj0NeBYqJlJ9vxY1XfS1EwmxQyKY3JWfHBzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714925329; c=relaxed/simple;
	bh=YmgSNq7gt9iyy/XrtZGIRXwGbKi0q8CXvCSHSwNFH50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fGQDLcv5PRikbFd7hFsjRgK+DVLa/9W2gmzWqQsLHIcrdfJOP7IrONZ6Z/Luz/Z8kxPt3lkr21hlTR5aa31j0UDQ7pu73kWiyrnzX9sscCPlY74GC6FAucqVbNh1Cppza+TyU5wUEzPZ9nA/lH1JHdI8+HJ0M2Z96dwLUTX1y2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Djhp/Df+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Djhp/Df+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714925326;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o9dWsGhJvtBGOTnE54EqZAJIgFM+IA7UeSkv3RdZvpE=;
	b=Djhp/Df+PUFbnHUlhBiQMxbTKM3xMWg+oM8pkzqUOAKuuqbovG7Nh9Hp03vsiLOXs8p8dF
	uYrNAhLqI6N41h0B8IlNNhYFG0BWtehHIfjir/MPHopP7lkrTqmXPXSa7bqgROimVj+aY9
	o5udECaIDkXEC0K19GsgWbqhp+spPLg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-264-OxZkP9grPE6eNmMxlp9ksw-1; Sun, 05 May 2024 12:08:42 -0400
X-MC-Unique: OxZkP9grPE6eNmMxlp9ksw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 23A2D1005E22;
	Sun,  5 May 2024 16:08:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 66B0AEC682;
	Sun,  5 May 2024 16:08:41 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 2/2] platform/x86: x86-android-tablets: Create LED device for Xiaomi Pad 2 bottom bezel touch buttons
Date: Sun,  5 May 2024 18:08:32 +0200
Message-ID: <20240505160832.44216-2-hdegoede@redhat.com>
In-Reply-To: <20240505160832.44216-1-hdegoede@redhat.com>
References: <20240505160832.44216-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

The Xiaomi [Mi]Pad 2 has 3 menu / home / back capacitive touch-buttons
on its bottom bezel. These are backlit by LEDs attached to a TPS61158 LED
controller which is controlled by the "pwm_soc_lpss_2" PWM output.

Create a LED class device for this, using the new input-events trigger
as default trigger so that the buttons automatically light up on any
input activity.

Note alternatively a "leds_pwm" platform device could be created together
with the necessary fwnode_s_ and a fwnode link to the PWM controller.
There are 2 downsides to this approach:

1. The code would still need to pwm_get() the PWM controller to get/attach
a fwnode for the PWM controller fwnode link and setting up the necessary
fwnodes is non trivial. So this would likely require more code then simply
registering the LED class device directly.

2. Currently the leds_pwm driver and its devicetree bindings do not support
limiting the maximum dutycycle to less then 100% which is required in this
case (the leds_pwm driver can probably  be extended to allow this).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/x86-android-tablets/other.c  | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index ff7b1d0abaa3..aa95645f3f24 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -11,7 +11,9 @@
 #include <linux/acpi.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
+#include <linux/leds.h>
 #include <linux/platform_device.h>
+#include <linux/pwm.h>
 
 #include <dt-bindings/leds/common.h>
 
@@ -662,8 +664,50 @@ static const struct software_node *ktd2026_node_group[] = {
 	NULL
 };
 
+/*
+ * For the LEDs which backlight the menu / home / back capacitive buttons on
+ * the bottom bezel. These are attached to a TPS61158 LED controller which
+ * is controlled by the "pwm_soc_lpss_2" PWM output.
+ */
+#define XIAOMI_MIPAD2_LED_PERIOD_NS		19200
+#define XIAOMI_MIPAD2_LED_MAX_DUTY		 6000 /* From Android kernel */
+
+static struct pwm_device *xiaomi_mipad2_led_pwm;
+
+static int xiaomi_mipad2_brightness_set(struct led_classdev *led_cdev,
+					enum led_brightness val)
+{
+	struct pwm_state state = {
+		.period = XIAOMI_MIPAD2_LED_PERIOD_NS,
+		.duty_cycle = val,
+		.enabled = !!val,
+	};
+
+	return pwm_apply_might_sleep(xiaomi_mipad2_led_pwm, &state);
+}
+
 static int __init xiaomi_mipad2_init(struct device *dev)
 {
+	struct led_classdev *led_cdev;
+	int ret;
+
+	xiaomi_mipad2_led_pwm = devm_pwm_get(dev, "pwm_soc_lpss_2");
+	if (IS_ERR(xiaomi_mipad2_led_pwm))
+		return dev_err_probe(dev, PTR_ERR(xiaomi_mipad2_led_pwm), "getting pwm\n");
+
+	led_cdev = devm_kzalloc(dev, sizeof(*led_cdev), GFP_KERNEL);
+	if (!led_cdev)
+		return -ENOMEM;
+
+	led_cdev->name = "mipad2:white:touch-buttons-backlight";
+	led_cdev->max_brightness = XIAOMI_MIPAD2_LED_MAX_DUTY;
+	led_cdev->brightness_set_blocking = xiaomi_mipad2_brightness_set;
+	led_cdev->default_trigger = "input-events";
+
+	ret = devm_led_classdev_register(dev, led_cdev);
+	if (ret)
+		return dev_err_probe(dev, ret, "registering LED\n");
+
 	return software_node_register_node_group(ktd2026_node_group);
 }
 
-- 
2.44.0

