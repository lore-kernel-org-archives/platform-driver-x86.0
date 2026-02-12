Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E02732D5944
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890467; cv=none; b=feRqrC5GCFZmUhIO7LVyoC6ocq48zto7be9FgLEh6iEQkp21cdZTvPURwsEqg0Savmmiqx6IyI5GjSfb57r1HDdvKinxR+N40kt9Po3+iIWC+NKe2Q6E/ssYxU0rYHCe8+MYRsq/gs1Pox6PTmXnNSR0YsceGg92fj/p2Gguafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890467; c=relaxed/simple;
	bh=pIrtFqER+rujAYaESra+lALd0WDXcpis3/iA5+55Tsc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMUgKWj7qO3FOw+6DY81RmNXhvmvbjwwsNqQDDd7+jMtlga9owv0znvVrMULeIoWwFVwx+LWmjWVR7iuw98J5iMrx4dXYQxMiA3e+Ioi5eiOC+kYY8+HdZpX5UiULQgs61FafUP/j2SEyt07CU7nKZKDrhj/E1y4iknUzcI47eY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lSSu5cqi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lSSu5cqi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F325C19424
	for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 10:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770890466;
	bh=pIrtFqER+rujAYaESra+lALd0WDXcpis3/iA5+55Tsc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=lSSu5cqibShJqqB7J3MMFigIVqUXA/nWpBUTcYsT64pYnmRWTOm2/wh/2y7e1nkUc
	 5Y6De9HvzQm1EyBQkRFXLWNgGbLx6Pr2QaxfDGUwpKtN14lrcTc+oDl2qaSXdomuqv
	 wNkK5N7FP/OocCm/UfZ/pLYbUmBhfsA6RfUU0YcHXfdcWI3fj2N1JPcPHpXdbk2xVV
	 3l1DEo85ndLaMb65a+lokq9ZXiqTZ6PmBjciOlthKwxU6lfFmFJeMk+OP2k54CIxAd
	 9x3/DA/7peEo5q1NNNZSWdzUV4wYcYSXV5WQiWhyw0ajryxXwkALdWZbYcaA/s6QDm
	 IPBar/Gi4MB9g==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so13485751fa.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 12 Feb 2026 02:01:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXin8VTwyAmZ4xYlZawpqTzFk8WjKWbnHKC5FdOnrAwnQRi+yHvx1Hk1Y12jAIN4vtSrvJlMZKmemv/VT7CANvR3cQT@vger.kernel.org
X-Gm-Message-State: AOJu0YwOhXFyfksV4099j+pn1vpgg3IDV6mkerjWudjine7/3Wnb9HqX
	kxjLlIVTbPoyyR71+056DEP/HU4zmkuKQOtjPOQgpoYbHvIu/1knW19oBxzpuae/PbfMAz/sP8+
	y9R/jncai6JPBymPwlGekhYd8RISwIDqvJzY84YMHLg==
X-Received: by 2002:a2e:a7cf:0:b0:333:e590:1bc9 with SMTP id
 38308e7fff4ca-38711012e98mr7027641fa.24.1770890464004; Thu, 12 Feb 2026
 02:01:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Feb 2026 02:01:02 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 12 Feb 2026 02:01:02 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aY1K7z5oYFmwMy2b@google.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aYkdKfP5fg6iywgr@jekhomev> <aYmV5Axyfo76D19T@smile.fi.intel.com>
 <CAMRc=MeouZAkuzynwUnZd-VsZq1nyEgbv-Bt6tNMXosApF7RDg@mail.gmail.com>
 <a285a632-4a3a-48f8-a34a-db595fa0e477@kernel.org> <aYnqY4KPq2Gqj3Dv@google.com>
 <CAMRc=McfHM62ZxKdn=QDAmpjExDZwtqhpkLU_=1GE27bbMsirg@mail.gmail.com>
 <aYoOKBMAsTuwHKK0@google.com> <CAMRc=MenKFwfT2g2-aUZUsoBdOMaA4m2krJ18Wir=Rwede9JfQ@mail.gmail.com>
 <aYpC_XWNXiRmEdzo@google.com> <CAMRc=MecKXHOZSpKfeWzEQLgcddsstbhRQHahD8Hky=3KP4QHA@mail.gmail.com>
 <aY1K7z5oYFmwMy2b@google.com>
Date: Thu, 12 Feb 2026 02:01:02 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
X-Gm-Features: AZwV_Qgpu0DM2wm3jLUcLeducmPDMUZHLocbmifZqcnSFSs89tGgI9razsMQudI
Message-ID: <CAMRc=MfdeQhgQd9FzUt5JtynerzR52yWndbVJ5Xu-eVUwtvgJg@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] platform/x86: x86-android-tablets: convert
 Goodix devices to GPIO references
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Arnd Bergmann <arnd@kernel.org>, platform-driver-x86@vger.kernel.org, 
	Yauhen Kharuzhy <jekhor@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Feb 2026 04:44:05 +0100, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
>>
>> Agreed, I'm not advocating for using lookup tables. I'm advocating for using
>> swnode correctly.
>
> I am curious how would you approach to fixing
> drivers/platform/x86/meraki-mx100.c ? The GPIOs in question belong to
> "gpio_ich" which is a cell of a MFD PCI device (lpc_ich).
>

Something like this (compile tested only):

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 4b7d0cb9340f1..ab9730dcd2688 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -45,6 +45,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/pinctrl/pinctrl.h>
+#include <linux/property.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -125,11 +126,15 @@ static struct mfd_cell lpc_ich_wdt_cell = {
 	.ignore_resource_conflicts = true,
 };

