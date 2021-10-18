Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9D16C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 14:33:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A45DC60F93
	for <platform-driver-x86@archiver.kernel.org>; Mon, 18 Oct 2021 14:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232085AbhJROfv (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 18 Oct 2021 10:35:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45564 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232006AbhJROfs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 Oct 2021 10:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1634567616;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fUHl/wiNGmL1WcumGPQQzjf2AYhwqIpOf+nBqQEoFos=;
        b=ayA/4r/gKACmV/IiV9EGnVo+85SNcz4r9ddvDfuPMx/fEffV241BP4sFIzsAyZ/mPqXoLL
        XqNLW+8j8SU94UA+FzEEFZQ8k13xpTwweZhxdA+uFG2asTnYJ4D/7TS4bqLzkzTM9B5ffC
        m3iShPUDwQo4zH+5ok9bcP4Y8VfpkR0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-tbuaPWhaPt-Aq6-I7kK5xw-1; Mon, 18 Oct 2021 10:33:35 -0400
X-MC-Unique: tbuaPWhaPt-Aq6-I7kK5xw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17A6810168D0;
        Mon, 18 Oct 2021 14:33:34 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.56])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAC2100EA05;
        Mon, 18 Oct 2021 14:33:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, alsa-devel@alsa-project.org
Subject: [PATCH 2/3] platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht helpers
Date:   Mon, 18 Oct 2021 16:33:23 +0200
Message-Id: <20211018143324.296961-3-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
References: <20211018143324.296961-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the new soc_intel_is_byt/cht helpers to clean things up a bit.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel/int0002_vgpio.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel/int0002_vgpio.c b/drivers/platform/x86/intel/int0002_vgpio.c
index 569342aa8926..617dbf98980e 100644
--- a/drivers/platform/x86/intel/int0002_vgpio.c
+++ b/drivers/platform/x86/intel/int0002_vgpio.c
@@ -34,13 +34,11 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/soc.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/suspend.h>
 
-#include <asm/cpu_device_id.h>
-#include <asm/intel-family.h>
-
 #define DRV_NAME			"INT0002 Virtual GPIO"
 
 /* For some reason the virtual GPIO pin tied to the GPE is numbered pin 2 */
@@ -151,12 +149,6 @@ static struct irq_chip int0002_irqchip = {
 	.irq_set_wake		= int0002_irq_set_wake,
 };
 
-static const struct x86_cpu_id int0002_cpu_ids[] = {
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT, NULL),
-	X86_MATCH_INTEL_FAM6_MODEL(ATOM_AIRMONT, NULL),
-	{}
-};
-
 static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
 					unsigned long *valid_mask,
 					unsigned int ngpios)
@@ -167,15 +159,13 @@ static void int0002_init_irq_valid_mask(struct gpio_chip *chip,
 static int int0002_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct x86_cpu_id *cpu_id;
 	struct int0002_data *int0002;
 	struct gpio_irq_chip *girq;
 	struct gpio_chip *chip;
 	int irq, ret;
 
 	/* Menlow has a different INT0002 device? <sigh> */
-	cpu_id = x86_match_cpu(int0002_cpu_ids);
-	if (!cpu_id)
+	if (!soc_intel_is_byt() && !soc_intel_is_cht())
 		return -ENODEV;
 
 	irq = platform_get_irq(pdev, 0);
-- 
2.31.1

