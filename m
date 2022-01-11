Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DC51C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 11 Jan 2022 23:23:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346794AbiAKXXR (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 11 Jan 2022 18:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26685 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346782AbiAKXXQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 18:23:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641943395;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=Cot+llbUMJi8JG47UaWNlkyWrDAlXfQn7XWBsUFy95c=;
        b=JI3Y0zEQyaSzDmDue82qCiKFTirpbSVZSi4elcBL2NNkMA9VynB0zwKdHrjaxScE6QxJy3
        pkqYldMSleXEpDcLvbCtzuYeUgNHbblLD+CCXCIooi21IFD1IaDpARMXYjG3oM8X7wDvbF
        MYzpv/G/Q1fJCpVrT3MvWqNmE0s9zM0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-597-W_u4cDlJOOmrdwo1C_taAQ-1; Tue, 11 Jan 2022 18:23:12 -0500
X-MC-Unique: W_u4cDlJOOmrdwo1C_taAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA848042E0;
        Tue, 11 Jan 2022 23:23:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.195.151])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E714D56F9B;
        Tue, 11 Jan 2022 23:23:09 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: intel_crystal_cove_charger: Fix IRQ masking / unmasking
Date:   Wed, 12 Jan 2022 00:23:09 +0100
Message-Id: <20220111232309.377642-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The driver as originally submitted accidentally relied on Android having
run before and Android having unmasked the 2nd level IRQ-mask for the
charger IRQ. This worked since these are PMIC registers which are only
reset when the battery is fully drained or disconnected.

Fix the charger IRQ no longer working after loss of battery power by
properly setting the 2nd level IRQ-mask for the charger IRQ.

Note this removes the need to enable/disable our parent IRQ which just
sets the mask bit in the 1st level IRQ-mask register, setting one of
the 2 level masks is enough to stop the IRQ from getting reported.

Fixes: 761db353d9e2 ("platform/x86: Add intel_crystal_cove_charger driver")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../platform/x86/intel/crystal_cove_charger.c | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
index 0374bc742513..eeaa926d2058 100644
--- a/drivers/platform/x86/intel/crystal_cove_charger.c
+++ b/drivers/platform/x86/intel/crystal_cove_charger.c
@@ -17,6 +17,7 @@
 #include <linux/regmap.h>
 
 #define CHGRIRQ_REG					0x0a
+#define MCHGRIRQ_REG					0x17
 
 struct crystal_cove_charger_data {
 	struct mutex buslock; /* irq_bus_lock */
@@ -25,8 +26,8 @@ struct crystal_cove_charger_data {
 	struct irq_domain *irq_domain;
 	int irq;
 	int charger_irq;
-	bool irq_enabled;
-	bool irq_is_enabled;
+	u8 mask;
+	u8 new_mask;
 };
 
 static irqreturn_t crystal_cove_charger_irq(int irq, void *data)
@@ -53,13 +54,9 @@ static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *data)
 {
 	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
 
-	if (charger->irq_is_enabled != charger->irq_enabled) {
-		if (charger->irq_enabled)
-			enable_irq(charger->irq);
-		else
-			disable_irq(charger->irq);
-
-		charger->irq_is_enabled = charger->irq_enabled;
+	if (charger->mask != charger->new_mask) {
+		regmap_write(charger->regmap, MCHGRIRQ_REG, charger->new_mask);
+		charger->mask = charger->new_mask;
 	}
 
 	mutex_unlock(&charger->buslock);
@@ -69,14 +66,14 @@ static void crystal_cove_charger_irq_unmask(struct irq_data *data)
 {
 	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
 
-	charger->irq_enabled = true;
+	charger->new_mask &= ~BIT(data->hwirq);
 }
 
 static void crystal_cove_charger_irq_mask(struct irq_data *data)
 {
 	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
 
-	charger->irq_enabled = false;
+	charger->new_mask |= BIT(data->hwirq);
 }
 
 static void crystal_cove_charger_rm_irq_domain(void *data)
@@ -130,10 +127,13 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
 	irq_set_nested_thread(charger->charger_irq, true);
 	irq_set_noprobe(charger->charger_irq);
 
+	/* Mask the single 2nd level IRQ before enabling the 1st level IRQ */
+	charger->mask = BIT(0);
+	regmap_write(charger->regmap, MCHGRIRQ_REG, charger->mask);
+
 	ret = devm_request_threaded_irq(&pdev->dev, charger->irq, NULL,
 					crystal_cove_charger_irq,
-					IRQF_ONESHOT | IRQF_NO_AUTOEN,
-					KBUILD_MODNAME, charger);
+					IRQF_ONESHOT, KBUILD_MODNAME, charger);
 	if (ret)
 		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
 
-- 
2.33.1