+const struct software_node lpc_ich_gpio_swnode = { };
+EXPORT_SYMBOL(lpc_ich_gpio_swnode);
+
 static struct mfd_cell lpc_ich_gpio_cell = {
 	.name = "gpio_ich",
 	.num_resources = ARRAY_SIZE(gpio_ich_res),
 	.resources = gpio_ich_res,
 	.ignore_resource_conflicts = true,
+	.swnode = &lpc_ich_gpio_swnode,
 };

 #define INTEL_GPIO_RESOURCE_SIZE	0x1000
diff --git a/drivers/platform/x86/meraki-mx100.c
b/drivers/platform/x86/meraki-mx100.c
index 8c5276d985123..ce60c79ff700e 100644
--- a/drivers/platform/x86/meraki-mx100.c
+++ b/drivers/platform/x86/meraki-mx100.c
@@ -20,16 +20,13 @@
 #include <linux/input-event-codes.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mfd/lpc_ich.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>

-#define TINK_GPIO_DRIVER_NAME "gpio_ich"
-
-static const struct software_node gpio_ich_node = {
-	.name = TINK_GPIO_DRIVER_NAME,
-};
-
 /* LEDs */
 static const struct software_node tink_gpio_leds_node = {
 	.name = "meraki-mx100-leds",
@@ -38,7 +35,7 @@ static const struct software_node tink_gpio_leds_node = {
 static const struct property_entry tink_internet_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:internet"),
 	PROPERTY_ENTRY_STRING("linux,default-trigger", "default-on"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 11, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 11, GPIO_ACTIVE_LOW),
 	{ }
 };

@@ -50,7 +47,7 @@ static const struct software_node tink_internet_led_node = {

 static const struct property_entry tink_lan2_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan2"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 18, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 18, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -62,7 +59,7 @@ static const struct software_node tink_lan2_led_node = {

 static const struct property_entry tink_lan3_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan3"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 20, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 20, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -74,7 +71,7 @@ static const struct software_node tink_lan3_led_node = {

 static const struct property_entry tink_lan4_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan4"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 22, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 22, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -86,7 +83,7 @@ static const struct software_node tink_lan4_led_node = {

 static const struct property_entry tink_lan5_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan5"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 23, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 23, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -98,7 +95,7 @@ static const struct software_node tink_lan5_led_node = {

 static const struct property_entry tink_lan6_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan6"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 32, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 32, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -110,7 +107,7 @@ static const struct software_node tink_lan6_led_node = {

 static const struct property_entry tink_lan7_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan7"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 34, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 34, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -122,7 +119,7 @@ static const struct software_node tink_lan7_led_node = {

 static const struct property_entry tink_lan8_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan8"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 35, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 35, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -134,7 +131,7 @@ static const struct software_node tink_lan8_led_node = {

 static const struct property_entry tink_lan9_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan9"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 36, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 36, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -146,7 +143,7 @@ static const struct software_node tink_lan9_led_node = {

 static const struct property_entry tink_lan10_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan10"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 37, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 37, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -158,7 +155,7 @@ static const struct software_node tink_lan10_led_node = {

 static const struct property_entry tink_lan11_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:lan11"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 48, GPIO_ACTIVE_HIGH),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 48, GPIO_ACTIVE_HIGH),
 	{ }
 };

@@ -170,7 +167,7 @@ static const struct software_node tink_lan11_led_node = {

 static const struct property_entry tink_ha_green_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:ha"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 16, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 16, GPIO_ACTIVE_LOW),
 	{ }
 };

@@ -182,7 +179,7 @@ static const struct software_node tink_ha_green_led_node = {

 static const struct property_entry tink_ha_orange_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:orange:ha"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 7, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 7, GPIO_ACTIVE_LOW),
 	{ }
 };

@@ -194,7 +191,7 @@ static const struct software_node
tink_ha_orange_led_node = {

 static const struct property_entry tink_usb_green_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:green:usb"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 21, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 21, GPIO_ACTIVE_LOW),
 	{ }
 };

@@ -206,7 +203,7 @@ static const struct software_node
tink_usb_green_led_node = {

 static const struct property_entry tink_usb_orange_led_props[] = {
 	PROPERTY_ENTRY_STRING("label", "mx100:orange:usb"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 19, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 19, GPIO_ACTIVE_LOW),
 	{ }
 };

@@ -230,7 +227,7 @@ static const struct software_node tink_gpio_keys_node = {
 static const struct property_entry tink_reset_key_props[] = {
 	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
 	PROPERTY_ENTRY_STRING("label", "Reset"),
-	PROPERTY_ENTRY_GPIO("gpios", &gpio_ich_node, 60, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("gpios", &lpc_ich_gpio_swnode, 60, GPIO_ACTIVE_LOW),
 	PROPERTY_ENTRY_U32("linux,input-type", EV_KEY),
 	PROPERTY_ENTRY_U32("debounce-interval", 100),
 	{ }
@@ -243,7 +240,6 @@ static const struct software_node tink_reset_key_node = {
 };

 static const struct software_node *tink_swnodes[] = {
-	&gpio_ich_node,
 	/* LEDs nodes */
 	&tink_gpio_leds_node,
 	&tink_internet_led_node,
diff --git a/include/linux/mfd/lpc_ich.h b/include/linux/mfd/lpc_ich.h
index 1fbda1f8967db..1819aa743c5c9 100644
--- a/include/linux/mfd/lpc_ich.h
+++ b/include/linux/mfd/lpc_ich.h
@@ -37,4 +37,6 @@ struct lpc_ich_info {
 	u8 use_gpio;
 };

+extern const struct software_node lpc_ich_gpio_swnode;
+
 #endif

Bart
