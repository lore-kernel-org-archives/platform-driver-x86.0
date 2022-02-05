Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70319C433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  5 Feb 2022 19:14:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343827AbiBETOF (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 5 Feb 2022 14:14:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38134 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238602AbiBETOF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Feb 2022 14:14:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644088444;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xrBYIKIQly+xjuntd7ZX2chrvykNuuXjGJ0buChXjrY=;
        b=HoKWhLuptEt/gH5PGTKzLMLn5utkMWJw8aTpDDLYB21UiPheNTjzNmMo4Arr9N+q+P3u4W
        BZCaYy5r8iqZgt11ktXj42NX5ItVGQSmXGvAxf103MutJ4C6iUcZR/CIkwpX8wxKOW8beM
        0mjminZFjrh2OrWMzKyaTS/sohl45Sc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-vTiRlRjWMhO7cVmduxmg6g-1; Sat, 05 Feb 2022 14:14:03 -0500
X-MC-Unique: vTiRlRjWMhO7cVmduxmg6g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1F4BA835B47;
        Sat,  5 Feb 2022 19:14:02 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.37])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C06525C23A;
        Sat,  5 Feb 2022 19:14:00 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 3/6] platform/x86: x86-android-tablets: Add x86_android_tablet_get_gpiod() helper
Date:   Sat,  5 Feb 2022 20:13:53 +0100
Message-Id: <20220205191356.225505-3-hdegoede@redhat.com>
In-Reply-To: <20220205191356.225505-1-hdegoede@redhat.com>
References: <20220205191356.225505-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Factor the code to go from a gpiochip label + pin-numer to a gpio_desc
out of x86_acpi_irq_helper_get() and make it into a new
x86_android_tablet_get_gpiod() helper, as this will be necessary in some
x86_dev_info.init() functions too.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/x86-android-tablets.c | 35 ++++++++++++++--------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
index 45a951002401..40243ea3ae39 100644
--- a/drivers/platform/x86/x86-android-tablets.c
+++ b/drivers/platform/x86/x86-android-tablets.c
@@ -53,13 +53,33 @@ static int gpiochip_find_match_label(struct gpio_chip *gc, void *data)
 	return gc->label && !strcmp(gc->label, data);
 }
 
+static int x86_android_tablet_get_gpiod(char *label, int pin, struct gpio_desc **desc)
+{
+	struct gpio_desc *gpiod;
+	struct gpio_chip *chip;
+
+	chip = gpiochip_find(label, gpiochip_find_match_label);
+	if (!chip) {
+		pr_err("error cannot find GPIO chip %s\n", label);
+		return -ENODEV;
+	}
+
+	gpiod = gpiochip_get_desc(chip, pin);
+	if (IS_ERR(gpiod)) {
+		pr_err("error %ld getting GPIO %s %d\n", PTR_ERR(gpiod), label, pin);
+		return PTR_ERR(gpiod);
+	}
+
+	*desc = gpiod;
+	return 0;
+}
+
 static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 {
 	struct irq_fwspec fwspec = { };
 	struct irq_domain *domain;
 	struct acpi_device *adev;
 	struct gpio_desc *gpiod;
-	struct gpio_chip *chip;
 	unsigned int irq_type;
 	acpi_handle handle;
 	acpi_status status;
@@ -74,18 +94,9 @@ static int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
 		return irq;
 	case X86_ACPI_IRQ_TYPE_GPIOINT:
 		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
-		chip = gpiochip_find(data->chip, gpiochip_find_match_label);
-		if (!chip) {
-			pr_err("error cannot find GPIO chip %s\n", data->chip);
-			return -ENODEV;
-		}
-
-		gpiod = gpiochip_get_desc(chip, data->index);
-		if (IS_ERR(gpiod)) {
-			ret = PTR_ERR(gpiod);
-			pr_err("error %d getting GPIO %s %d\n", ret, data->chip, data->index);
+		ret = x86_android_tablet_get_gpiod(data->chip, data->index, &gpiod);
+		if (ret)
 			return ret;
-		}
 
 		irq = gpiod_to_irq(gpiod);
 		if (irq < 0) {
-- 
2.33.1

