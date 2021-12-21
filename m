Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3399C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 21 Dec 2021 15:12:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239082AbhLUPMw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:12:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52931 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239076AbhLUPMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Dec 2021 10:12:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640099569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9EdtllV9zCXDP17PlqEZ8MXvNPkwFWrimMq0u0Qo2lQ=;
        b=XxswLIhqwzOK/Zifdo1227CrtHtGq+dG/do8yisDyamyTWXGXpUmePHcR0I83d8/+ucML6
        jMYmcmLpcPLXRBxj9pf3HK++kEZbac4vqT8fyvUGQxJFx0Ue9UkFgk6mNiVljxItZcLOSf
        7cxyiMOwNEry4QyFRua8kdN8cOHj534=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-271-qaZFnoM9NzyTGBn3kJI1Og-1; Tue, 21 Dec 2021 10:12:46 -0500
X-MC-Unique: qaZFnoM9NzyTGBn3kJI1Og-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B3E343C9;
        Tue, 21 Dec 2021 15:12:45 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.125])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A37DA5D6B1;
        Tue, 21 Dec 2021 15:12:44 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 1/2] platform/x86: Add x86-acpi-irq-helpers.h
Date:   Tue, 21 Dec 2021 16:12:42 +0100
Message-Id: <20211221151243.66216-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add helper code to get Linux IRQ numbers given a description of the IRQ
source (either IOAPIC index, or GPIO chip name + pin-number).

This is intended to be used to lookup Linux IRQ numbers in cases where the
ACPI description for a device somehow lacks this info. This is only meant
for use on x86 ACPI platforms.

This code is big/complex enough to warrant sharing, but too small to live
in its own module, therefor x86_acpi_irq_helper_get() is defined as
a static inline helper function.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v2:
- New patch in v2 of this patch-set
---
 drivers/platform/x86/x86-acpi-irq-helpers.h | 82 +++++++++++++++++++++
 1 file changed, 82 insertions(+)
 create mode 100644 drivers/platform/x86/x86-acpi-irq-helpers.h

diff --git a/drivers/platform/x86/x86-acpi-irq-helpers.h b/drivers/platform/x86/x86-acpi-irq-helpers.h
new file mode 100644
index 000000000000..2b3c02c47563
--- /dev/null
+++ b/drivers/platform/x86/x86-acpi-irq-helpers.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Helper code to get Linux IRQ numbers given a description of the IRQ source
+ * (either IOAPIC index, or GPIO chip name + pin-number).
+ *
+ * This is intended to be used to lookup Linux IRQ numbers in cases where the
+ * ACPI description for a device somehow lacks this info. This is only meant
+ * for use on x86 ACPI platforms.
+ */
+
+#include <linux/acpi.h>
+#include <linux/irq.h>
+#include <linux/string.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+
+/* For gpio_get_desc which is EXPORT_SYMBOL_GPL() */
+#include "../../gpio/gpiolib.h"
+
+enum x86_acpi_irq_type {
+	X86_ACPI_IRQ_TYPE_NONE,
+	X86_ACPI_IRQ_TYPE_APIC,
+	X86_ACPI_IRQ_TYPE_GPIOINT,
+};
+
+struct x86_acpi_irq_data {
+	char *gpio_chip; /* GPIO chip label for X86_ACPI_IRQ_TYPE_GPIOINT */
+	enum x86_acpi_irq_type type;
+	int index;
+	int trigger;  /* ACPI_EDGE_SENSITIVE / ACPI_LEVEL_SENSITIVE */
+	int polarity; /* ACPI_ACTIVE_HIGH / ACPI_ACTIVE_LOW / ACPI_ACTIVE_BOTH */
+};
+
+static int x86_acpi_irq_helper_gpiochip_find(struct gpio_chip *gc, void *data)
+{
+	return gc->label && !strcmp(gc->label, data);
+}
+
+static inline int x86_acpi_irq_helper_get(const struct x86_acpi_irq_data *data)
+{
+	struct gpio_desc *gpiod;
+	struct gpio_chip *chip;
+	unsigned int irq_type;
+	int irq, ret;
+
+	switch (data->type) {
+	case X86_ACPI_IRQ_TYPE_APIC:
+		irq = acpi_register_gsi(NULL, data->index, data->trigger, data->polarity);
+		if (irq < 0)
+			pr_err("error %d getting APIC IRQ %d\n", irq, data->index);
+
+		return irq;
+	case X86_ACPI_IRQ_TYPE_GPIOINT:
+		/* Like acpi_dev_gpio_irq_get(), but without parsing ACPI resources */
+		chip = gpiochip_find(data->gpio_chip, x86_acpi_irq_helper_gpiochip_find);
+		if (!chip)
+			return -EPROBE_DEFER;
+
+		gpiod = gpiochip_get_desc(chip, data->index);
+		if (IS_ERR(gpiod)) {
+			ret = PTR_ERR(gpiod);
+			pr_err("error %d getting GPIO %s %d\n", ret,
+			       data->gpio_chip, data->index);
+			return ret;
+		}
+
+		irq = gpiod_to_irq(gpiod);
+		if (irq < 0) {
+			pr_err("error %d getting IRQ %s %d\n", irq,
+			       data->gpio_chip, data->index);
+			return irq;
+		}
+
+		irq_type = acpi_dev_get_irq_type(data->trigger, data->polarity);
+		if (irq_type != IRQ_TYPE_NONE && irq_type != irq_get_trigger_type(irq))
+			irq_set_irq_type(irq, irq_type);
+
+		return irq;
+	default:
+		return 0;
+	}
+}
-- 
2.33.1

