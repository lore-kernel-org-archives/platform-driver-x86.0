Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 037D7C433F5
	for <platform-driver-x86@archiver.kernel.org>; Sat, 25 Dec 2021 11:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231556AbhLYLz0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 25 Dec 2021 06:55:26 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29147 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231530AbhLYLzX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 25 Dec 2021 06:55:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640433322;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gXiTi4QZhvjDiAXYPd1g8ArlMmwurZfYmsymzXGVgrg=;
        b=T0Q6UvGA0czCPbFyjqGuz7hYPDgtudeqqTl+qW3BI0DiI6YFhpbT4FvOdQuj9+BKTssPE9
        csmrr6FxdHEREn82A9obQRCyBawlncIKgx6nWhW3NVUzfYJ7S55JRifyAE2gKYhVz3/W2o
        gGPkHnLIOpyz0rRcXrJAwotbH2JiZao=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-Z9oFd4aUMRy9a0u23CIK1Q-1; Sat, 25 Dec 2021 06:55:21 -0500
X-MC-Unique: Z9oFd4aUMRy9a0u23CIK1Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A545102CB29;
        Sat, 25 Dec 2021 11:55:20 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E98767C77D;
        Sat, 25 Dec 2021 11:55:18 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] mfd: intel_soc_pmic_crc: Set main IRQ domain bus token to DOMAIN_BUS_NEXUS
Date:   Sat, 25 Dec 2021 12:55:08 +0100
Message-Id: <20211225115509.94891-4-hdegoede@redhat.com>
In-Reply-To: <20211225115509.94891-1-hdegoede@redhat.com>
References: <20211225115509.94891-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

For the CRC PMIC we end up with multiple IRQ domains with the same fwnode.
One for the irqchip which demultiplexes the actual PMIC interrupt into
interrupts for the various cells (known as the level 1 interrupts);

And 2 more for the irqchips which are part of the crystal_cove_gpio
and crystal_cove_charger cells.

This leads to the following error being printed when
CONFIG_GENERIC_IRQ_DEBUGFS is enabled:
 debugfs: File '\_SB.I2C7.PMIC' in directory 'domains' already present!

Set the bus token of the main IRQ domain to DOMAIN_BUS_NEXUS to avoid
this error, this also allows irq_find_matching_fwspec() to find the
right domain if necessary.

Note all 3 domain registering drivers need to set the IRQ domain bus token.
This is necessary because the IRQ domain code defaults to creating
the debugfs dir with just the fwnode name and then renames it when
the bus token is set. So each one starts with the same default name and
all 3 must be given a different name to avoid problems when one of the
other drivers loads and starts with the same default name.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/mfd/intel_soc_pmic_core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
index 47cb7f00dfcf..5e8c94e008ed 100644
--- a/drivers/mfd/intel_soc_pmic_core.c
+++ b/drivers/mfd/intel_soc_pmic_core.c
@@ -64,6 +64,10 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
 	/* Add lookup table for crc-pwm */
 	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
 
+	/* To distuingish this domain from the GPIO/charger's irqchip domains */
+	irq_domain_update_bus_token(regmap_irq_get_domain(pmic->irq_chip_data),
+				    DOMAIN_BUS_NEXUS);
+
 	ret = mfd_add_devices(dev, -1, config->cell_dev,
 			      config->n_cell_devs, NULL, 0,
 			      regmap_irq_get_domain(pmic->irq_chip_data));
-- 
2.33.1

