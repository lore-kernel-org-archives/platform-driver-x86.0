Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636631A28C
	for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2024 09:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726477388; cv=none; b=o7vszSZekRVCd9FmytfLsv3oEO75fjsQEU6T02T+xc90Zict5QzBn9Lw3GLR5b2pgOKUKk4BuR9b/PNQ9eD9mNO9UwEDpJW68gSo1BAr+LvUZa9hVg/AvO27EYRt4JPxG1FiKF+GyyA3wjuCPBDdInVmRSpAePiLfaxviNJUaTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726477388; c=relaxed/simple;
	bh=CSN2LXlPpgXl4Y4UE3YrPP268HJoH/nZM+8cDtAjeEg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1CvyJy88mQXynCx7UdgN3AKNzurRryg013Qqzj7iADTaR1EnrIhsmzR5TpY3e8U/hA3C4qvAbgLhCtUU0se8hTPjUpAjBCLZ105/RfhH3EocQhMqIsX0cWGR3rDLuT8yu2vqa5EyUq5iwt+qgdUXBasxD/mvyYcx+LrgRMQL28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Iu0ofiap; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Iu0ofiap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726477385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gi5148LsH/W1E8v0brc/2dXKRRgAQKS0lZTVjsiS/wM=;
	b=Iu0ofiappKuVVrkKolwrT1bT2hBXjrfnObj36fP/5FjUfz0diPF+pUt8qdwXNtCMHgXdWG
	wmWjXNdbIEZfn0J/oLGqVShcycpeFkE555jLTZyk4OUGQjuWdSdqG6FICTuC1qpMkE/krp
	3QG5+sR7zWIOKX+V85Cvjaogs9GXMyA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-NIvGr-Q_PYaKxB6PBHJ60A-1; Mon,
 16 Sep 2024 05:03:02 -0400
X-MC-Unique: NIvGr-Q_PYaKxB6PBHJ60A-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 11DE11955F44;
	Mon, 16 Sep 2024 09:03:01 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9892D30001AB;
	Mon, 16 Sep 2024 09:02:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: x86-android-tablets: Adjust Xiaomi Pad 2 bottom bezel touch buttons LED
Date: Mon, 16 Sep 2024 11:02:55 +0200
Message-ID: <20240916090255.35548-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The "input-events" LED trigger used to turn on the backlight LEDs had to
be rewritten to use led_trigger_register_simple() + led_trigger_event()
to fix a serious locking issue.

This means it no longer supports using blink_brightness to set a per LED
brightness for the trigger and it no longer sets LED_CORE_SUSPENDRESUME.

Adjust the MiPad 2 bottom bezel touch buttons LED class device to match:

1. Make LED_FULL the maximum brightness to fix the LED brightness
   being very low when on.
2. Set flags = LED_CORE_SUSPENDRESUME.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets/other.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/other.c b/drivers/platform/x86/x86-android-tablets/other.c
index aad7114c43c3..76cce8120bd2 100644
--- a/drivers/platform/x86/x86-android-tablets/other.c
+++ b/drivers/platform/x86/x86-android-tablets/other.c
@@ -670,7 +670,7 @@ static const struct software_node *ktd2026_node_group[] = {
  * is controlled by the "pwm_soc_lpss_2" PWM output.
  */
 #define XIAOMI_MIPAD2_LED_PERIOD_NS		19200
-#define XIAOMI_MIPAD2_LED_DEFAULT_DUTY		 6000 /* From Android kernel */
+#define XIAOMI_MIPAD2_LED_MAX_DUTY		 6000 /* From Android kernel */
 
 static struct pwm_device *xiaomi_mipad2_led_pwm;
 
@@ -679,7 +679,7 @@ static int xiaomi_mipad2_brightness_set(struct led_classdev *led_cdev,
 {
 	struct pwm_state state = {
 		.period = XIAOMI_MIPAD2_LED_PERIOD_NS,
-		.duty_cycle = val,
+		.duty_cycle = XIAOMI_MIPAD2_LED_MAX_DUTY * val / LED_FULL,
 		/* Always set PWM enabled to avoid the pin floating */
 		.enabled = true,
 	};
@@ -701,11 +701,11 @@ static int __init xiaomi_mipad2_init(struct device *dev)
 		return -ENOMEM;
 
 	led_cdev->name = "mipad2:white:touch-buttons-backlight";
-	led_cdev->max_brightness = XIAOMI_MIPAD2_LED_PERIOD_NS;
-	/* "input-events" trigger uses blink_brightness */
-	led_cdev->blink_brightness = XIAOMI_MIPAD2_LED_DEFAULT_DUTY;
+	led_cdev->max_brightness = LED_FULL;
 	led_cdev->default_trigger = "input-events";
 	led_cdev->brightness_set_blocking = xiaomi_mipad2_brightness_set;
+	/* Turn LED off during suspend */
+	led_cdev->flags = LED_CORE_SUSPENDRESUME;
 
 	ret = devm_led_classdev_register(dev, led_cdev);
 	if (ret)
-- 
2.46.0

